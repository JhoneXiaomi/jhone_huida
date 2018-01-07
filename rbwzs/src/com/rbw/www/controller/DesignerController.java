package com.rbw.www.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.rbw.base.controller.BaseController;
import com.rbw.www.dao.CasesMapper;
import com.rbw.www.dao.DesignerMapper;
import com.rbw.www.dao.NewsMapper;
import com.rbw.www.dao.SysConfigMapper;
import com.rbw.www.dao.SysLogMapper;
import com.rbw.www.model.Cases;
import com.rbw.www.model.CasesExample;
import com.rbw.www.model.Designer;
import com.rbw.www.model.DesignerExample;
import com.rbw.www.model.DesignerExample.Criteria;
import com.rbw.www.model.News;
import com.rbw.www.model.NewsExample;
import com.rbw.www.model.SysConfig;
import com.rbw.www.model.SysConfigExample;
import com.rbw.www.util.Page;

@Controller
public class DesignerController extends BaseController{

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
	 * 设计是列表页
	 * @author JhoneZhang
	 * @date   2016年9月6日上午11:15:42
	 * @param page
	 * @param request
	 * @param session
	 * @param response
	 * @return
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
	    if(null != myBranchCompany && myBranchCompany.length()>0){
			
	    	criDesigner.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "sjzrbw1";
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
			com.rbw.www.model.CasesExample.Criteria ccs= casesExample.createCriteria();
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
		com.rbw.www.model.NewsExample.Criteria creNew = newsExample.createCriteria();
//		筛选非删除状态的新闻信息
		creNew.andStatusNotEqualTo(3);
		List<News> listNews = newsMapper.selectByExample(newsExample);
		/*获取SEO 的配置信息*/
	      
	      // SEO 标题信息
	      SysConfigExample sysConfigExamplerbwHomeSeoTitle = new SysConfigExample();
	      com.rbw.www.model.SysConfigExample.Criteria criteriarbwHomeSeoTitle = sysConfigExamplerbwHomeSeoTitle.createCriteria();
	      criteriarbwHomeSeoTitle.andKeyNameEqualTo("scinter_designer_seoTitle_str");
	      criteriarbwHomeSeoTitle.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(myBranchCompany)){
	    	  criteriarbwHomeSeoTitle.andBranchCompanyEqualTo(myBranchCompany);
			}else{
				myBranchCompany = "sjzrbw1";
				criteriarbwHomeSeoTitle.andBranchCompanyEqualTo(myBranchCompany);
			}
	      SysConfig rbwDesignerSeoTitleStr= null;
	      if(sysConfigMapper.selectByExample(sysConfigExamplerbwHomeSeoTitle).size()> 0){
	    	  rbwDesignerSeoTitleStr = sysConfigMapper.selectByExample(sysConfigExamplerbwHomeSeoTitle).get(0);
	      }
	      
