package com.scinter.mobile.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.scinter.mBase.controller.MbaseController;
import com.scinter.www.dao.CaseShowImageMapper;
import com.scinter.www.dao.CasesMapper;
import com.scinter.www.dao.DesignerMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.model.CaseShowImage;
import com.scinter.www.model.CaseShowImageExample;
import com.scinter.www.model.CaseShowImageExample.Criteria;
import com.scinter.www.model.Cases;
import com.scinter.www.model.CasesExample;
import com.scinter.www.model.Designer;
import com.scinter.www.model.SysConfig;
import com.scinter.www.model.SysConfigExample;
import com.scinter.www.util.Page;


@Controller
public class McasesController extends MbaseController {

	private Logger logger = Logger.getLogger(MhotBuildingController.class);
	@Autowired
	private DesignerMapper designerMapper;
	@Autowired
	private CasesMapper caseMapper;
    @Autowired
    private CaseShowImageMapper casesShowImgeMapper;
    @Autowired
    private SysConfigMapper sysConfigMapper;
	
	@RequestMapping(value = "Mcases/p{page}")
	public ModelAndView caseList(@PathVariable("page") int page,HttpServletResponse response,HttpSession session,HttpServletRequest request) {
		
		super.getPublicMes(request, session);
		ModelAndView  model = new ModelAndView();
		// 初始化CasesNum
		int MyCasesNum = 0;
		String branchCompany = (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany)){
			branchCompany= "bjsc";
		}
		CasesExample casesExample =new CasesExample();
		com.scinter.www.model.CasesExample.Criteria criteria = casesExample.createCriteria();
		criteria.andCaseThumbImgNotEqualTo("");
		criteria.andBranchCompanyEqualTo(branchCompany);
		criteria.andCaseStatusNotEqualTo(3);
		int totalNums = caseMapper.countByExample(casesExample);
		int rows = 20;
		if(page<=0){
			page = 1;
		}
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		casesExample.setPage(p);
		casesExample.setOrderByClause("create_time desc");
		List<Cases> caseList = caseMapper.selectByExample(casesExample);

