package com.rbw.mobile.controller;
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

import com.rbw.mBase.controller.MbaseController;
import com.rbw.www.dao.FaqMapper;
import com.rbw.www.dao.NewsMapper;
import com.rbw.www.dao.SysConfigMapper;
import com.rbw.www.dao.SysLogMapper;
import com.rbw.www.model.Faq;
import com.rbw.www.model.FaqExample;

@Controller
@RequestMapping("m")
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
	
	@RequestMapping("comment")
	public ModelAndView Mcommen(HttpServletResponse response,HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException {
		
		super.getPublicMes(request, session);
		ModelAndView model = new ModelAndView();
//		获取session 中的 BranchCompany
		String MyBranchCompany	= (String) session.getAttribute("branchCompany");
		
		/*
		 * 获取常见问题信息
		 * */
		FaqExample faqExample =new FaqExample();
		com.rbw.www.model.FaqExample.Criteria criteria = faqExample.createCriteria();
		criteria.andFaqStatusNotEqualTo(3);
//		分公司查询
	    if(null != MyBranchCompany && MyBranchCompany.length()>0){
			criteria.andBranchCompanyEqualTo(MyBranchCompany);
		}else{
			MyBranchCompany = "sjzrbw1";
			criteria.andBranchCompanyEqualTo(MyBranchCompany);
		}
//		排序	
		faqExample.setOrderByClause("update_time desc");
		List<Faq> faqLists = faqMapper.selectByExample(faqExample);
//      将信息保存到session中
		session.setAttribute("branchCompany", MyBranchCompany);
		model.addObject("faqLists", faqLists);
		model.setViewName("/mobile/comment");
		return model;
	}
	

}
