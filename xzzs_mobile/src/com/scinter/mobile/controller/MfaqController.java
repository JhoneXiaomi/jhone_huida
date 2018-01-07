package com.scinter.mobile.controller;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.scinter.mBase.controller.MbaseController;
import com.scinter.www.dao.FaqMapper;
import com.scinter.www.dao.NewsMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.dao.SysLogMapper;
import com.scinter.www.model.Faq;
import com.scinter.www.model.FaqExample;

@Controller
public class MfaqController extends MbaseController{

	private Logger logger = Logger.getLogger(MfaqController.class);
	@Autowired
	private SysLogMapper sysLogMapper;
	@Autowired
	private FaqMapper faqMapper;
	@Autowired
	private NewsMapper newsMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	
	@RequestMapping("Mcommen")
	public ModelAndView Mcommen(HttpServletResponse response,HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException {
		
		super.getPublicMes(request, session);
		ModelAndView model = new ModelAndView();
//		获取session 中的 BranchCompany
		String MyBranchCompany	= (String) session.getAttribute("branchCompany");
		
		/*
		 * 获取常见问题信息
		 * */
		FaqExample faqExample =new FaqExample();
		com.scinter.www.model.FaqExample.Criteria criteria = faqExample.createCriteria();
		criteria.andFaqStatusNotEqualTo(3);
//		分公司查询
	    if(null != MyBranchCompany && MyBranchCompany.length()>0){
			criteria.andBranchCompanyEqualTo(MyBranchCompany);
		}else{
			MyBranchCompany = "bjsc";
			criteria.andBranchCompanyEqualTo(MyBranchCompany);
		}
//		排序	
		faqExample.setOrderByClause("update_time desc");
		List<Faq> faqLists = faqMapper.selectByExample(faqExample);
//      将信息保存到session中
		session.setAttribute("branchCompany", MyBranchCompany);
		model.addObject("faqLists", faqLists);
		model.setViewName("/mobile/commen");
		return model;
	}
	

}
