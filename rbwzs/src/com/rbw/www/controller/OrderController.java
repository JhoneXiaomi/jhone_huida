package com.rbw.www.controller;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rbw.base.controller.BaseController;
import com.rbw.www.dao.CasesMapper;
import com.rbw.www.dao.DesignerMapper;
import com.rbw.www.dao.OrderInfoMapper;
import com.rbw.www.dao.SysConfigMapper;
import com.rbw.www.dao.SysLogMapper;
import com.rbw.www.model.Cases;
import com.rbw.www.model.CasesExample;
import com.rbw.www.model.Designer;
import com.rbw.www.model.DesignerExample;
import com.rbw.www.model.OrderInfoExample;
import com.rbw.www.model.DesignerExample.Criteria;
import com.rbw.www.model.OrderInfo;
import com.rbw.www.util.JsonPrintUtil;

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
	
	@RequestMapping("saveOrder")
	@ResponseBody
	public  void saveOrder(OrderInfo order,HttpServletResponse response,HttpServletRequest request,HttpSession session) {
		int num = 0;
        // 0 未处理 1 处理中 2 已处理
		order.setCreateTime(new Date());
		order.setOrderStatus(0);
		order.setStatus(1);
		num = orderMapper.insert(order);
//      将信息保存到session中
		if(num>0){
			JsonPrintUtil.printObjData(response, "ok");
		}else{
			
			JsonPrintUtil.printObjData(response, "error");
		}
	}
	
		
		@RequestMapping("orderLine")
		public ModelAndView orderLine(
				@RequestParam(value="designerName",defaultValue="",required=false) String designerName,
				@RequestParam(value="designerSex",defaultValue="",required=false) String designerSex,
				HttpServletResponse response,HttpSession session,HttpServletRequest request) {
			// 获取公共信息
			super.getHomeMessage(request, session);
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
	        /*获取设计师的列表*/
			DesignerExample dx = new DesignerExample();
			Criteria criteria = dx.createCriteria();
			// 设计师非删除状态
			criteria.andStatusNotEqualTo(3);
			// 查询分公司的信息
		    if(StringUtils.isNotBlank(myBranchCompany)){
		    	criteria.andBranchCompanyEqualTo(myBranchCompany);
			}else{
				myBranchCompany = "sjzrbw1";
				criteria.andBranchCompanyEqualTo(myBranchCompany);
			}
			dx.setOrderByClause("update_time desc");
			List<Designer> designerList = designerMapper.selectByExample(dx);
			
			OrderInfoExample orderInfoE = new OrderInfoExample();
			com.rbw.www.model.OrderInfoExample.Criteria orderInfoC = orderInfoE.createCriteria();
			orderInfoC.andOrderStatusNotEqualTo(3);
			orderInfoC.andClientNameNotEqualTo("");
			orderInfoC.andPhoneNotEqualTo("");
			orderInfoC.andBranchCompanyEqualTo(myBranchCompany);
			List<OrderInfo> orders = orderInfoMapper.selectByExample(orderInfoE);
			// 获取案例的列表页
			CasesExample casesE = new CasesExample();
		    com.rbw.www.model.CasesExample.Criteria casesC = casesE.createCriteria();
		    casesC.andBranchCompanyEqualTo(myBranchCompany);
		    casesC.andCaseStatusNotEqualTo(3);
		    casesE.setOrderByClause("create_time desc");
		    List<Cases> casesList = caseMapper.selectByExample(casesE);
		    model.addObject("orders", orders);
		    model.addObject("casesList", casesList);
			model.addObject("designerList",designerList);
			model.addObject("myBranchCompany", myBranchCompany);
			model.addObject("branchCompany", myBranchCompany);
			model.setViewName("/www/order");
			return model;
		}
		

}
