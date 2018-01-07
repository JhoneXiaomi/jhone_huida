package com.rbw.www.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.rbw.base.controller.BaseController;
import com.rbw.www.dao.SysConfigMapper;
import com.rbw.www.model.SysConfig;
import com.rbw.www.model.SysConfigExample;
import com.rbw.www.model.SysConfigExample.Criteria;

@Controller
public class StaticCotroller extends BaseController{

	@Autowired
	private SysConfigMapper sysConfigMapper;
	
	@RequestMapping(value="about")
	public ModelAndView about(HttpServletRequest request,HttpSession session){
		
		/*获取共有信息*/
		super.getHomeMessage(request, session);
		// 获取分公司
	    String branchCompany = (String) session.getAttribute("branchCompany");
		ModelAndView model = new ModelAndView();
		 /*获取SEO 的配置信息*/
	      
	      // SEO 标题信息
	      SysConfigExample sysConfigExamplerbwHomeSeoTitle = new SysConfigExample();
	      Criteria criteriarbwHomeSeoTitle = sysConfigExamplerbwHomeSeoTitle.createCriteria();
	      criteriarbwHomeSeoTitle.andKeyNameEqualTo("scinter_about_seoTitle_str");
	      criteriarbwHomeSeoTitle.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(branchCompany)){
	    	  criteriarbwHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "sjzrbw1";
				criteriarbwHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
			}
	      SysConfig aboutSeoTitleStr= null;
	      if(sysConfigMapper.selectByExample(sysConfigExamplerbwHomeSeoTitle).size()> 0){
	    	  aboutSeoTitleStr = sysConfigMapper.selectByExample(sysConfigExamplerbwHomeSeoTitle).get(0);
	      }
		// SEO 关键字信息
	      SysConfigExample sysConfigExamplerbwhomeSeoKeyword = new SysConfigExample();
	      Criteria criteriarbwhomeSeoKeyword = sysConfigExamplerbwhomeSeoKeyword.createCriteria();
	      criteriarbwhomeSeoKeyword.andKeyNameEqualTo("scinter_about_seoKeyword_str");
	      criteriarbwhomeSeoKeyword.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(branchCompany)){
	    	  criteriarbwhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "sjzrbw1";
				criteriarbwhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
			}
	      SysConfig aboutSeoKeywordStr= null;
	      if(sysConfigMapper.selectByExample(sysConfigExamplerbwhomeSeoKeyword).size()> 0){
	    	 aboutSeoKeywordStr = sysConfigMapper.selectByExample(sysConfigExamplerbwhomeSeoKeyword).get(0);
	      }
	      // SEO 描述信息
	      SysConfigExample sysConfigExamplerbwHomeSeoDesc = new SysConfigExample();
	      Criteria criteriarbwHomeSeoDesc = sysConfigExamplerbwHomeSeoDesc.createCriteria();
	      criteriarbwHomeSeoDesc.andKeyNameEqualTo("scinter_about_seoDesc_str");
	      criteriarbwHomeSeoDesc.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(branchCompany)){
	    	  criteriarbwHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "sjzrbw1";
				criteriarbwHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
			}
	      SysConfig aboutSeoDescStr= null;
	      if(sysConfigMapper.selectByExample(sysConfigExamplerbwHomeSeoDesc).size()> 0){
	    	  aboutSeoDescStr = sysConfigMapper.selectByExample(sysConfigExamplerbwHomeSeoDesc).get(0);
	      }
	      model.addObject("currentBCompany", branchCompany);
	      model.addObject("branchCompany", branchCompany);
	      model.addObject("aboutSeoTitleStr", aboutSeoTitleStr);
	      model.addObject("aboutSeoKeywordStr", aboutSeoKeywordStr);
	      model.addObject("aboutSeoDescStr", aboutSeoDescStr);
		  model.setViewName("www/about");
		  return model;
	}
	
	@RequestMapping("blueDiamondProcess")
	public ModelAndView blueDiamondProcess(HttpServletRequest request,HttpSession session){
		
		  /*获取共有信息*/
		  super.getHomeMessage(request, session);
		  // 获取分公司
		  String branchCompany = (String) session.getAttribute("branchCompany");
		  ModelAndView model = new ModelAndView();
		  /*获取SEO 的配置信息*/
		  
		  // SEO 标题信息
		  SysConfigExample sysConfigExamplerbwHomeSeoTitle = new SysConfigExample();
		  Criteria criteriarbwHomeSeoTitle = sysConfigExamplerbwHomeSeoTitle.createCriteria();
		  criteriarbwHomeSeoTitle.andKeyNameEqualTo("rbw_diamond_seoTitle_str");
		  criteriarbwHomeSeoTitle.andValueNotEqualTo("");
		  if(StringUtils.isNotBlank(branchCompany)){
			  criteriarbwHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "sjzrbw1";
				criteriarbwHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
			}
		  SysConfig rbwDiamondSeoTitleStr= null;
		  if(sysConfigMapper.selectByExample(sysConfigExamplerbwHomeSeoTitle).size()> 0){
			  rbwDiamondSeoTitleStr = sysConfigMapper.selectByExample(sysConfigExamplerbwHomeSeoTitle).get(0);
		  }
		 // SEO 关键字信息
		  SysConfigExample sysConfigExamplerbwhomeSeoKeyword = new SysConfigExample();
		  Criteria criteriarbwhomeSeoKeyword = sysConfigExamplerbwhomeSeoKeyword.createCriteria();
		  criteriarbwhomeSeoKeyword.andKeyNameEqualTo("rbw_diamond_seoKeyword_str");
		  criteriarbwhomeSeoKeyword.andValueNotEqualTo("");
		  if(StringUtils.isNotBlank(branchCompany)){
			  criteriarbwhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "sjzrbw1";
				criteriarbwhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
			}
		  SysConfig rbwDiamondSeoKeywordStr= null;
		  if(sysConfigMapper.selectByExample(sysConfigExamplerbwhomeSeoKeyword).size()> 0){
			  rbwDiamondSeoKeywordStr = sysConfigMapper.selectByExample(sysConfigExamplerbwhomeSeoKeyword).get(0);
		  }
		  // SEO 描述信息
		  SysConfigExample sysConfigExamplerbwHomeSeoDesc = new SysConfigExample();
		  Criteria criteriarbwHomeSeoDesc = sysConfigExamplerbwHomeSeoDesc.createCriteria();
		  criteriarbwHomeSeoDesc.andKeyNameEqualTo("rbw_diamond_seoDesc_str");
		  criteriarbwHomeSeoDesc.andValueNotEqualTo("");
		  if(StringUtils.isNotBlank(branchCompany)){
			  criteriarbwHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "sjzrbw1";
				criteriarbwHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
			}
		  SysConfig rbwDiamondSeoDescStr= null;
		  if(sysConfigMapper.selectByExample(sysConfigExamplerbwHomeSeoDesc).size()> 0){
			  rbwDiamondSeoDescStr = sysConfigMapper.selectByExample(sysConfigExamplerbwHomeSeoDesc).get(0);
		  }
		  session.setAttribute("rbwDiamondSeoTitleStr", rbwDiamondSeoTitleStr);
		  session.setAttribute("rbwDiamondSeoKeywordStr", rbwDiamondSeoKeywordStr);
		  session.setAttribute("rbwDiamondSeoDescStr", rbwDiamondSeoDescStr);
		  model.addObject("currentBCompany", branchCompany);
		  model.addObject("branchCompany", branchCompany);
		  model.addObject("rbwDiamondSeoTitleStr", rbwDiamondSeoTitleStr);
		  model.addObject("rbwDiamondSeoKeywordStr", rbwDiamondSeoKeywordStr);
		  model.addObject("rbwDiamondSeoDescStr", rbwDiamondSeoDescStr);
		  model.setViewName("www/blue_diamond_process");
		  return model;
	}
	

	@RequestMapping(value="IntegratedPackage")
	public ModelAndView IntegratedPackage(
			@RequestParam(value="key",required=false)String key,
			HttpServletRequest request,HttpSession session){
		
		  /*获取共有信息*/
		  super.getHomeMessage(request, session);
		  // 获取分公司
		  String branchCompany = (String) session.getAttribute("branchCompany");
		  ModelAndView model = new ModelAndView();
		  /*获取SEO 的配置信息*/
		  // SEO 标题信息
		  SysConfigExample sysConfigExamplerbwHomeSeoTitle = new SysConfigExample();
		  Criteria criteriarbwHomeSeoTitle = sysConfigExamplerbwHomeSeoTitle.createCriteria();
		  criteriarbwHomeSeoTitle.andKeyNameEqualTo("scinter_package_seo_title");
		  criteriarbwHomeSeoTitle.andValueNotEqualTo("");
		  if(StringUtils.isNotBlank(branchCompany)){
			  criteriarbwHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "sjzrbw1";
				criteriarbwHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
			}
		  SysConfig packageSeoTitle= null;
		  if(sysConfigMapper.selectByExample(sysConfigExamplerbwHomeSeoTitle).size()> 0){
			  packageSeoTitle = sysConfigMapper.selectByExample(sysConfigExamplerbwHomeSeoTitle).get(0);
		  }
		 // SEO 关键字信息
		  SysConfigExample sysConfigExamplerbwhomeSeoKeyword = new SysConfigExample();
		  Criteria criteriarbwhomeSeoKeyword = sysConfigExamplerbwhomeSeoKeyword.createCriteria();
		  criteriarbwhomeSeoKeyword.andKeyNameEqualTo("scinter_package_seo_keyword");
		  criteriarbwhomeSeoKeyword.andValueNotEqualTo("");
		  if(StringUtils.isNotBlank(branchCompany)){
			  criteriarbwhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "sjzrbw1";
				criteriarbwhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
			}
		  SysConfig packageSeoKeyword= null;
		  if(sysConfigMapper.selectByExample(sysConfigExamplerbwhomeSeoKeyword).size()> 0){
			  packageSeoKeyword = sysConfigMapper.selectByExample(sysConfigExamplerbwhomeSeoKeyword).get(0);
		  }
		  // SEO 描述信息
		  SysConfigExample sysConfigExamplerbwHomeSeoDesc = new SysConfigExample();
		  Criteria criteriarbwHomeSeoDesc = sysConfigExamplerbwHomeSeoDesc.createCriteria();
		  criteriarbwHomeSeoDesc.andKeyNameEqualTo("scinter_package_seo_desc");
		  criteriarbwHomeSeoDesc.andValueNotEqualTo("");
		  if(StringUtils.isNotBlank(branchCompany)){
			  criteriarbwHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "sjzrbw1";
				criteriarbwHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
			}
		  SysConfig packageSeoDesc= null;
		  if(sysConfigMapper.selectByExample(sysConfigExamplerbwHomeSeoDesc).size()> 0){
			  packageSeoDesc = sysConfigMapper.selectByExample(sysConfigExamplerbwHomeSeoDesc).get(0);
		  }
		  model.addObject("currentBCompany", branchCompany);
		  model.addObject("branchCompany", branchCompany);
		  model.addObject("packageSeoTitle", packageSeoTitle);
		  model.addObject("packageSeoKeyword", packageSeoKeyword);
		  model.addObject("packageSeoDesc", packageSeoDesc);
		  if(branchCompany.equals("sjzrbw1")){
			  if(StringUtils.isNotBlank(key)){
				  try {
					key = new String(key.getBytes("ISO-8859-1"),"utf-8");
				} catch (UnsupportedEncodingException e) {
					System.out.println(e.getMessage());
				}
				  model.setViewName("www/Integrated_package_sjz_"+key);
			  }else{
				  model.setViewName("www/Integrated_package_sjz_279");
			  }
		  }else if(branchCompany.equals("bdrbw1")){
			  
			  if(StringUtils.isNotBlank(key)){
				  try {
					key = new String(key.getBytes("ISO-8859-1"),"utf-8");
				} catch (UnsupportedEncodingException e) {
					System.out.println(e.getMessage());
				}
				  model.setViewName("www/Integrated_package_bd_"+key);
			  }else{
				  model.setViewName("www/Integrated_package_bd_279");
			  }
		  }else if(branchCompany.equals("hsrbw1")){
			  if(StringUtils.isNotBlank(key)){
				  try {
					key = new String(key.getBytes("ISO-8859-1"),"utf-8");
				} catch (UnsupportedEncodingException e) {
					System.out.println(e.getMessage());
				}
				  model.setViewName("www/Integrated_package_hs_"+key);
			  }else{
				  model.setViewName("www/Integrated_package_hs_279");
			  }
		  }else if(branchCompany.equals("lfrbw1")){
			  if(StringUtils.isNotBlank(key)){
				  try {
					key = new String(key.getBytes("ISO-8859-1"),"utf-8");
				} catch (UnsupportedEncodingException e) {
					System.out.println(e.getMessage());
				}
				  model.setViewName("www/Integrated_package_lf_"+key);
			  }else{
				  model.setViewName("www/Integrated_package_lf_299");
			  }
		  }
		  return model;
	}
	
	
}
