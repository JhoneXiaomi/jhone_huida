package com.scinter.www.controller;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.base.controller.BaseController;
import com.scinter.www.dao.FaqMapper;
import com.scinter.www.dao.NewsMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.dao.SysLogMapper;
import com.scinter.www.model.Faq;
import com.scinter.www.model.FaqExample;
import com.scinter.www.model.FaqExample.Criteria;
import com.scinter.www.model.News;
import com.scinter.www.model.NewsExample;
import com.scinter.www.util.Page;
@Controller
public class ScinterServiceController extends BaseController{

	private Logger logger = Logger.getLogger(SpecController.class);
	@Autowired
	private SysLogMapper sysLogMapper;
	@Autowired
	private FaqMapper faqMapper;
	@Autowired
	private NewsMapper newsMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	
	@RequestMapping(value = "commen/p{page}", method = RequestMethod.GET)
	public ModelAndView commen(@PathVariable("page") int page,
			HttpServletResponse response,HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException {
		
		/*配置共有的信息*/
		super.getHomeMessage(request, session);
		ModelAndView model = new ModelAndView();
//		获取session 中的 BranchCompany
		String myBranchCompany	= (String) session.getAttribute("branchCompany");
		int rows = 6;//每页显示4条数据
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
			myBranchCompany = "bjsc";
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
		NewsExample newsExample = new NewsExample();
		com.scinter.www.model.NewsExample.Criteria creNew = newsExample.createCriteria();
//		筛选非删除状态的新闻信息
		creNew.andStatusNotEqualTo(3);
//		分公司查询
		if(null != myBranchCompany && myBranchCompany.length()>0){
			creNew.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			creNew.andBranchCompanyEqualTo(myBranchCompany);
		}
//		排序
		faqExample.setOrderByClause("create_time desc");
		List<News> newsList = newsMapper.selectByExample(newsExample);
		model.addObject("currentBCompany", myBranchCompany);
		model.addObject("page", p);
		model.addObject("faqLists", faqLists);
		model.addObject("newsList", newsList);
		model.addObject("totalNums",totalNums);
		model.setViewName("/www/commen");
		return model;
	}
	
	
}
