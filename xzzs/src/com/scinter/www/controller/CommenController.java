package com.scinter.www.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.scinter.base.baseController.BaseController;
import com.scinter.www.dao.CasesMapper;
import com.scinter.www.dao.FaqMapper;
import com.scinter.www.dao.NewsMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.dao.SysLogMapper;
import com.scinter.www.model.Cases;
import com.scinter.www.model.CasesExample;
import com.scinter.www.model.Faq;

@Controller
public class CommenController extends BaseController{
	
	@Autowired
	private SysLogMapper sysLogMapper;
	@Autowired
	private FaqMapper faqMapper;
	@Autowired
	private NewsMapper newsMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	@Autowired
	private CasesMapper casesMapper;
	
	private Logger logger = Logger.getLogger(CommenController.class);
	
	@RequestMapping("commen")
	public ModelAndView commen(@RequestParam("faqId") String faqId,HttpServletRequest request,HttpSession session){
		
		
		// 获取公共信息
		super.getPublicMes(session);
		ModelAndView model = new ModelAndView();
		// 获取session 中的 BranchCompany
		String MyBranchCompany	= (String) session.getAttribute("branchCompany");
        // 获取当前常见问题
        Faq currnetfaq = faqMapper.selectByPrimaryKey(Integer.valueOf(faqId));
        // 获取活动详情页的案例列表
        CasesExample activityCases = new CasesExample();
        com.scinter.www.model.CasesExample.Criteria ac = activityCases.createCriteria();
        ac.andCaseStatusNotEqualTo(3);
        if(StringUtils.isNotBlank(MyBranchCompany) && MyBranchCompany.length()>0){
        	ac.andBranchCompanyEqualTo(MyBranchCompany);
		}else{
			MyBranchCompany = "bjxz";
			ac.andBranchCompanyEqualTo(MyBranchCompany);
		}
        List<Cases> aCasesList= casesMapper.selectByExample(activityCases);
       
        model.addObject("aCasesList", aCasesList);
        model.addObject("currnetfaq", currnetfaq);
		model.setViewName("/www/commen");
		return model;
	}
}