	      // SEO 关键字信息
	      SysConfigExample sysConfigExamplerbwhomeSeoKeyword = new SysConfigExample();
	      com.rbw.www.model.SysConfigExample.Criteria criteriarbwhomeSeoKeyword = sysConfigExamplerbwhomeSeoKeyword.createCriteria();
	      criteriarbwhomeSeoKeyword.andKeyNameEqualTo("scinter_designer_seoKeyword_str");
	      criteriarbwhomeSeoKeyword.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(myBranchCompany)){
	    	  criteriarbwhomeSeoKeyword.andBranchCompanyEqualTo(myBranchCompany);
			}else{
				myBranchCompany = "sjzrbw1";
				criteriarbwhomeSeoKeyword.andBranchCompanyEqualTo(myBranchCompany);
			}
	      SysConfig rbwDesignerSeoKeywordStr= null;
	      if(sysConfigMapper.selectByExample(sysConfigExamplerbwhomeSeoKeyword).size()> 0){
	      	
	    	  rbwDesignerSeoKeywordStr = sysConfigMapper.selectByExample(sysConfigExamplerbwhomeSeoKeyword).get(0);
	      }
	      
	      // SEO 描述信息
	      SysConfigExample sysConfigExamplerbwHomeSeoDesc = new SysConfigExample();
	      com.rbw.www.model.SysConfigExample.Criteria criteriarbwHomeSeoDesc = sysConfigExamplerbwHomeSeoDesc.createCriteria();
	      criteriarbwHomeSeoDesc.andKeyNameEqualTo("scinter_designer_seoDesc_str");
	      criteriarbwHomeSeoDesc.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(myBranchCompany)){
	    	  criteriarbwHomeSeoDesc.andBranchCompanyEqualTo(myBranchCompany);
			}else{
				myBranchCompany = "sjzrbw1";
				criteriarbwHomeSeoDesc.andBranchCompanyEqualTo(myBranchCompany);
			}
	      SysConfig rbwDesignerSeoDescStr= null;
	      if(sysConfigMapper.selectByExample(sysConfigExamplerbwHomeSeoDesc).size()> 0){
	      	
	    	  rbwDesignerSeoDescStr = sysConfigMapper.selectByExample(sysConfigExamplerbwHomeSeoDesc).get(0);
	      }
	      session.setAttribute("rbwDesignerSeoTitleStr", rbwDesignerSeoTitleStr);
	      session.setAttribute("rbwDesignerSeoKeywordStr", rbwDesignerSeoKeywordStr);
	      session.setAttribute("rbwDesignerSeoDescStr", rbwDesignerSeoDescStr);
	      model.addObject("rbwDesignerSeoTitleStr", rbwDesignerSeoTitleStr);
	      model.addObject("rbwDesignerSeoKeywordStr", rbwDesignerSeoKeywordStr);
	      model.addObject("rbwDesignerSeoDescStr", rbwDesignerSeoDescStr);
		  model.addObject("page", p);
		  model.addObject("currentBCompany",myBranchCompany );
		  model.addObject("branchCompany",myBranchCompany );
		  model.addObject("listNews", listNews);
		  model.addObject("designerList", designerList);
		  model.setViewName("/www/designer");
		  return model;
	}
	

	/**
	 * 案例设计师相关案例的展示
	 * @param page			当前的页码
	 * @param rows			页内容量
	 * @param response		用于动态响应客户端请示
	 */
	@RequestMapping(value = "designerDetail/p{page}", method = RequestMethod.GET)
	public ModelAndView designerMessage(@RequestParam("designerId") String designerId,@PathVariable("page") int page,
			HttpSession session,HttpServletResponse response,HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		String myBranchCompany	= (String) session.getAttribute("branchCompany");
		
		//  获取共有信息
		super.getHomeMessage(request, session);
		//获取设计师的信息
		Designer designer = designerMapper.selectByPrimaryKey(Integer.valueOf(designerId));
		int rows = 8;//每页显示8条数据
		if(page<=0){
			page = 1;
		}
		// 获取设计师对应的所有的案例
		CasesExample cs =new CasesExample();
		com.rbw.www.model.CasesExample.Criteria criteria = cs.createCriteria();
		// 过滤案例图片为空的案例
		criteria.andCaseThumbImgNotEqualTo("");
		// 非删除状态
		criteria.andCaseStatusNotEqualTo(3);
		// 获取分公司的信息
	    if(StringUtils.isNotBlank(myBranchCompany)){
			
			criteria.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "sjzrbw1";
			criteria.andBranchCompanyEqualTo(myBranchCompany);
		}
		criteria.andDesignerIdEqualTo(Integer.valueOf(designerId));
		int totalNums = caseMapper.countByExample(cs);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		cs.setPage(p);
		// 排序	
		cs.setOrderByClause("create_time desc");
		List<Cases> caseList = caseMapper.selectByExample(cs);
		model.addObject("page", p);
		model.addObject("caseList", caseList);
		model.addObject("designer", designer);
		model.addObject("totalNums",totalNums);
		model.addObject("currentBCompany", myBranchCompany);
		model.addObject("branchCompany", myBranchCompany);
		model.setViewName("/www/designerDetail");
		return model;
	}
	
}
