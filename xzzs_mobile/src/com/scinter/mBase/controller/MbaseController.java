package com.scinter.mBase.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.scinter.www.dao.CasesMapper;
import com.scinter.www.dao.DesignerMapper;
import com.scinter.www.dao.HotBuildingMapper;
import com.scinter.www.dao.NewsMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.dao.SysLogMapper;
import com.scinter.www.model.SysConfig;
import com.scinter.www.model.SysConfigExample;
import com.scinter.www.model.SysConfigExample.Criteria;

@Controller
public class MbaseController {


	@Autowired
	private SysLogMapper sysLogMapper;
	@Autowired
	private CasesMapper caseMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	@Autowired
	private NewsMapper newsMapper;
	@Autowired
	private HotBuildingMapper hotBuildingMapper;
	@Autowired
	private CasesMapper casesMapper;
	@Autowired
	private DesignerMapper disignerMapper;
	
	public void getPublicMes(HttpServletRequest request,HttpSession session){
		
		ModelAndView model = new ModelAndView();  
		String branchCompany = (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany))
			branchCompany = "bjxz";
		
		// 获取首页头部的logo
		SysConfigExample sysConfigExampleLogo = new SysConfigExample();
	    Criteria csysLo = sysConfigExampleLogo.createCriteria();
	    csysLo.andKeyNameEqualTo("scinter_home_M_logoImg");
	    sysConfigExampleLogo.setOrderByClause("config_id desc");
		csysLo.andBranchCompanyEqualTo(branchCompany);
	    SysConfig MhomeLo = null;
	    if(sysConfigMapper.selectByExample(sysConfigExampleLogo).size()>0){
	    	  MhomeLo = sysConfigMapper.selectByExample(sysConfigExampleLogo).get(0);
	    }
	    
	    //  获取首页底部二维码图片
		SysConfigExample sysConfigExampleTwoCodeImg = new SysConfigExample();
	    Criteria csysTc = sysConfigExampleTwoCodeImg.createCriteria();
	    csysTc.andKeyNameEqualTo("scinter_home_M_twoCodeImg");
	    sysConfigExampleTwoCodeImg.setOrderByClause("config_id desc");
		csysTc.andBranchCompanyEqualTo(branchCompany);
	    SysConfig MhomeTc = null;
	    if(sysConfigMapper.selectByExample(sysConfigExampleTwoCodeImg).size()>0){
	    	   MhomeTc = sysConfigMapper.selectByExample(sysConfigExampleTwoCodeImg).get(0);
	    }
	    
	    //  获取公司地址
		SysConfigExample sysConfigExampleAddress = new SysConfigExample();
	    Criteria csysAddress= sysConfigExampleAddress.createCriteria();
	    csysAddress.andKeyNameEqualTo("scinter_home_address");
	    csysAddress.andValueNotEqualTo("");
		csysAddress.andBranchCompanyEqualTo(branchCompany);
	    SysConfig MhomeAdress = null;
	    if(sysConfigMapper.selectByExample(sysConfigExampleAddress).size()>0){
	    	  MhomeAdress = sysConfigMapper.selectByExample(sysConfigExampleAddress).get(0);
	    }
	    
	    //  获取公司电话
		SysConfigExample sysConfigExampleTelePhone = new SysConfigExample();
	    Criteria csysTp= sysConfigExampleTelePhone.createCriteria();
	    csysTp.andKeyNameEqualTo("scinter_home_M_telePhone");
		csysTp.andBranchCompanyEqualTo(branchCompany);
	    csysTp.andValueNotEqualTo("");
	    SysConfig MhomeTp = null;
	    if(sysConfigMapper.selectByExample(sysConfigExampleTelePhone).size()>0){
	    	
	        MhomeTp = sysConfigMapper.selectByExample(sysConfigExampleTelePhone).get(0);
	    }
	    
	    //  获取百度商桥的信息
		SysConfigExample sysConfigExampleShangqiao = new SysConfigExample();
	    Criteria csysSq= sysConfigExampleShangqiao.createCriteria();
	    csysSq.andKeyNameEqualTo("scinter_home_M_shangQiao");
	    csysSq.andValueNotEqualTo("");
		csysSq.andBranchCompanyEqualTo(branchCompany);
	    SysConfig shangqiao= null;
	    if(sysConfigMapper.selectByExample(sysConfigExampleShangqiao).size()> 0){
	    	shangqiao = sysConfigMapper.selectByExample(sysConfigExampleShangqiao).get(0);
	    }
	    
