package com.rbw.mobile.controller;
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

import com.rbw.mBase.controller.MbaseController;
import com.rbw.www.dao.DesignerMapper;
import com.rbw.www.dao.OrderInfoMapper;
import com.rbw.www.dao.RoleMapper;
import com.rbw.www.dao.SysConfigMapper;
import com.rbw.www.dao.SysLogMapper;
import com.rbw.www.dao.UserMapper;
import com.rbw.www.model.Designer;
import com.rbw.www.model.DesignerExample;
import com.rbw.www.model.Role;
import com.rbw.www.model.RoleExample;
import com.rbw.www.model.SysConfigExample;
import com.rbw.www.model.User;
import com.rbw.www.model.UserExample;
import com.rbw.www.model.DesignerExample.Criteria;
import com.rbw.www.model.OrderInfo;
import com.rbw.www.util.DateUtil;
import com.rbw.www.util.JsonPrintUtil;
import com.rbw.www.util.SendEmailUtil;

@Controller
@RequestMapping("m")
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
	
	/**
	 * 实现在线订单的列表页信息的保存
	 * @param response		用于动态响应客户端请示
	 */
	@RequestMapping("saveOrder")
	@ResponseBody
	public  void saveMOrder(OrderInfo order,HttpServletResponse response,HttpServletRequest request,HttpSession session) {
		
		int num = 0;
		order.setCreateTime(new Date());
//		获取session 中的 BranchCompany
		String branchCompany	= (String) session.getAttribute("branchCompany");
		
//		0 未处理 1 处理中 2 已处理
		order.setOrderStatus(0);
		order.setStatus(1);
		num = orderMapper.insert(order);

		RoleExample re = new RoleExample();
		com.rbw.www.model.RoleExample.Criteria rec =  re.createCriteria();
		re.or().andBranchCompanyEqualTo(branchCompany).andStatusEqualTo(1);
		re.or().andRoleNameEqualTo("超级管理员").andStatusEqualTo(1);
		List<Role> curentRole = roleMapper.selectByExample(re);
		for(Role role:curentRole){
			
			UserExample ue = new UserExample();
			com.rbw.www.model.UserExample.Criteria uec = ue.createCriteria();
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
		
		@RequestMapping("order")
		public ModelAndView Morder(
				@RequestParam(value="designerName",required=false,defaultValue="") String designerName,
				@RequestParam(value="designerSex",required=false,defaultValue="") String designerSex,
				HttpServletResponse response,HttpSession session,HttpServletRequest request) throws UnsupportedEncodingException {
			
			super.getPublicMes(request, session);
			ModelAndView model = new ModelAndView();
			String branchCompany	= (String) session.getAttribute("branchCompany");

			DesignerExample dx = new DesignerExample();
			Criteria criteria = dx.createCriteria();
			criteria.andStatusNotEqualTo(3);//非删除状态
			// 查询分公司的信息
		    if(null != branchCompany && branchCompany.length()>0){
		    	
		    	criteria.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "sjzrbw1";
				criteria.andBranchCompanyEqualTo(branchCompany);
			}
			dx.setOrderByClause("designer_id desc");
			List<Designer> designerList = designerMapper.selectByExample(dx);
			
			// 马上预约获取，预约设计师的名称
			if(StringUtils.isNotBlank(designerName)){
				designerName = new String(designerName.getBytes("ISO8859-1"),"UTF-8");
				model.addObject("designerName", designerName);
			}
			// 马上预约，预约设计师的性别
			if(StringUtils.isNotBlank(designerSex)){
				try {
					designerSex = new String(designerSex.getBytes("ISO8859-1"),"UTF-8");
				} catch (UnsupportedEncodingException e) {
					logger.info(e.getMessage());
				}
				model.addObject("designerSex", designerSex);
			}
			model.addObject("branchCompany", branchCompany);
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
			
			
			if(branchCompany.equals("sjzrbw1"))
				branchCompany = "石家庄瑞博文";
			else if(branchCompany.equals("bdrbw1"))
				branchCompany = "保定瑞博文";
			else if(branchCompany.equals("hsrbw1"))
				branchCompany = "衡水瑞博文";
			else if(branchCompany.equals("lfrbw1"))
				branchCompany = "廊坊瑞博文";
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
}
