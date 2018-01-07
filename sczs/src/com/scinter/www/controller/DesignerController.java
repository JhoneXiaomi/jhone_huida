package com.scinter.www.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.base.controller.BaseController;
import com.scinter.www.dao.CasesMapper;
import com.scinter.www.dao.DesignerMapper;
import com.scinter.www.dao.NewsMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.dao.SysLogMapper;
import com.scinter.www.model.Cases;
import com.scinter.www.model.CasesExample;
import com.scinter.www.model.Designer;
import com.scinter.www.model.DesignerExample;
import com.scinter.www.model.SysConfig;
import com.scinter.www.model.SysConfigExample;
import com.scinter.www.model.DesignerExample.Criteria;
import com.scinter.www.model.News;
import com.scinter.www.model.NewsExample;
import com.scinter.www.util.Page;

@Controller
public class DesignerController extends BaseController{

	private Logger logger = Logger.getLogger(DesignerController.class);
	@Autowired
	private DesignerMapper designerMapper;
	@Autowired
	private CasesMapper caseMapper;
	@Autowired
	private SysLogMapper sysLogMapper;
	@Autowired
	private NewsMapper newsMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	
	/**
	 * 实现装设计师信息的展示
	 * @param page			当前的页码
	 * @param rows			页内容量
	 * @param response		用于动态响应客户端请示
	 */
	@RequestMapping(value = "designer/p{page}", method = RequestMethod.GET)
	public ModelAndView designerMessage(@PathVariable("page") int page,
			HttpServletRequest request, HttpSession session,HttpServletResponse response) {
		
		/*配置共有的信息*/
		super.getHomeMessage(request, session);
		ModelAndView model = new ModelAndView();
		String myBranchCompany	= (String) session.getAttribute("branchCompany");

		int rows = 20;//每页显示20条数据
		if(page<=0){
			page = 1;
		}
		DesignerExample designerExample = new DesignerExample();
		Criteria criDesigner = designerExample.createCriteria();
//		过滤掉图片为空的设计师
		criDesigner.andDesignerPhotoImgNotEqualTo("");
		criDesigner.andStatusNotEqualTo(3);
//      获取分公司的信息
	    if(StringUtils.isNotBlank(myBranchCompany)){
			
	    	criDesigner.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			criDesigner.andBranchCompanyEqualTo(myBranchCompany);
		}
		int totalNums = designerMapper.countByExample(designerExample);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		designerExample.setPage(p);
		designerExample.setOrderByClause("update_time desc");//排序
		List<Designer> designerLists = designerMapper.selectByExample(designerExample);
		List<Designer> designerList = new ArrayList<Designer>();

//		获取设计师对应的经典案例列表
		for(Designer designer:designerLists){
			CasesExample casesExample = new CasesExample();
			com.scinter.www.model.CasesExample.Criteria ccs= casesExample.createCriteria();
			ccs.andCaseStatusNotEqualTo(3);
			ccs.andDesignerIdEqualTo(designer.getDesignerId());
//			排序
			casesExample.setOrderByClause("create_time desc");
			List<Cases> casesList = caseMapper.selectByExample(casesExample);
			if( casesList.size()!=0){
				Cases cases =  caseMapper.selectByExample(casesExample).get(0);
				designer.setCaseThumbImg(cases.getCaseThumbImg());
				designer.setCaseId(cases.getCaseId());
				designerList.add(designer);
				p.setTotalRecords(designerList.size());
			}
		}
	
//		新闻信息的获取
		NewsExample newsExample = new NewsExample();
		com.scinter.www.model.NewsExample.Criteria creNew = newsExample.createCriteria();
//		筛选非删除状态的新闻信息
		creNew.andStatusNotEqualTo(3);
		// 获取分公司的信息
	    if(StringUtils.isNotBlank(myBranchCompany)){
	    	creNew.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			creNew.andBranchCompanyEqualTo(myBranchCompany);
		}
		List<News> listNews = newsMapper.selectByExample(newsExample);
		/*获取SEO 的配置信息*/
	      
	      // SEO 标题信息
	      SysConfigExample sysConfigExampleScinterHomeSeoTitle = new SysConfigExample();
	      com.scinter.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoTitle = sysConfigExampleScinterHomeSeoTitle.createCriteria();
	      criteriaScinterHomeSeoTitle.andKeyNameEqualTo("scinter_designer_seoTitle_str");
	      criteriaScinterHomeSeoTitle.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(myBranchCompany)){
	    	  criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(myBranchCompany);
			}else{
				myBranchCompany = "bjsc";
				criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(myBranchCompany);
			}
	      SysConfig scinterDesignerSeoTitleStr= null;
	      if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).size()> 0){
	    	  scinterDesignerSeoTitleStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).get(0);
	      }
	      
	      // SEO 关键字信息
	      SysConfigExample sysConfigExampleScinterhomeSeoKeyword = new SysConfigExample();
	      com.scinter.www.model.SysConfigExample.Criteria criteriaScinterhomeSeoKeyword = sysConfigExampleScinterhomeSeoKeyword.createCriteria();
	      criteriaScinterhomeSeoKeyword.andKeyNameEqualTo("scinter_designer_seoKeyword_str");
	      criteriaScinterhomeSeoKeyword.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(myBranchCompany)){
	    	  criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(myBranchCompany);
			}else{
				myBranchCompany = "bjsc";
				criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(myBranchCompany);
			}
	      SysConfig scinterDesignerSeoKeywordStr= null;
	      if(sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).size()> 0){
	      	
	    	  scinterDesignerSeoKeywordStr = sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).get(0);
	      }
	      
	      // SEO 描述信息
	      SysConfigExample sysConfigExampleScinterHomeSeoDesc = new SysConfigExample();
	      com.scinter.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoDesc = sysConfigExampleScinterHomeSeoDesc.createCriteria();
	      criteriaScinterHomeSeoDesc.andKeyNameEqualTo("scinter_designer_seoDesc_str");
	      criteriaScinterHomeSeoDesc.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(myBranchCompany)){
	    	  criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(myBranchCompany);
			}else{
				myBranchCompany = "bjsc";
				criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(myBranchCompany);
			}
	      SysConfig scinterDesignerSeoDescStr= null;
	      if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).size()> 0){
	      	
	    	  scinterDesignerSeoDescStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).get(0);
	      }
	      session.setAttribute("scinterDesignerSeoTitleStr", scinterDesignerSeoTitleStr);
	      session.setAttribute("scinterDesignerSeoKeywordStr", scinterDesignerSeoKeywordStr);
	      session.setAttribute("scinterDesignerSeoDescStr", scinterDesignerSeoDescStr);
	      model.addObject("scinterDesignerSeoTitleStr", scinterDesignerSeoTitleStr);
	      model.addObject("scinterDesignerSeoKeywordStr", scinterDesignerSeoKeywordStr);
	      model.addObject("scinterDesignerSeoDescStr", scinterDesignerSeoDescStr);
		  model.addObject("page", p);
		  model.addObject("currentBCompany",myBranchCompany );
		  model.addObject("listNews", listNews);
		  model.addObject("designerList", designerList);
		  model.setViewName("/www/designer");
		  return model;
	}
	
}
