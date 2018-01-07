package com.scinter.www.controller;
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

import com.base.controller.BaseController;
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
public class OrderController extends BaseController{

	private Logger logger = Logger.getLogger(OrderController.class);

	@Autowired
	private  OrderInfoMapper orderMapper;
	@Autowired
	private SysLogMapper sysLogMapper;
	@Autowired
	private DesignerMapper designerMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private RoleMapper roleMapper;
	/**
	 * 实现在线订单的列表页信息的保存
	 * @param response		用于动态响应客户端请示
	 */
	@RequestMapping("saveOrder")
	@ResponseBody
	public  void saveOrder(OrderInfo order,HttpServletResponse response,HttpServletRequest request,HttpSession session) {
		logger.info("order");
		int num = 0;
		order.setCreateTime(new Date());
//		0 未处理 1 处理中 2 已处理
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
				sentEmail(order.getBranchCompany(),user.getEmail(),order, request, session, response);
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
		 * 下拉选项 ，获取所有的设计师
		 * @param response
		 */
	
		@RequestMapping("orderLine")
		public ModelAndView orderLine(
				@RequestParam(value="designerName",required=false,defaultValue="") String designerName,
				@RequestParam(value="designerSex",required=false,defaultValue="") String designerSex,
				HttpServletResponse response,HttpSession session,HttpServletRequest request) {
			
			/*配置共有的信息*/
			super.getHomeMessage(request, session);
			ModelAndView model = new ModelAndView();
//			获取当前的楼盘信息
			String myBranchCompany	= (String) session.getAttribute("branchCompany");
			DesignerExample dx = new DesignerExample();
			Criteria criteria = dx.createCriteria();
			criteria.andStatusNotEqualTo(3);//非删除状态
//			查询分公司的信息
		    if(null != myBranchCompany && myBranchCompany.length()>0){
		    	criteria.andBranchCompanyEqualTo(myBranchCompany);
			}else{
				myBranchCompany = "bjsc";
				criteria.andBranchCompanyEqualTo(myBranchCompany);
			}
			dx.setOrderByClause("designer_id desc");
			List<Designer> designerList = designerMapper.selectByExample(dx);
//			马上预约获取，预约设计师的名称
			if(StringUtils.isNotBlank(request. getParameter("designerName"))){
				try {
					designerName = new String(request. getParameter("designerName").getBytes("ISO8859-1"),"UTF-8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				model.addObject("designerName", designerName);
			}
			// 马上预约，预约设计师的性别
			if(StringUtils.isNotBlank(designerSex)){
				try {
					designerSex = new String(designerSex.getBytes("ISO8859-1"),"UTF-8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					logger.info(e.getMessage());
				}
				model.addObject("designerSex", designerSex);
			}
			model.addObject("designerList",designerList);
			model.addObject("currentBCompany", myBranchCompany);
			model.addObject("type","在线订单");
			model.setViewName("/www/orderLine");
			return model;
		}
		
		

		/**
		 * 
		 * 发送邮件
		 */
		public void sentEmail(String branchCompany,String email,OrderInfo order,HttpServletRequest request,HttpSession session,HttpServletResponse response) {
			
			if(branchCompany.equals("bjsc"))
				branchCompany = "北京三创";
			else if(branchCompany.equals("bdsc"))
				branchCompany = "保定三创";
			else if(branchCompany.equals("sjzsc"))
				branchCompany = "石家庄三创";
			else if(branchCompany.equals("lfsc"))
				branchCompany = "廊坊三创";
			else if(branchCompany.equals("tssc"))
				branchCompany = "唐山三创";
			else if(branchCompany.equals("hssc"))
				branchCompany = "衡水三创";
			else if(branchCompany.equals("tysc"))
				branchCompany = "太原三创";
			else if(branchCompany.equals("tjsc"))
				branchCompany = "天津三创";
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
		 *石家庄315
		 * @return
		 * sourceType 网站来源(eg:腾讯新闻(tcxw)、新洲新站(xzPc))
		 */
		@RequestMapping("orderLineForOtherway")
		public ModelAndView orderLineForXzPc(HttpServletResponse response,HttpSession session,HttpServletRequest request){
			// 获取公共信息
			ModelAndView model = new ModelAndView();
			session.setAttribute("branchCompany", "sjzsc");
			super.getHomeMessage(request, session);
			model.setViewName("/www/bd315");
			return model;
			    	
		}
				
		
		/**
		 * 从其他方式下单(eg:315)
		 * @param order
		 * @param response
		 * @param request
		 * @param session
		 * @author zzw
		 */
		@RequestMapping("saveOrderByOtherway")
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
					sentEmail(order.getBranchCompany() ,user.getEmail(),order, request, session, response);
				}
			} 
			
	        // 日志记录
			if(num>0){
				JsonPrintUtil.printObjData(response, "ok");
			}else{
				
				JsonPrintUtil.printObjData(response, "error");
			}
		}
		
		
}
