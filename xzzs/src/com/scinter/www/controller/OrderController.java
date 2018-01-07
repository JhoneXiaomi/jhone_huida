package com.scinter.www.controller;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.mail.EmailException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.scinter.base.baseController.BaseController;
import com.scinter.www.dao.CaseShowImageMapper;
import com.scinter.www.dao.CasesMapper;
import com.scinter.www.dao.DesignerMapper;
import com.scinter.www.dao.OrderInfoMapper;
import com.scinter.www.dao.RoleMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.dao.SysLogMapper;
import com.scinter.www.dao.UserMapper;
import com.scinter.www.model.CaseShowImageExample;
import com.scinter.www.model.Cases;
import com.scinter.www.model.CasesExample;
import com.scinter.www.model.Designer;
import com.scinter.www.model.DesignerExample;
import com.scinter.www.model.OrderInfoExample;
import com.scinter.www.model.Role;
import com.scinter.www.model.RoleExample;
import com.scinter.www.model.SysConfig;
import com.scinter.www.model.SysConfigExample;
import com.scinter.www.model.DesignerExample.Criteria;
import com.scinter.www.model.OrderInfo;
import com.scinter.www.model.User;
import com.scinter.www.model.UserExample;
import com.scinter.www.util.DateUtil;
import com.scinter.www.util.JsonPrintUtil;
import com.scinter.www.util.SendEmailUtil;

@Controller
public class OrderController extends BaseController {

	@Autowired
	private  OrderInfoMapper orderMapper;
	@Autowired
	private SysLogMapper sysLogMapper;
	@Autowired
	private DesignerMapper designerMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	@Autowired
	private CasesMapper caseMapper;
	@Autowired
	private OrderInfoMapper orderInfoMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private RoleMapper roleMapper;
	@Autowired
	private CaseShowImageMapper caseShowImageMapper;
	/**
	 * 订单保存
	 * @author JhoneZhang
	 * @date   2016年8月22日上午8:25:29
	 * @param order              订单实体类
	 * @param response			 
	 * @param request
	 * @param session
	 */
	@RequestMapping("saveOrder")
	@ResponseBody
	public  void saveOrder(OrderInfo order,HttpServletResponse response,HttpServletRequest request,HttpSession session) {
		int num = 0;
        // 0 未处理 1 处理中 2 已处理
		order.setCreateTime(new Date());
		order.setOrderStatus(0);
		order.setStatus(1);
		num = orderMapper.insert(order);
		String branchCompany = (String)session.getAttribute("branchCompany");
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
	
		/**
		 * 初始化获取设计师列表
		 * @author JhoneZhang
		 * @date   2016年8月22日上午8:34:12
		 * @param designerName					设计师姓名
		 * @param response
		 * @param session
		 * @return								modelAndView
		 */
		@RequestMapping("orderLine")
		public ModelAndView orderLine(
				@RequestParam(value="designerName",defaultValue="",required=false) String designerName,
				@RequestParam(value="designerSex",defaultValue="",required=false) String designerSex,
				@RequestParam(value="address",defaultValue="",required=false) String address,
				HttpServletResponse response,HttpSession session) {
			
			// 获取公共信息
			super.getPublicMes(session);
			ModelAndView model = new ModelAndView();
			// 获取当前设计师信息
			String myBranchCompany	= (String) session.getAttribute("branchCompany");
	        if(StringUtils.isNotBlank(designerName)){
	        	try {
	        		designerName = new String(designerName.getBytes("iso-8859-1"),"UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
	        	model.addObject("designerName", designerName);
	        }
	        if(StringUtils.isNotBlank(designerSex)){
	        	try {
	        		designerSex = new String(designerSex.getBytes("iso-8859-1"),"UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
	        	model.addObject("designerSex", designerSex);
	        }
	        
	        if(StringUtils.isNotBlank(address)){
	        	try {
	        		address = new String(address.getBytes("iso-8859-1"),"UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
	        	model.addObject("address", address);
	        }
	        /*获取设计师的列表*/
			DesignerExample dx = new DesignerExample();
			Criteria criteria = dx.createCriteria();
			// 设计师非删除状态
			criteria.andStatusNotEqualTo(3);
			// 查询分公司的信息
		    if(StringUtils.isNotBlank(myBranchCompany)){
		    	criteria.andBranchCompanyEqualTo(myBranchCompany);
			}else{
				myBranchCompany = "bjxz";
				criteria.andBranchCompanyEqualTo(myBranchCompany);
			}
			dx.setOrderByClause("designer_id desc");
			List<Designer> designerList = designerMapper.selectByExample(dx);
			
			OrderInfoExample orderInfoE = new OrderInfoExample();
			com.scinter.www.model.OrderInfoExample.Criteria orderInfoC = orderInfoE.createCriteria();
			orderInfoC.andOrderStatusNotEqualTo(3);
			orderInfoC.andClientNameNotEqualTo("");
			orderInfoC.andPhoneNotEqualTo("");
			orderInfoC.andBranchCompanyEqualTo(myBranchCompany);
			List<OrderInfo> orders = orderInfoMapper.selectByExample(orderInfoE);
			// 获取案例的列表页
			CasesExample casesE = new CasesExample();
		    com.scinter.www.model.CasesExample.Criteria casesC = casesE.createCriteria();
		    casesC.andBranchCompanyEqualTo(myBranchCompany);
		    casesC.andCaseStatusNotEqualTo(3);
		    casesE.setOrderByClause("create_time desc");
		    List<Cases> casesList = caseMapper.selectByExample(casesE);
		    model.addObject("orders", orders);
		    model.addObject("casesList", casesList);
			model.addObject("designerList",designerList);
			model.addObject("myBranchCompany", myBranchCompany);
			model.setViewName("/www/order");
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
		
		
		
		
	
		
		
		/**
		 * 从其他方式下单(eg:今日头条)
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
