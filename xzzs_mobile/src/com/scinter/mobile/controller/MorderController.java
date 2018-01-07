package com.scinter.mobile.controller;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.mail.EmailException;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.scinter.mBase.controller.MbaseController;
import com.scinter.www.dao.CasesMapper;
import com.scinter.www.dao.DesignerMapper;
import com.scinter.www.dao.OrderInfoMapper;
import com.scinter.www.dao.RoleMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.dao.SysLogMapper;
import com.scinter.www.dao.UserMapper;
import com.scinter.www.model.Cases;
import com.scinter.www.model.CasesExample;
import com.scinter.www.model.Designer;
import com.scinter.www.model.DesignerExample;
import com.scinter.www.model.Role;
import com.scinter.www.model.RoleExample;
import com.scinter.www.model.SysConfig;
import com.scinter.www.model.SysConfigExample;
import com.scinter.www.model.User;
import com.scinter.www.model.UserExample;
import com.scinter.www.model.DesignerExample.Criteria;
import com.scinter.www.model.OrderInfo;
import com.scinter.www.util.DateUtil;
import com.scinter.www.util.JsonPrintUtil;
import com.scinter.www.util.SendEmailUtil;

@Controller
public class MorderController extends MbaseController{

	private Logger logger = Logger.getLogger(MorderController.class);

	@Autowired
	private  OrderInfoMapper orderMapper;
	@Autowired
	private SysLogMapper sysLogMapper;
	@Autowired
	private DesignerMapper designerMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	@Autowired
	private RoleMapper roleMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private CasesMapper caseMapper;
	/**
	 * 实现在线订单的列表页信息的保存
	 * @param response		用于动态响应客户端请示
	 */
	@RequestMapping("MsaveOrder")
	@ResponseBody
	public  void saveMOrder(OrderInfo order,HttpServletResponse response,HttpServletRequest request,HttpSession session) {

		int num = 0;
		order.setCreateTime(new Date());
		
		// 0 未处理 1 处理中 2 已处理
		order.setOrderStatus(0);
		order.setStatus(1);
		num = orderMapper.insert(order);

		RoleExample re = new RoleExample();
		re.or().andBranchCompanyEqualTo(order.getBranchCompany()).andStatusEqualTo(1);
		re.or().andRoleNameEqualTo("超级管理员").andStatusEqualTo(1);
		List<Role> curentRole = roleMapper.selectByExample(re);
		for(Role role:curentRole){
			
			UserExample ue = new UserExample();
			com.scinter.www.model.UserExample.Criteria uec = ue.createCriteria();
			uec.andRoleIdEqualTo(role.getRoleId());
			uec.andStatusEqualTo(1);
			uec.andIsUserEqualTo("是");
			List<User> userList = userMapper.selectByExample(ue);
			for(User user:userList){
				sentEmail(order.getBranchCompany() ,user.getEmail(),order, request, session, response);
			}
		} 
		
		if(num>0){
			logger.info("saveOrderInfo success!");
			JsonPrintUtil.printObjData(response, "ok");
		}else{
			
			logger.info("saveOrderInfo error!");
			JsonPrintUtil.printObjData(response, "error");
		}
	}
	
	
	/**
	 * 订单保存
	 * 
	 * @author JhoneZhang
	 * @date   2016年11月18日上午8:11:05
	 * @param designerName
	 * @param designerSex
	 * @param response
	 * @param session
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("Morder")
	public ModelAndView Morder(
			@RequestParam(value="designerName",required=false,defaultValue="") String designerName,
			HttpServletResponse response,HttpSession session,HttpServletRequest request) throws UnsupportedEncodingException {
		
		super.getPublicMes(request, session);
		ModelAndView model = new ModelAndView();
		String MyBranchCompany	= (String) session.getAttribute("branchCompany");

		DesignerExample dx = new DesignerExample();
		Criteria criteria = dx.createCriteria();
		criteria.andStatusNotEqualTo(3);//非删除状态
		// 查询分公司的信息
	    if(null != MyBranchCompany && MyBranchCompany.length()>0){
	    	
	    	criteria.andBranchCompanyEqualTo(MyBranchCompany);
		}else{
			MyBranchCompany = "bjsc";
			criteria.andBranchCompanyEqualTo(MyBranchCompany);
		}
		dx.setOrderByClause("designer_id desc");
		List<Designer> designerList = designerMapper.selectByExample(dx);
		
		// 马上预约获取，预约设计师的名称
		if(StringUtils.isNotBlank(designerName)){
			
			designerName = new String(request. getParameter("designerName").getBytes("ISO8859-1"),"UTF-8");
		}
		model.addObject("designerName", designerName);
		model.addObject("MyBranchCompany", MyBranchCompany);
        model.addObject("designerList",designerList);
		model.addObject("type","在线订单");
		model.setViewName("/mobile/order");
		return model;
	}
	
	/**
	 * 
	 * 发送邮件
	 */
	public void sentEmail(String branchCompany,String email,OrderInfo order,HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		
		
		if(branchCompany.equals("bjxz"))
			branchCompany = "北京新洲";
		else if(branchCompany.equals("bdxz"))
			branchCompany = "保定新洲";
		else if(branchCompany.equals("sjzxz"))
			branchCompany = "石家庄新洲";
		else if(branchCompany.equals("lfxz"))
			branchCompany = "廊坊新洲";
		else if(branchCompany.equals("czxz"))
			branchCompany = "沧州新洲";
		else if(branchCompany.equals("zzxz"))
			branchCompany = "郑州新洲";
		else if(branchCompany.equals("jnxz"))
			branchCompany = "济南新洲";
		else if(branchCompany.equals("tsxz"))
			branchCompany = "唐山新洲";
		//邮件发送配置
		String smtp_server = (String)getValueByKeyName("smtp_server");//邮件SMTP服务器
		String email_address = (String)getValueByKeyName("email_address");//自动发送邮件的邮箱地址
		String email_password = (String)getValueByKeyName("email_password");//邮箱密码
		
		String dateTimeStr = DateUtil.getStr(new Date(), DateUtil.DATE_TIME_FORMAT_CN);
		String content = "您好！客户于"+dateTimeStr+
						"在后台提交了订单。"+
				        "订单隶属于"+branchCompany+
				        ",订单编号为："+order.getOrderId()+
						"，客户姓名为： "+order.getClientName()+
						"，客户手机号为："+order.getPhone()+
						"，订单面积为："+order.getAcreage()+
						"订单来源为："+order.getSourceType()+
						" ，请及时联系客户！";
		
		try {
			SendEmailUtil.sendEmail(smtp_server, 25, email_address, email_password, email_address,email, "在线客户通知", content);
		} catch (EmailException e) {
			
			System.out.println(e.getMessage());
		}
	}
	