	    //  获取百度统计的信息
		SysConfigExample sysConfigExampleStatistics = new SysConfigExample();
	    com.scinter.www.model.SysConfigExample.Criteria csystat= sysConfigExampleStatistics.createCriteria();
	    csystat.andKeyNameEqualTo("scinter_home_statistics");
	    csystat.andValueNotEqualTo("");
		csystat.andBranchCompanyEqualTo(branchCompany);
	    SysConfig statistics= null;
	    if(sysConfigMapper.selectByExample(sysConfigExampleStatistics).size()> 0){
	    	
	    	statistics = sysConfigMapper.selectByExample(sysConfigExampleStatistics).get(0);
	    }
	    

		  /*获取SEO 的配置信息*/
	      // SEO 标题信息
	      SysConfigExample sysConfigExampleScinterHomeSeoTitle = new SysConfigExample();
	      Criteria criteriaScinterHomeSeoTitle = sysConfigExampleScinterHomeSeoTitle.createCriteria();
	      criteriaScinterHomeSeoTitle.andKeyNameEqualTo("scinter_home_seo_title");
	      criteriaScinterHomeSeoTitle.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(branchCompany)){
	    	  criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjxz";
				criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
			}
	      SysConfig statScinterHomeSeoTitle= null;
	      if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).size()> 0){
	    	  statScinterHomeSeoTitle = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).get(0);
	      }
	      
	      // SEO 关键字信息
	      SysConfigExample sysConfigExampleScinterhomeSeoKeyword = new SysConfigExample();
	      Criteria criteriaScinterhomeSeoKeyword = sysConfigExampleScinterhomeSeoKeyword.createCriteria();
	      criteriaScinterhomeSeoKeyword.andKeyNameEqualTo("scinter_home_seo_keyword");
	      criteriaScinterhomeSeoKeyword.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(branchCompany)){
	    	  criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjxz";
				criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
			}
	      SysConfig statScinterhomeSeoKeyword= null;
	      if(sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).size()> 0){
	      	
	    	  statScinterhomeSeoKeyword = sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).get(0);
	      }
	      
	      // SEO 描述信息
	      SysConfigExample sysConfigExampleScinterHomeSeoDesc = new SysConfigExample();
	      Criteria criteriaScinterHomeSeoDesc = sysConfigExampleScinterHomeSeoDesc.createCriteria();
	      criteriaScinterHomeSeoDesc.andKeyNameEqualTo("scinter_home_seo_desc");
	      criteriaScinterHomeSeoDesc.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(branchCompany)){
	    	  criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjxz";
				criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
			}
	      SysConfig statScinterHomeSeoDesc= null;
	      if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).size()> 0){
	      	
	    	  statScinterHomeSeoDesc = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).get(0);
	      }
	      
        // 将信息保存到session中
	    session.setAttribute("statScinterHomeSeoTitle", statScinterHomeSeoTitle);
	    session.setAttribute("statScinterhomeSeoKeyword", statScinterhomeSeoKeyword);
	    session.setAttribute("statScinterHomeSeoDesc", statScinterHomeSeoDesc);
	    session.setAttribute("statistics", statistics);
	    session.setAttribute("shangqiao", shangqiao);
	    session.setAttribute("MhomeAdress",MhomeAdress );
	    session.setAttribute("MhomeTp",MhomeTp );
	    session.setAttribute("MhomeTc",MhomeTc );
	    session.setAttribute("branchCompany", branchCompany);
	    session.setAttribute("MhomeLo", MhomeLo);
	    model.addObject("statistics", statistics);
	    model.addObject("shangqiao", shangqiao);
	    model.addObject("MhomeLo", MhomeLo);
	    model.addObject("MhomeTc", MhomeTc); 
	    model.addObject("MhomeTp", MhomeTp);
	    model.addObject("MhomeAdress", MhomeAdress);
	    model.addObject("statScinterHomeSeoTitle", statScinterHomeSeoTitle);
	    model.addObject("statScinterhomeSeoKeyword", statScinterhomeSeoKeyword);
	    model.addObject("statScinterHomeSeoDesc", statScinterHomeSeoDesc);
	}
}
