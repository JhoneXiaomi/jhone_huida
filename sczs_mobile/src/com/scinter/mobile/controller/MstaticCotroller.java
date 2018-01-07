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

import com.mBase.controller.MbaseController;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.model.SysConfig;
import com.scinter.www.model.SysConfigExample;
import com.scinter.www.model.SysConfigExample.Criteria;

@Controller
public class MstaticCotroller extends MbaseController{

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
	      SysConfigExample sysConfigExampleScinterHomeSeoTitle = new SysConfigExample();
	      Criteria criteriaScinterHomeSeoTitle = sysConfigExampleScinterHomeSeoTitle.createCriteria();
	      criteriaScinterHomeSeoTitle.andKeyNameEqualTo("scinter_about_seoTitle_str");
	      criteriaScinterHomeSeoTitle.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(branchCompany)){
	    	  criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjsc";
				criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
			}
	      SysConfig scinterAboutSeoTitleStr= null;
	      if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).size()> 0){
	    	  scinterAboutSeoTitleStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).get(0);
	      }
		// SEO 关键字信息
	      SysConfigExample sysConfigExampleScinterhomeSeoKeyword = new SysConfigExample();
	      Criteria criteriaScinterhomeSeoKeyword = sysConfigExampleScinterhomeSeoKeyword.createCriteria();
	      criteriaScinterhomeSeoKeyword.andKeyNameEqualTo("scinter_about_seoKeyword_str");
	      criteriaScinterhomeSeoKeyword.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(branchCompany)){
	    	  criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjsc";
				criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
			}
	      SysConfig scinterAboutSeoKeywordStr= null;
	      if(sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).size()> 0){
	    	  scinterAboutSeoKeywordStr = sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).get(0);
	      }
	      // SEO 描述信息
	      SysConfigExample sysConfigExampleScinterHomeSeoDesc = new SysConfigExample();
	      Criteria criteriaScinterHomeSeoDesc = sysConfigExampleScinterHomeSeoDesc.createCriteria();
	      criteriaScinterHomeSeoDesc.andKeyNameEqualTo("scinter_about_seoDesc_str");
	      criteriaScinterHomeSeoDesc.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(branchCompany)){
	    	  criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjsc";
				criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
			}
	      SysConfig scinterAboutSeoDescStr= null;
	      if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).size()> 0){
	    	  scinterAboutSeoDescStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).get(0);
	      }
	      session.setAttribute("scinterAboutSeoTitleStr", scinterAboutSeoTitleStr);
	      session.setAttribute("scinterAboutSeoKeywordStr", scinterAboutSeoKeywordStr);
	      session.setAttribute("scinterAboutSeoDescStr", scinterAboutSeoDescStr);
	      model.addObject("currentBCompany", branchCompany);
	      model.addObject("scinterAboutSeoTitleStr", scinterAboutSeoTitleStr);
	      model.addObject("scinterAboutSeoKeywordStr", scinterAboutSeoKeywordStr);
	      model.addObject("scinterAboutSeoDescStr", scinterAboutSeoDescStr);
		  model.setViewName("mobile/m_about");
		  return model;
	}
	
	@RequestMapping(value="lanzuan")
	public ModelAndView blueDiamondProcess(HttpServletRequest request,HttpSession session){
		
		  /*获取共有信息*/
		  super.getHomeMessage(request, session);
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
				branchCompany = "bjsc";
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
				branchCompany = "bjsc";
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
				branchCompany = "bjsc";
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
		  model.setViewName("mobile/m_lanzuan");
		  return model;
	}
	

	@RequestMapping(value="zztc")
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
		  SysConfigExample sysConfigExampleScinterHomeSeoTitle = new SysConfigExample();
		  Criteria criteriaScinterHomeSeoTitle = sysConfigExampleScinterHomeSeoTitle.createCriteria();
		  criteriaScinterHomeSeoTitle.andKeyNameEqualTo("scinter_package_seo_title");
		  criteriaScinterHomeSeoTitle.andValueNotEqualTo("");
		  if(StringUtils.isNotBlank(branchCompany)){
			  criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjsc";
				criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
			}
		  SysConfig scinterPackageSeoTitle= null;
		  if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).size()> 0){
			  scinterPackageSeoTitle = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).get(0);
		  }
		 // SEO 关键字信息
		  SysConfigExample sysConfigExampleScinterhomeSeoKeyword = new SysConfigExample();
		  Criteria criteriaScinterhomeSeoKeyword = sysConfigExampleScinterhomeSeoKeyword.createCriteria();
		  criteriaScinterhomeSeoKeyword.andKeyNameEqualTo("scinter_package_seo_keyword");
		  criteriaScinterhomeSeoKeyword.andValueNotEqualTo("");
		  if(StringUtils.isNotBlank(branchCompany)){
			  criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjsc";
				criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
			}
		  SysConfig scinterPackageSeoKeyword= null;
		  if(sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).size()> 0){
			  scinterPackageSeoKeyword = sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).get(0);
		  }
		  // SEO 描述信息
		  SysConfigExample sysConfigExampleScinterHomeSeoDesc = new SysConfigExample();
		  Criteria criteriaScinterHomeSeoDesc = sysConfigExampleScinterHomeSeoDesc.createCriteria();
		  criteriaScinterHomeSeoDesc.andKeyNameEqualTo("scinter_package_seo_desc");
		  criteriaScinterHomeSeoDesc.andValueNotEqualTo("");
		  if(StringUtils.isNotBlank(branchCompany)){
			  criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjsc";
				criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
			}
		  SysConfig scinterPackageSeoDesc= null;
		  if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).size()> 0){
			  scinterPackageSeoDesc = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).get(0);
		  }
		  session.setAttribute("scinterPackageSeoTitle", scinterPackageSeoTitle);
		  session.setAttribute("scinterPackageSeoKeyword", scinterPackageSeoKeyword);
		  session.setAttribute("scinterPackageSeoDesc", scinterPackageSeoDesc);
		  model.addObject("currentBCompany", branchCompany);
		  model.addObject("scinterPackageSeoTitle", scinterPackageSeoTitle);
		  model.addObject("scinterPackageSeoKeyword", scinterPackageSeoKeyword);
		  model.addObject("scinterPackageSeoDesc", scinterPackageSeoDesc);
		  if(branchCompany.equals("bjsc")){
			  model.setViewName("mobile/m_zztc");
		  }else if(branchCompany.equals("bdsc")){
			  
			  if(StringUtils.isNotBlank(key)){
				  try {
					key = new String(key.getBytes("ISO-8859-1"),"utf-8");
				} catch (UnsupportedEncodingException e) {
					System.out.println(e.getMessage());
				}
				  model.setViewName("Integrated_package_bd_"+key);
			  }else{
				  model.setViewName("mobile/m_zztc_bd");
			  }
		  }else if(branchCompany.equals("hssc")){
			  model.setViewName("mobile/m_zztc");
		  }else if(branchCompany.equals("tjsc")){
			  model.setViewName("mobile/m_zztc_tj");
		  }else{
			  model.setViewName("mobile/m_zztc");
		  }
		  return model;
	}
	
	
	
	/**
	 * 整装套餐全部公司的
	 * @param key eg 588套餐 555套餐
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value="zztcAll")
	public ModelAndView zztcAll(
			@RequestParam(value="key",required=false)String key,
			HttpServletRequest request,HttpSession session){
		
		  /*获取共有信息*/
		  super.getHomeMessage(request, session);
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
				branchCompany = "bjsc";
				criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
			}
		  SysConfig scinterPackageSeoTitle= null;
		  if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).size()> 0){
			  scinterPackageSeoTitle = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).get(0);
		  }
		 // SEO 关键字信息
		  SysConfigExample sysConfigExampleScinterhomeSeoKeyword = new SysConfigExample();
		  Criteria criteriaScinterhomeSeoKeyword = sysConfigExampleScinterhomeSeoKeyword.createCriteria();
		  criteriaScinterhomeSeoKeyword.andKeyNameEqualTo("scinter_package_seo_keyword");
		  criteriaScinterhomeSeoKeyword.andValueNotEqualTo("");
		  if(StringUtils.isNotBlank(branchCompany)){
			  criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjsc";
				criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
			}
		  SysConfig scinterPackageSeoKeyword= null;
		  if(sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).size()> 0){
			  scinterPackageSeoKeyword = sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).get(0);
		  }
		  // SEO 描述信息
		  SysConfigExample sysConfigExampleScinterHomeSeoDesc = new SysConfigExample();
		  Criteria criteriaScinterHomeSeoDesc = sysConfigExampleScinterHomeSeoDesc.createCriteria();
		  criteriaScinterHomeSeoDesc.andKeyNameEqualTo("scinter_package_seo_desc");
		  criteriaScinterHomeSeoDesc.andValueNotEqualTo("");
		  if(StringUtils.isNotBlank(branchCompany)){
			  criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjsc";
				criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
			}
		  SysConfig scinterPackageSeoDesc= null;
		  if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).size()> 0){
			  scinterPackageSeoDesc = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).get(0);
		  }
		  session.setAttribute("scinterPackageSeoTitle", scinterPackageSeoTitle);
		  session.setAttribute("scinterPackageSeoKeyword", scinterPackageSeoKeyword);
		  session.setAttribute("scinterPackageSeoDesc", scinterPackageSeoDesc);
		  model.addObject("currentBCompany", branchCompany);
		  model.addObject("scinterPackageSeoTitle", scinterPackageSeoTitle);
		  model.addObject("scinterPackageSeoKeyword", scinterPackageSeoKeyword);
		  model.addObject("scinterPackageSeoDesc", scinterPackageSeoDesc);
		  model.setViewName("mobile/m_zztc_all_"+key);
		  return model;
	}
	
	@RequestMapping(value="txxw")
	public ModelAndView tengXunXinWen(
			@RequestParam(value="key",required=false)String key,
			HttpServletRequest request,HttpSession session){
		ModelAndView model = new ModelAndView();
		if(key.lastIndexOf("/")==-1){
			model.setViewName("/mobile/txxw_"+key);
		}else{
			model.setViewName("/mobile/txxw_"+key.substring(0, key.lastIndexOf("/")));
		}
		  return model;
	}
}
