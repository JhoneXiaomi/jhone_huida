package com.scinter.mobile.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.scinter.mBase.controller.MbaseController;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.model.SysConfig;
import com.scinter.www.model.SysConfigExample;
import com.scinter.www.model.SysConfigExample.Criteria;

@Controller
public class MstaticCotroller extends MbaseController{

	@Autowired
	private SysConfigMapper sysConfigMapper;
	
	@RequestMapping(value="Mabout")
	public ModelAndView about(HttpServletRequest request,HttpSession session){
		
		/*获取共有信息*/
		super.getPublicMes(request, session);;
		// 获取分公司
	    String branchCompany = (String) session.getAttribute("branchCompany");
		ModelAndView model = new ModelAndView();
		 /*获取SEO 的配置信息*/
	      
	      // SEO 标题信息
	      SysConfigExample sysConfigExampleScinterHomeSeoTitle = new SysConfigExample();
	      Criteria criteriaScinterHomeSeoTitle = sysConfigExampleScinterHomeSeoTitle.createCriteria();
	      criteriaScinterHomeSeoTitle.andKeyNameEqualTo("scinter_about_seoTitle_str");
	      criteriaScinterHomeSeoTitle.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(branchCompany)){
	    	  criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjxz";
				criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
			}
	      SysConfig aboutSeoTitleStr= null;
	      if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).size()> 0){
	    	  aboutSeoTitleStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).get(0);
	      }
		// SEO 关键字信息
	      SysConfigExample sysConfigExampleScinterhomeSeoKeyword = new SysConfigExample();
	      Criteria criteriaScinterhomeSeoKeyword = sysConfigExampleScinterhomeSeoKeyword.createCriteria();
	      criteriaScinterhomeSeoKeyword.andKeyNameEqualTo("scinter_about_seoKeyword_str");
	      criteriaScinterhomeSeoKeyword.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(branchCompany)){
	    	  criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjxz";
				criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
			}
	      SysConfig aboutSeoKeywordStr= null;
	      if(sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).size()> 0){
	    	 aboutSeoKeywordStr = sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).get(0);
	      }
	      // SEO 描述信息
	      SysConfigExample sysConfigExampleScinterHomeSeoDesc = new SysConfigExample();
	      Criteria criteriaScinterHomeSeoDesc = sysConfigExampleScinterHomeSeoDesc.createCriteria();
	      criteriaScinterHomeSeoDesc.andKeyNameEqualTo("scinter_about_seoDesc_str");
	      criteriaScinterHomeSeoDesc.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(branchCompany)){
	    	  criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjxz";
				criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
			}
	      SysConfig aboutSeoDescStr= null;
	      if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).size()> 0){
	    	  aboutSeoDescStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).get(0);
	      }
	      model.addObject("currentBCompany", branchCompany);
	      model.addObject("aboutSeoTitleStr", aboutSeoTitleStr);
	      model.addObject("aboutSeoKeywordStr", aboutSeoKeywordStr);
	      model.addObject("aboutSeoDescStr", aboutSeoDescStr);
		  model.setViewName("mobile/about");
		  return model;
	}
	
	@RequestMapping(value="MblueDiamondProcess")
	public ModelAndView blueDiamondProcess(HttpServletRequest request,HttpSession session){
		
		  /*获取共有信息*/
		  super.getPublicMes(request, session);;
		  // 获取分公司
		  String branchCompany = (String) session.getAttribute("branchCompany");
		  ModelAndView model = new ModelAndView();
		  /*获取SEO 的配置信息*/
		  
		  // SEO 标题信息
		  SysConfigExample sysConfigExampleScinterHomeSeoTitle = new SysConfigExample();
		  Criteria criteriaScinterHomeSeoTitle = sysConfigExampleScinterHomeSeoTitle.createCriteria();
		  criteriaScinterHomeSeoTitle.andKeyNameEqualTo("scinter_diamond_seoTitle_str");
		  criteriaScinterHomeSeoTitle.andValueNotEqualTo("");
		  if(StringUtils.isNotBlank(branchCompany)){
			  criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjxz";
				criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
			}
		  SysConfig scinterDiamondSeoTitleStr= null;
		  if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).size()> 0){
			  scinterDiamondSeoTitleStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).get(0);
		  }
		 // SEO 关键字信息
		  SysConfigExample sysConfigExampleScinterhomeSeoKeyword = new SysConfigExample();
		  Criteria criteriaScinterhomeSeoKeyword = sysConfigExampleScinterhomeSeoKeyword.createCriteria();
		  criteriaScinterhomeSeoKeyword.andKeyNameEqualTo("scinter_diamond_seoKeyword_str");
		  criteriaScinterhomeSeoKeyword.andValueNotEqualTo("");
		  if(StringUtils.isNotBlank(branchCompany)){
			  criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjxz";
				criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
			}
		  SysConfig scinterDiamondSeoKeywordStr= null;
		  if(sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).size()> 0){
			  scinterDiamondSeoKeywordStr = sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).get(0);
		  }
		  // SEO 描述信息
		  SysConfigExample sysConfigExampleScinterHomeSeoDesc = new SysConfigExample();
		  Criteria criteriaScinterHomeSeoDesc = sysConfigExampleScinterHomeSeoDesc.createCriteria();
		  criteriaScinterHomeSeoDesc.andKeyNameEqualTo("scinter_diamond_seoDesc_str");
		  criteriaScinterHomeSeoDesc.andValueNotEqualTo("");
		  if(StringUtils.isNotBlank(branchCompany)){
			  criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjxz";
				criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
			}
		  SysConfig scinterDiamondSeoDescStr= null;
		  if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).size()> 0){
			  scinterDiamondSeoDescStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).get(0);
		  }
		  session.setAttribute("scinterDiamondSeoTitleStr", scinterDiamondSeoTitleStr);
		  session.setAttribute("scinterDiamondSeoKeywordStr", scinterDiamondSeoKeywordStr);
		  session.setAttribute("scinterDiamondSeoDescStr", scinterDiamondSeoDescStr);
		  model.addObject("currentBCompany", branchCompany);
		  model.addObject("scinterDiamondSeoTitleStr", scinterDiamondSeoTitleStr);
		  model.addObject("scinterDiamondSeoKeywordStr", scinterDiamondSeoKeywordStr);
		  model.addObject("scinterDiamondSeoDescStr", scinterDiamondSeoDescStr);
		  model.setViewName("/blue_diamond_process");
		  return model;
	}
	@RequestMapping(value="newActivity")
	public ModelAndView IntegratedPackage(
			@RequestParam(value="key",required=false)String key,
			HttpServletRequest request,HttpSession session){
		
		  /*获取共有信息*/
		  super.getPublicMes(request, session);;
		  // 获取分公司
		  String branchCompany = (String) session.getAttribute("branchCompany");
		  ModelAndView model = new ModelAndView();
		  /*获取SEO 的配置信息*/
		  // SEO 标题信息
		  SysConfigExample sysConfigExampleScinterHomeSeoTitle = new SysConfigExample();
		  Criteria criteriaScinterHomeSeoTitle = sysConfigExampleScinterHomeSeoTitle.createCriteria();
		  criteriaScinterHomeSeoTitle.andKeyNameEqualTo("scinter_package_seo_title");
		  criteriaScinterHomeSeoTitle.andValueNotEqualTo("");
		  if(StringUtils.isNotBlank(branchCompany)){
			  criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjxz";
				criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
			}
		  SysConfig packageSeoTitle= null;
		  if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).size()> 0){
			  packageSeoTitle = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).get(0);
		  }
		 // SEO 关键字信息
		  SysConfigExample sysConfigExampleScinterhomeSeoKeyword = new SysConfigExample();
		  Criteria criteriaScinterhomeSeoKeyword = sysConfigExampleScinterhomeSeoKeyword.createCriteria();
		  criteriaScinterhomeSeoKeyword.andKeyNameEqualTo("scinter_package_seo_keyword");
		  criteriaScinterhomeSeoKeyword.andValueNotEqualTo("");
		  if(StringUtils.isNotBlank(branchCompany)){
			  criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjxz";
				criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
			}
		  SysConfig packageSeoKeyword= null;
		  if(sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).size()> 0){
			  packageSeoKeyword = sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).get(0);
		  }
		  // SEO 描述信息
		  SysConfigExample sysConfigExampleScinterHomeSeoDesc = new SysConfigExample();
		  Criteria criteriaScinterHomeSeoDesc = sysConfigExampleScinterHomeSeoDesc.createCriteria();
		  criteriaScinterHomeSeoDesc.andKeyNameEqualTo("scinter_package_seo_desc");
		  criteriaScinterHomeSeoDesc.andValueNotEqualTo("");
		  if(StringUtils.isNotBlank(branchCompany)){
			  criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjxz";
				criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
			}
		  SysConfig packageSeoDesc= null;
		  if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).size()> 0){
			  packageSeoDesc = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).get(0);
		  }
		  model.addObject("currentBCompany", branchCompany);
		  model.addObject("packageSeoTitle", packageSeoTitle);
		  model.addObject("packageSeoKeyword", packageSeoKeyword);
		  model.addObject("packageSeoDesc", packageSeoDesc);
		  /*if(branchCompany.equals("bjxz")){
			  model.setViewName("mobile/activity_bj");
		  }else if(branchCompany.equals("bdxz")){
			  
			  if(StringUtils.isNotBlank(key)){
				  try {
					key = new String(key.getBytes("ISO-8859-1"),"utf-8");
				} catch (UnsupportedEncodingException e) {
					System.out.println(e.getMessage());
				}
				  model.setViewName("mobile/activity_bd_"+key);
			  }else{
				  model.setViewName("mobile/activity_bd");
			  }
		  }else if(branchCompany.equals("hsxz")){
			  model.setViewName("mobile/activity_hs");
		  }else if(branchCompany.equals("tjxz")){
			  model.setViewName("mobile/activity_tj_"+key);
		  }else{
			  model.setViewName("mobile/activity_bj");
		  }*/
		  model.setViewName("mobile/activity_xz555");
		  return model;
	}
	
	
}
