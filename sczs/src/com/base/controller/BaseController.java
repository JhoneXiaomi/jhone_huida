package com.base.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
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

public class BaseController {

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
	
  public void getHomeMessage(HttpServletRequest request,HttpSession session){
	  
	  ModelAndView model = new ModelAndView();  
	  // 获取分公司
      String myBranchCompany = (String) session.getAttribute("branchCompany");
      if(StringUtils.isBlank(myBranchCompany)){
    	  myBranchCompany = "bjsc";
      }
      // 获取首页LOGO
  	  SysConfigExample sysConfigExampleLogo = new SysConfigExample();
      Criteria csysLogo = sysConfigExampleLogo.createCriteria();
      csysLogo.andKeyNameEqualTo("scinter_home_logo");
	  csysLogo.andBranchCompanyEqualTo(myBranchCompany);
      SysConfig  homeLogo =  null;
      if(sysConfigMapper.selectByExample(sysConfigExampleLogo).size()>0){
      	
      	homeLogo= sysConfigMapper.selectByExample(sysConfigExampleLogo).get(0);
      }
      if(null == homeLogo){
    	   SysConfigExample sysE = new SysConfigExample();
    	   Criteria sysC = sysE.createCriteria();
    	   sysC.andKeyNameEqualTo("scinter_home_logo");
    	   sysC.andBranchCompanyEqualTo("bjsc");
    	   homeLogo = sysConfigMapper.selectByExample(sysE).get(0);
      }
      // 获取首页底部二维码图片
  	  SysConfigExample sysConfigExampleTwoCodeImg = new SysConfigExample();
      Criteria csysTc = sysConfigExampleTwoCodeImg.createCriteria();
      csysTc.andKeyNameEqualTo("scinter_home_twoCodeImg");
      csysTc.andValueNotEqualTo("");
      if(StringUtils.isNotBlank(myBranchCompany) && myBranchCompany.length()>0){
      	csysTc.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			csysTc.andBranchCompanyEqualTo(myBranchCompany);
		}
      SysConfig homeTc = null;
      if(sysConfigMapper.selectByExample(sysConfigExampleTwoCodeImg).size()>0){
          homeTc= sysConfigMapper.selectByExample(sysConfigExampleTwoCodeImg).get(0);
      }
      // 获取首页底部友情链接
  	  SysConfigExample sysConfigExampleFriendlyLink = new SysConfigExample();
      Criteria csysFlink = sysConfigExampleFriendlyLink.createCriteria();
      csysFlink.andKeyNameEqualTo("scinter_home_friendlyLink");
      csysFlink.andValueNotEqualTo("");
      if(StringUtils.isNotBlank(myBranchCompany) && myBranchCompany.length()>0){
      	csysFlink.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			csysFlink.andBranchCompanyEqualTo(myBranchCompany);
		}
      SysConfig homeLk = null;
      if( sysConfigMapper.selectByExample(sysConfigExampleFriendlyLink).size()>0){
      	
      	homeLk = sysConfigMapper.selectByExample(sysConfigExampleFriendlyLink).get(0);
      }
      
      // 获取公司地址
  	  SysConfigExample sysConfigExampleAddress = new SysConfigExample();
      Criteria csysAddress= sysConfigExampleAddress.createCriteria();
      csysAddress.andKeyNameEqualTo("scinter_home_address");
      csysAddress.andValueNotEqualTo("");
      if(StringUtils.isNotBlank(myBranchCompany) && myBranchCompany.length()>0){
      	csysAddress.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			csysAddress.andBranchCompanyEqualTo(myBranchCompany);
		}
      SysConfig homeAdress =null;
      if(sysConfigMapper.selectByExample(sysConfigExampleAddress).size()>0){
      	 homeAdress = sysConfigMapper.selectByExample(sysConfigExampleAddress).get(0);
      }
    
      
      // 获取公司电话
  	  SysConfigExample sysConfigExampleTelePhone = new SysConfigExample();
      Criteria csysTp= sysConfigExampleTelePhone.createCriteria();
      csysTp.andKeyNameEqualTo("scinter_home_telePhone");
      csysTp.andValueNotEqualTo("");
      if(StringUtils.isNotBlank(myBranchCompany) && myBranchCompany.length()>0){
      	csysTp.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			csysTp.andBranchCompanyEqualTo(myBranchCompany);
		}
      SysConfig homeTp = null;
      if(sysConfigMapper.selectByExample(sysConfigExampleTelePhone).size()>0){
      	homeTp = sysConfigMapper.selectByExample(sysConfigExampleTelePhone).get(0);
      }
      
      // 获取公司邮箱
  	  SysConfigExample sysConfigExamplePost = new SysConfigExample();
      Criteria csysPt= sysConfigExamplePost.createCriteria();
      csysPt.andKeyNameEqualTo("scinter_home_postBox");
      csysPt.andValueNotEqualTo("");
      if(StringUtils.isNotBlank(myBranchCompany) && myBranchCompany.length()>0){
      	csysPt.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			csysPt.andBranchCompanyEqualTo(myBranchCompany);
		}
      SysConfig homePost = null;
      if(sysConfigMapper.selectByExample(sysConfigExamplePost).size()>0){
      	
      	  homePost = sysConfigMapper.selectByExample(sysConfigExamplePost).get(0);
      }
      
      // 获取公司传真
  	  SysConfigExample sysConfigExamplePortraiture = new SysConfigExample();
      Criteria csysPort= sysConfigExamplePortraiture.createCriteria();
      csysPort.andKeyNameEqualTo("scinter_home_portraiture");
      csysPort.andValueNotEqualTo("");
      if(StringUtils.isNotBlank(myBranchCompany) && myBranchCompany.length()>0){
      	csysPort.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			csysPort.andBranchCompanyEqualTo(myBranchCompany);
		}
      
      SysConfig homePort = null;
      if(sysConfigMapper.selectByExample(sysConfigExamplePortraiture).size()>0){
      	 homePort= sysConfigMapper.selectByExample(sysConfigExamplePortraiture).get(0);
      }

      // 获取百度商桥的信息
  	  SysConfigExample sysConfigExampleShangqiao = new SysConfigExample();
      Criteria csysSq= sysConfigExampleShangqiao.createCriteria();
      csysSq.andKeyNameEqualTo("scinter_home_shangQiao");
      csysSq.andValueNotEqualTo("");
      if(StringUtils.isNotBlank(myBranchCompany) && myBranchCompany.length()>0){
      	csysSq.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			csysSq.andBranchCompanyEqualTo(myBranchCompany);
		}
      SysConfig shangqiao= null;
      if(sysConfigMapper.selectByExample(sysConfigExampleShangqiao).size()> 0){
      	
      	shangqiao = sysConfigMapper.selectByExample(sysConfigExampleShangqiao).get(0);
      }
      // 获取分公司信息
  	  SysConfigExample scinterHomeChildCompanyE = new SysConfigExample();
      Criteria scinterHomeChildCompanyC = scinterHomeChildCompanyE.createCriteria();
      scinterHomeChildCompanyC.andKeyNameEqualTo("scinter_home_childCompany");
      scinterHomeChildCompanyC.andValueNotEqualTo("");
      if(StringUtils.isNotBlank(myBranchCompany) && myBranchCompany.length()>0){
    	  scinterHomeChildCompanyC.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			scinterHomeChildCompanyC.andBranchCompanyEqualTo(myBranchCompany);
		}
      SysConfig scinterHomeChildCompany = null;
      if( sysConfigMapper.selectByExample(scinterHomeChildCompanyE).size()>0){
      	
    	  scinterHomeChildCompany = sysConfigMapper.selectByExample(scinterHomeChildCompanyE).get(0);
      }
      
      // 获取百度统计的信息
  	  SysConfigExample sysConfigExampleStatistics = new SysConfigExample();
      Criteria csystat= sysConfigExampleStatistics.createCriteria();
      csystat.andKeyNameEqualTo("scinter_home_statistics");
      csystat.andValueNotEqualTo("");
      if(StringUtils.isNotBlank(myBranchCompany) && myBranchCompany.length()>0){
      	csystat.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			csystat.andBranchCompanyEqualTo(myBranchCompany);
		}
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
      if(StringUtils.isNotBlank(myBranchCompany)){
    	  criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(myBranchCompany);
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
      if(StringUtils.isNotBlank(myBranchCompany)){
    	  criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(myBranchCompany);
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
      if(StringUtils.isNotBlank(myBranchCompany)){
    	  criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(myBranchCompany);
		}
      SysConfig statScinterHomeSeoDesc= null;
      if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).size()> 0){
      	
    	  statScinterHomeSeoDesc = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).get(0);
      }
      session.setAttribute("statistics", statistics);
      session.setAttribute("shangqiao", shangqiao);
      session.setAttribute("homeLogo",homeLogo );
      session.setAttribute("homePost",homePost );
      session.setAttribute("homeAdress",homeAdress );
      session.setAttribute("homeLk",homeLk );
      session.setAttribute("homeTp",homeTp );
      session.setAttribute("homePort",homePort );
      session.setAttribute("homeTc",homeTc );
      session.setAttribute("statScinterHomeSeoTitle", statScinterHomeSeoTitle);
      session.setAttribute("statScinterhomeSeoKeyword", statScinterhomeSeoKeyword);
      session.setAttribute("statScinterHomeSeoDesc", statScinterHomeSeoDesc);
      session.setAttribute("scinterHomeChildCompany", scinterHomeChildCompany);
      session.setAttribute("cityCompany", getCityCompany(myBranchCompany));
      model.addObject("scinterHomeChildCompany", scinterHomeChildCompany);
      model.addObject("statScinterHomeSeoTitle", statScinterHomeSeoTitle);
      model.addObject("statScinterhomeSeoKeyword", statScinterhomeSeoKeyword);
      model.addObject("statScinterHomeSeoDesc", statScinterHomeSeoDesc);
      model.addObject("homePort", homePost);
      model.addObject("homePost", homePort);
      model.addObject("homeLogo", homeLogo);
      model.addObject("homeTc", homeTc); 
      model.addObject("homeLk", homeLk);
      model.addObject("homeTp", homeTp);
      model.addObject("homeAdress", homeAdress);
      model.addObject("shangqiao", shangqiao);
      model.addObject("statistics", statistics);
	  
  }
  
  
  public String getCityCompany(String branchComany){
	  String cityCompany="";
	  if(branchComany.equals("bjsc")){
		  cityCompany="北京";
	  }
	  if(branchComany.equals("bdsc")){
		  cityCompany="保定";
	  }
	  if(branchComany.equals("tjsc")){
		  cityCompany="天津";
	  }
	  if(branchComany.equals("tssc")){
		  cityCompany="唐山";
	  }
	  if(branchComany.equals("lfsc")){
		  cityCompany="廊坊";
	  }
	  if(branchComany.equals("yjsc")){
		  cityCompany="燕郊";
	  }
	  if(branchComany.equals("sjzsc")){
		  cityCompany="石家庄";
	  }
	  if(branchComany.equals("tysc")){
		  cityCompany="太原";
	  }
	  if(branchComany.equals("hssc")){
		  cityCompany="衡水";
	  }
	  
	  if(branchComany.equals("bdsc")){
		  cityCompany="保定";
	  }
	  return cityCompany;
  }
}
