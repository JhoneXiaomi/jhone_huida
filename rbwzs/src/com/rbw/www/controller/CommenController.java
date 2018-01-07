package com.rbw.www.controller;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.rbw.base.controller.BaseController;
import com.rbw.www.dao.CasesMapper;
import com.rbw.www.dao.FaqMapper;
import com.rbw.www.dao.NewsMapper;
import com.rbw.www.dao.SysConfigMapper;
import com.rbw.www.dao.SysLogMapper;
import com.rbw.www.model.Cases;
import com.rbw.www.model.CasesExample;
import com.rbw.www.model.Faq;
import com.rbw.www.model.FaqExample;
import com.rbw.www.model.FaqExample.Criteria;
import com.rbw.www.util.Page;
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
	@RequestMapping(value = "commen/p{page}", method = RequestMethod.GET)
	public ModelAndView commen(@PathVariable("page") int page,
			HttpServletResponse response,HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException {
		
		/*配置共有的信息*/
		super.getHomeMessage(request, session);
		ModelAndView model = new ModelAndView();
//		获取session 中的 BranchCompany
		String myBranchCompany	= (String) session.getAttribute("branchCompany");
		int rows = 4;//每页显示4条数据
		if(page<=0){
			page = 1;
		}
		FaqExample faqExample =new FaqExample();
		Criteria criteria = faqExample.createCriteria();
		criteria.andFaqStatusNotEqualTo(3);
//		分公司查询
	    if(null != myBranchCompany && myBranchCompany.length()>0){
			criteria.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "sjzrbw1";
			criteria.andBranchCompanyEqualTo(myBranchCompany);
		}
		int totalNums =faqMapper.countByExample(faqExample);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		faqExample.setPage(p);
//		排序	
		faqExample.setOrderByClause("create_time desc");
		List<Faq> faqLists = faqMapper.selectByExample(faqExample);
	
//		活动信息列表的获取
		CasesExample casesExample = new CasesExample();
		com.rbw.www.model.CasesExample.Criteria cre = casesExample.createCriteria();
//		筛选非删除状态的新闻信息
		cre.andCaseStatusNotEqualTo(3);
//		分公司查询
		if(null != myBranchCompany && myBranchCompany.length()>0){
			cre.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "sjzrbw1";
			cre.andBranchCompanyEqualTo(myBranchCompany);
		}
//		排序
		faqExample.setOrderByClause("update_time desc");
		List<Cases> casesList = casesMapper.selectByExample(casesExample);
		model.addObject("currentBCompany", myBranchCompany);
		model.addObject("branchCompany", myBranchCompany);
		model.addObject("page", p);
		model.addObject("faqLists", faqLists);
		model.addObject("casesList", casesList);
		model.addObject("totalNums",totalNums);
		model.setViewName("/www/commen");
		return model;
	}
	
	
}
