package com.scinter.www.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.scinter.base.baseController.BaseController;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.model.SysConfig;
import com.scinter.www.model.SysConfigExample;
import com.scinter.www.model.SysConfigExample.Criteria;

@Controller
public class StaticCotroller extends BaseController{

	@Autowired
	private SysConfigMapper sysConfigMapper;
	
	@RequestMapping(value="about")
	public ModelAndView about(HttpServletRequest request,HttpSession session){
		
		/*获取共有信息*/
		super.getPublicMes(session);
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
		  model.setViewName("www/about");
		  return model;
	}
	
	@RequestMapping(value="blueDiamondProcess")
	public ModelAndView blueDiamondProcess(HttpServletRequest request,HttpSession session){
		
		  /*获取共有信息*/
		  super.getPublicMes(session);
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
	

	@RequestMapping(value="IntegratedPackage")
	public ModelAndView IntegratedPackage(
			@RequestParam(value="key",required=false)String key,
			HttpServletRequest request,HttpSession session){
		
		  /*获取共有信息*/
		  super.getPublicMes(session);
		  // 获取分公司
		  String branchCompany = (String) session.getAttribute("branchCompany");
		  if(StringUtils.isBlank(branchCompany)){
			  branchCompany = "bjxz";
		  }
		  ModelAndView model = new ModelAndView();
		  /*获取SEO 的配置信息*/
		  // SEO 标题信息
		  SysConfigExample sysConfigExampleScinterHomeSeoTitle = new SysConfigExample();
		  Criteria criteriaScinterHomeSeoTitle = sysConfigExampleScinterHomeSeoTitle.createCriteria();
		  criteriaScinterHomeSeoTitle.andKeyNameEqualTo("scinter_package_seo_title");
		  criteriaScinterHomeSeoTitle.andValueNotEqualTo("");
		  criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
		  SysConfig packageSeoTitle= null;
		  if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).size()> 0){
			  packageSeoTitle = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).get(0);
		  }
		 // SEO 关键字信息
		  SysConfigExample sysConfigExampleScinterhomeSeoKeyword = new SysConfigExample();
		  Criteria criteriaScinterhomeSeoKeyword = sysConfigExampleScinterhomeSeoKeyword.createCriteria();
		  criteriaScinterhomeSeoKeyword.andKeyNameEqualTo("scinter_package_seo_keyword");
		  criteriaScinterhomeSeoKeyword.andValueNotEqualTo("");
		  criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
		  SysConfig packageSeoKeyword= null;
		  if(sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).size()> 0){
			  packageSeoKeyword = sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).get(0);
		  }
		  // SEO 描述信息
		  SysConfigExample sysConfigExampleScinterHomeSeoDesc = new SysConfigExample();
		  Criteria criteriaScinterHomeSeoDesc = sysConfigExampleScinterHomeSeoDesc.createCriteria();
		  criteriaScinterHomeSeoDesc.andKeyNameEqualTo("scinter_package_seo_desc");
		  criteriaScinterHomeSeoDesc.andValueNotEqualTo("");
		  criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
		  SysConfig packageSeoDesc= null;
		  if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).size()> 0){
			  packageSeoDesc = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).get(0);
		  }
		  model.addObject("currentBCompany", branchCompany);
		  model.addObject("packageSeoTitle", packageSeoTitle);
		  model.addObject("packageSeoKeyword", packageSeoKeyword);
		  model.addObject("packageSeoDesc", packageSeoDesc);
		  
		  System.out.println("key"+key+"branchCompany"+branchCompany);
		  if(branchCompany.equals("bjxz")){
			  model.setViewName("www/Integrated_package");
		  }else if(branchCompany.equals("bdxz")){
			  
			  if(StringUtils.isNotBlank(key)){
				  try {
					key = new String(key.getBytes("ISO-8859-1"),"utf-8");
				} catch (UnsupportedEncodingException e) {
					System.out.println(e.getMessage());
				}
				  model.setViewName("www/Integrated_package_bd_"+key);
			  }else{
				  model.setViewName("www/Integrated_package_bd_378");
			  }
		  }else if(branchCompany.equals("hssc")){
			  model.setViewName("www/Integrated_package_hs");
		  }else if(branchCompany.equals("tjsc")){
			  model.setViewName("www/Integrated_package_tj");
		  }else{
			  model.setViewName("www/Integrated_package");
		  }
		  return model;
	}
	
	
	/**
	 * 新房套餐
	 * 
	 * @author JhoneZhang
	 * @date   2016年11月1日下午1:40:08
	 * @param key
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value="IntegratedPackageNew")
	public ModelAndView IntegratedPackageNew(
			@RequestParam(value="key",required=false)String key,
			HttpServletRequest request,HttpSession session){
		
		  /*获取共有信息*/
		  super.getPublicMes(session);
		  // 获取分公司
		  String branchCompany = "";
		  if(StringUtils.isBlank(branchCompany)){
			  branchCompany = (String) session.getAttribute("branchCompany");
		  }else{
			  branchCompany = "bjxz";
		  }
		  ModelAndView model = new ModelAndView();
		  /*获取SEO 的配置信息*/
		  // SEO 标题信息
		  SysConfigExample sysConfigExampleScinterHomeSeoTitle = new SysConfigExample();
		  Criteria criteriaScinterHomeSeoTitle = sysConfigExampleScinterHomeSeoTitle.createCriteria();
		  criteriaScinterHomeSeoTitle.andKeyNameEqualTo("scinter_package_seo_title");
		  criteriaScinterHomeSeoTitle.andValueNotEqualTo("");
		  criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
		  SysConfig packageSeoTitle= null;
		  if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).size()> 0){
			  packageSeoTitle = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).get(0);
		  }
		 // SEO 关键字信息
		  SysConfigExample sysConfigExampleScinterhomeSeoKeyword = new SysConfigExample();
		  Criteria criteriaScinterhomeSeoKeyword = sysConfigExampleScinterhomeSeoKeyword.createCriteria();
		  criteriaScinterhomeSeoKeyword.andKeyNameEqualTo("scinter_package_seo_keyword");
		  criteriaScinterhomeSeoKeyword.andValueNotEqualTo("");
		  criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
		  SysConfig packageSeoKeyword= null;
		  if(sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).size()> 0){
			  packageSeoKeyword = sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).get(0);
		  }
		  // SEO 描述信息
		  SysConfigExample sysConfigExampleScinterHomeSeoDesc = new SysConfigExample();
		  Criteria criteriaScinterHomeSeoDesc = sysConfigExampleScinterHomeSeoDesc.createCriteria();
		  criteriaScinterHomeSeoDesc.andKeyNameEqualTo("scinter_package_seo_desc");
		  criteriaScinterHomeSeoDesc.andValueNotEqualTo("");
		  criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
		  SysConfig packageSeoDesc= null;
		  if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).size()> 0){
			  packageSeoDesc = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).get(0);
		  }
		  model.addObject("currentBCompany", branchCompany);
		  model.addObject("packageSeoTitle", packageSeoTitle);
		  model.addObject("packageSeoKeyword", packageSeoKeyword);
		  model.addObject("packageSeoDesc", packageSeoDesc);
		  
		  System.out.println("key"+key);
		  if(branchCompany.equals("bjxz")){
			  
			  model.setViewName("www/Integrated_package_new");
		  }else if(branchCompany.equals("tsxz")){
			  
			  if(StringUtils.isNotBlank(key)){
				  try {
					key = new String(key.getBytes("ISO-8859-1"),"utf-8");
				} catch (UnsupportedEncodingException e) {
					System.out.println(e.getMessage());
				}
				  model.setViewName("www/Integrated_package_new_ts_"+key);
			  }else{
				  model.setViewName("www/Integrated_package_new_ts_308");
			  }
		  }else if(branchCompany.equals("bdxz")){
			  
			  if(StringUtils.isNotBlank(key)){
				  try {
					key = new String(key.getBytes("ISO-8859-1"),"utf-8");
				} catch (UnsupportedEncodingException e) {
					System.out.println(e.getMessage());
				}
				  model.setViewName("www/Integrated_package_new_bd_"+key);
			  }else{
				  model.setViewName("www/Integrated_package_new_bd_378");
			  }
		  }else if(branchCompany.equals("sjzxz")){
			  
			  if(StringUtils.isNotBlank(key)){
				  try {
					key = new String(key.getBytes("ISO-8859-1"),"utf-8");
				} catch (UnsupportedEncodingException e) {
					System.out.println(e.getMessage());
				}
				  model.setViewName("www/Integrated_package_new_sjz_"+key);
			  }else{
				  model.setViewName("www/Integrated_package_new_sjz");
			  }
		  }else if(branchCompany.equals("tyxz")){
			  
			  if(StringUtils.isNotBlank(key)){
				  try {
					key = new String(key.getBytes("ISO-8859-1"),"utf-8");
				} catch (UnsupportedEncodingException e) {
					System.out.println(e.getMessage());
				}
				  model.setViewName("www/Integrated_package_new_ty_"+key);
			  }else{
				  model.setViewName("www/Integrated_package_new_ty");
			  }
		  }else if(branchCompany.equals("tjsc")){
			  
			  model.setViewName("www/Integrated_package_new_tj");
		  }else{
			  
			  model.setViewName("www/Integrated_package_new");
		  }
		  return model;
	}
	
	@RequestMapping(value="activity")
	public ModelAndView activty(@RequestParam(value="key",required=false)String key,
			HttpServletRequest request,HttpSession session){
		super.getPublicMes(session);
		 ModelAndView model = new ModelAndView();
		 model.setViewName("www/activity_"+key);
		 return model;
	}
}