	/**
	 * 
	 * 封装sysConfig 对象方法
	 * 
	 * @param keyName
	 * @return
	 */
	private Object getValueByKeyName(String keyName) {
		
		SysConfigExample cx = new SysConfigExample();
		SysConfigExample.Criteria criteria = cx.createCriteria();
		criteria.andKeyNameEqualTo(keyName);
		Object oValue = sysConfigMapper.selectByExample(cx).get(0).getValue();
		return oValue;
	}
		

	//张紫薇后续添加的方法
	/***
	 * 进入腾讯新闻页面
	 * @return
	 * sourceType 网站来源(腾讯新闻)
	 */
	@RequestMapping("MorderLineForOtherway")
	public ModelAndView orderLineForXzPc(HttpServletResponse response,HttpSession session,String sourceType){
		// 获取公共信息
		ModelAndView model = new ModelAndView();
		String branchCompany	= (String) session.getAttribute("branchCompany");
		//进入腾讯新闻
		// 腾讯新闻装修案例展示
        CasesExample casesExample = new CasesExample();
        com.scinter.www.model.CasesExample.Criteria criteriaCas = casesExample.createCriteria();
        criteriaCas.andCaseThumbImgNotEqualTo("");
        criteriaCas.andCaseStatusNotEqualTo(3);
	    if(null != branchCompany && branchCompany.length()>0){
	    	criteriaCas.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjxz";
			criteriaCas.andBranchCompanyEqualTo(branchCompany);
		}
        casesExample.setOrderByClause("case_id desc");
        List<Cases> CasesLists = caseMapper.selectByExample(casesExample);
		model.addObject("casesList", CasesLists);
		model.setViewName("/mobile/txxw");
		
		  return model;
		    	
	}
			
			
	/**
	 * 从其他方式下单(eg:腾讯新闻)
	 * @param order
	 * @param response
	 * @param request
	 * @param session
	 * @author zzw
	 */
	@RequestMapping("MsaveOrderByOtherway")
	@ResponseBody
	public  void saveOrderByOtherway(OrderInfo order,HttpServletResponse response,HttpServletRequest request,HttpSession session) {
		int num = 0;
		// 0 未处理 1 处理中 2 已处理
		order.setCreateTime(new Date());
		order.setOrderStatus(0);
		order.setStatus(1);
		num = orderMapper.insert(order);
		String branchCompany = order.getBranchCompany();
		RoleExample re = new RoleExample();
		re.or().andBranchCompanyEqualTo(branchCompany).andStatusEqualTo(1);
		re.or().andRoleNameEqualTo("超级管理员").andStatusEqualTo(1);
		List<Role> curentRole = roleMapper.selectByExample(re);
		for(Role role:curentRole){
			UserExample ue = new UserExample();
			com.scinter.www.model.UserExample.Criteria uec = ue.createCriteria();
			uec.andRoleIdEqualTo(role.getRoleId());
			uec.andStatusEqualTo(1);
			uec.andIsUserEqualTo("是");
			List<User> userList = userMapper.selectByExample(ue);
			for(User user:userList){
				sentEmailByOtherway(order.getBranchCompany() ,user.getEmail(),order, request, session, response);
				}
			} 
				
		 // 日志记录
		if(num>0){
			JsonPrintUtil.printObjData(response, "ok");
			}else{
					
				JsonPrintUtil.printObjData(response, "error");
			}
		}
			
			
			