		/*获取SEO 的配置信息*/
        // SEO 标题信息
        SysConfigExample sysConfigExampleScinterHomeSeoTitle = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoTitle = sysConfigExampleScinterHomeSeoTitle.createCriteria();
        criteriaScinterHomeSeoTitle.andKeyNameEqualTo("scinter_cases_seoTitle_str");
        criteriaScinterHomeSeoTitle.andValueNotEqualTo("");
  		criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
        SysConfig casesSeoTitleStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).size()> 0){
        	casesSeoTitleStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).get(0);
        }
        // SEO 关键字信息
        SysConfigExample sysConfigExampleScinterhomeSeoKeyword = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria criteriaScinterhomeSeoKeyword = sysConfigExampleScinterhomeSeoKeyword.createCriteria();
        criteriaScinterhomeSeoKeyword.andKeyNameEqualTo("scinter_cases_seoKeyword_str");
        criteriaScinterhomeSeoKeyword.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "bjxz";
  			criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig casesSeoKeywordStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).size()> 0){
        	casesSeoKeywordStr = sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).get(0);
        }
        
        // SEO 描述信息
        SysConfigExample sysConfigExampleScinterHomeSeoDesc = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoDesc = sysConfigExampleScinterHomeSeoDesc.createCriteria();
        criteriaScinterHomeSeoDesc.andKeyNameEqualTo("scinter_cases_seoDesc_str");
        criteriaScinterHomeSeoDesc.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "bjxz";
  			criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig casesSeoDescStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).size()> 0){
        	
        	casesSeoDescStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).get(0);
        }
        session.setAttribute("casesSeoTitleStr", casesSeoTitleStr);
        session.setAttribute("casesSeoKeywordStr", casesSeoKeywordStr);
        session.setAttribute("casesSeoDescStr", casesSeoDescStr);
        model.addObject("casesSeoTitleStr", casesSeoTitleStr);
        model.addObject("casesSeoKeywordStr", casesSeoKeywordStr);
        model.addObject("casesSeoDescStr", casesSeoDescStr);
        model.addObject("page", p);
        model.addObject("CasesNum", MyCasesNum);
        model.addObject("totalNums", totalNums);
		model.addObject("casesList", caseList);
		model.setViewName("/mobile/cases");
		logger.info("成功加载mobileCase");
		return model;
	}	
	
	/**
	 * 手机站案例的详情展示的方法
	 * @param casesId			  展示的案例的ID
	 * @param designerId		  展示的设计师的ID
	 * @param response           用于动态响应客户端请示
	 * @return
	 */
	@RequestMapping("/McasesDetail")
	public ModelAndView caseDetail(
			@RequestParam("casesId") String casesId,@RequestParam("designerId") String designerId,HttpServletRequest request,
			HttpSession session, HttpServletResponse response) {
		
		super.getPublicMes(request, session);
		ModelAndView  model = new ModelAndView();
//		获取session 中的 BranchCompany
		String branchCompany	= (String) session.getAttribute("branchCompany");
		if(branchCompany ==""){
			branchCompany= "bjsc";
		}
//		获取设计师的信息
		Designer designer = designerMapper.selectByPrimaryKey(Integer.valueOf(designerId));
//		获取当前点击的案例的信息
		Cases CurrentCase = caseMapper.selectByPrimaryKey(Integer.valueOf(casesId));
		CasesExample casesExample =new CasesExample();
		com.scinter.www.model.CasesExample.Criteria criteria = casesExample.createCriteria();
		criteria.andCaseStatusNotEqualTo(3);
//		分公司查询
	    if(null != branchCompany && branchCompany.length()>0){
	    	criteria.andBranchCompanyEqualTo(branchCompany);
		}else{
			criteria.andBranchCompanyEqualTo(branchCompany);
		}
//		排序
		casesExample.setOrderByClause("create_time desc");
		List<Cases> caseList = caseMapper.selectByExample(casesExample);
		
//		获取案例的详情图片
		CaseShowImageExample caseShowImageExample =new CaseShowImageExample();
		Criteria criteriaImg = caseShowImageExample.createCriteria();
		criteriaImg.andCaseIdEqualTo(Integer.valueOf(casesId));
		criteriaImg.andImageUrlNotEqualTo("");
		criteriaImg.andStatusNotEqualTo("3");
//		排序
		caseShowImageExample.setOrderByClause("create_time desc");
		List<CaseShowImage> caseShowImageList = casesShowImgeMapper.selectByExample(caseShowImageExample);
		List<CaseShowImage> caseshowImages = new ArrayList<CaseShowImage>();
		for(CaseShowImage cases:caseShowImageList){
			if(cases.getImageUrl() != ""){
				cases.setImageUrl(cases.getImageUrl().substring(0,27)+"_logo"+CurrentCase.getCaseThumbImg().substring(27,31));
			}
			caseshowImages.add(cases);
		}
		/*获取案例的图片信息*/
		CaseShowImageExample ImageExample = new CaseShowImageExample();
		Criteria ic =  ImageExample.createCriteria();
		ic.andCaseIdEqualTo(Integer.valueOf(casesId));
		ic.andStatusNotEqualTo("3");
		List<CaseShowImage> caseImages = casesShowImgeMapper.selectByExample(ImageExample);
		session.setAttribute("branchCompany", branchCompany);
		model.addObject("caseImages", caseImages);
		model.addObject("totalNums");
		model.addObject("caseshowImages", caseshowImages);
		model.addObject("designer", designer);
		model.addObject("CurrentCase", CurrentCase);
		model.addObject("casesList", caseList);
		model.setViewName("/mobile/casesDetail");
		logger.info("成功加载caseDetail");
		return model;
	}	
}