	/**
	 * @author zzw
	 * 从其他方式下单发送邮件(eg:今日头条) 
	 */
	public void sentEmailByOtherway(String branchCompany,String email,OrderInfo order,HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		if(branchCompany.equals("bjxz"))
			branchCompany = "北京新洲";
		else if(branchCompany.equals("bdxz"))
			branchCompany = "保定新洲";
		else if(branchCompany.equals("sjzxz"))
			branchCompany = "石家庄新洲";
		else if(branchCompany.equals("tyxz"))
			branchCompany = "太原新洲";
		else if(branchCompany.equals("tjxz"))
			branchCompany = "天津新洲";
		else if(branchCompany.equals("lfxz"))
			branchCompany = "廊坊新洲";
		else if(branchCompany.equals("czxz"))
			branchCompany = "沧州新洲";
		else if(branchCompany.equals("zzxz"))
			branchCompany = "郑州新洲";
		else if(branchCompany.equals("jnxz"))
			branchCompany = "济南新洲";
		else if(branchCompany.equals("tsxz"))
			branchCompany = "唐山新洲";
		else if(branchCompany.equals("cqxz"))
			branchCompany = "重庆新洲";
		else if(branchCompany.equals("tyxz"))
			branchCompany = "太原新洲";
		else if(branchCompany.equals("hfxz"))
			branchCompany = "合肥新洲";
		else if(branchCompany.equals("yjxz"))
			branchCompany = "燕郊新洲";
		else if(branchCompany.equals("dcxz"))
			branchCompany = "大厂新洲";
		else if(branchCompany.equals("hsxz"))
			branchCompany = "衡水新洲";
		else if(branchCompany.equals("ayxz"))
			branchCompany = "安阳新洲";
				//邮件发送配置
		String smtp_server = (String)getValueByKeyName("smtp_server");//邮件SMTP服务器
		String email_address = (String)getValueByKeyName("email_address");//自动发送邮件的邮箱地址
		String email_password = (String)getValueByKeyName("email_password");//邮箱密码
				
		System.out.println("smtp_server："+smtp_server+"email_address："+email_address+"email_password"+email_password);
		String dateTimeStr = DateUtil.getStr(new Date(), DateUtil.DATE_TIME_FORMAT_CN);
		String content = "您好！客户于"+dateTimeStr+
						"在后台提交了订单。"+
						"订单隶属于"+branchCompany+
						",订单编号为："+order.getOrderId()+
						"，客户姓名为： "+order.getClientName()+
						"，客户手机号为："+order.getPhone()+
						"，订单面积为："+order.getAcreage()+
						"，装修风格为："+order.getStyle()+
						"订单来源为："+order.getSourceType()+
						" ，请及时联系客户！";

		try {
			SendEmailUtil.sendEmail(smtp_server, 25, email_address, email_password, email_address,email, "在线客户通知", content);
			} catch (EmailException e) {
				System.out.println(e.getMessage());
			}
		}
			
}
