package com.rbw.base.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import com.rbw.www.dao.CasesMapper;
import com.rbw.www.dao.DesignerMapper;
import com.rbw.www.dao.HotBuildingMapper;
import com.rbw.www.dao.NewsMapper;
import com.rbw.www.dao.SysConfigMapper;
import com.rbw.www.dao.SysLogMapper;
import com.rbw.www.model.SysConfig;
import com.rbw.www.model.SysConfigExample;
import com.rbw.www.model.SysConfigExample.Criteria;

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
    	  myBranchCompany = "sjzrbw1";
  	  }
      model.addObject("branchCompany", myBranchCompany);
      // 获取首页LOGO
  	  SysConfigExample sysConfigExampleLogo = new SysConfigExample();
      Criteria csysLogo = sysConfigExampleLogo.createCriteria();
      csysLogo.andKeyNameEqualTo("scinter_home_logo");
      csysLogo.andValueNotEqualTo("");
      if(StringUtils.isNotBlank(myBranchCompany)){
      	csysLogo.andBranchCompanyEqualTo(myBranchCompany);
	  }else{
		myBranchCompany = "sjzrbw1";
		csysLogo.andBranchCompanyEqualTo(myBranchCompany);
	  }
      SysConfig  homeLogo =  null;
      if(sysConfigMapper.selectByExample(sysConfigExampleLogo).size()>0){
      	
      	homeLogo= sysConfigMapper.selectByExample(sysConfigExampleLogo).get(0);
      }
      // 获取首页底部二维码图片
  	  SysConfigExample sysConfigExampleTwoCodeImg = new SysConfigExample();
      Criteria csysTc = sysConfigExampleTwoCodeImg.createCriteria();
      csysTc.andKeyNameEqualTo("scinter_home_twoCodeImg");
      csysTc.andValueNotEqualTo("");
	  csysTc.andBranchCompanyEqualTo(myBranchCompany);
      SysConfig homeTc = null;
      if(sysConfigMapper.selectByExample(sysConfigExampleTwoCodeImg).size()>0){
          homeTc= sysConfigMapper.selectByExample(sysConfigExampleTwoCodeImg).get(0);
      }
      //  获取首页底部友情链接
  	  SysConfigExample sysConfigExampleFriendlyLink = new SysConfigExample();
      Criteria csysFlink = sysConfigExampleFriendlyLink.createCriteria();
      csysFlink.andKeyNameEqualTo("scinter_home_friendlyLink");
      csysFlink.andValueNotEqualTo("");
	  csysFlink.andBranchCompanyEqualTo(myBranchCompany);
      SysConfig homeLk = null;
      if( sysConfigMapper.selectByExample(sysConfigExampleFriendlyLink).size()>0){
      	
      	homeLk = sysConfigMapper.selectByExample(sysConfigExampleFriendlyLink).get(0);
      }
      
      // 获取公司地址
  	  SysConfigExample sysConfigExampleAddress = new SysConfigExample();
      Criteria csysAddress= sysConfigExampleAddress.createCriteria();
      csysAddress.andKeyNameEqualTo("scinter_home_address");
      csysAddress.andValueNotEqualTo("");
	  csysAddress.andBranchCompanyEqualTo(myBranchCompany);
      SysConfig homeAdress =null;
      if(sysConfigMapper.selectByExample(sysConfigExampleAddress).size()>0){
      	 homeAdress = sysConfigMapper.selectByExample(sysConfigExampleAddress).get(0);
      }
      
      // 获取公司电话
  	  SysConfigExample sysConfigExampleTelePhone = new SysConfigExample();
      Criteria csysTp= sysConfigExampleTelePhone.createCriteria();
      csysTp.andKeyNameEqualTo("scinter_home_telePhone");
      csysTp.andValueNotEqualTo("");
	  csysTp.andBranchCompanyEqualTo(myBranchCompany);
      SysConfig homeTp = null;
      if(sysConfigMapper.selectByExample(sysConfigExampleTelePhone).size()>0){
      	homeTp = sysConfigMapper.selectByExample(sysConfigExampleTelePhone).get(0);
      }
      
      // 获取公司邮箱
  	  SysConfigExample sysConfigExamplePost = new SysConfigExample();
      Criteria csysPt= sysConfigExamplePost.createCriteria();
      csysPt.andKeyNameEqualTo("scinter_home_postBox");
      csysPt.andValueNotEqualTo("");
	  csysPt.andBranchCompanyEqualTo(myBranchCompany);
      SysConfig homePost = null;
      if(sysConfigMapper.selectByExample(sysConfigExamplePost).size()>0){
      	  homePost = sysConfigMapper.selectByExample(sysConfigExamplePost).get(0);
      }
      //  获取公司传真
  	  SysConfigExample sysConfigExamplePortraiture = new SysConfigExample();
      Criteria csysPort= sysConfigExamplePortraiture.createCriteria();
      csysPort.andKeyNameEqualTo("scinter_home_portraiture");
      csysPort.andValueNotEqualTo("");
	  csysPort.andBranchCompanyEqualTo(myBranchCompany);
      SysConfig homePort = null;
      if(sysConfigMapper.selectByExample(sysConfigExamplePortraiture).size()>0){
      	 homePort= sysConfigMapper.selectByExample(sysConfigExamplePortraiture).get(0);
      }
      //  获取百度商桥的信息
  	  SysConfigExample sysConfigExampleShangqiao = new SysConfigExample();
      Criteria csysSq= sysConfigExampleShangqiao.createCriteria();
      csysSq.andKeyNameEqualTo("scinter_home_shangQiao");
      csysSq.andValueNotEqualTo("");
	  csysSq.andBranchCompanyEqualTo(myBranchCompany);
      SysConfig shangqiao= null;
      if(sysConfigMapper.selectByExample(sysConfigExampleShangqiao).size()> 0){
      	shangqiao = sysConfigMapper.selectByExample(sysConfigExampleShangqiao).get(0);
      }
      // 获取分公司信息
  	  SysConfigExample scinterHomeChildCompanyE = new SysConfigExample();
      Criteria scinterHomeChildCompanyC = scinterHomeChildCompanyE.createCriteria();
      scinterHomeChildCompanyC.andKeyNameEqualTo("scinter_home_childCompany");
      scinterHomeChildCompanyC.andValueNotEqualTo("");
	  scinterHomeChildCompanyC.andBranchCompanyEqualTo(myBranchCompany);
      SysConfig scinterHomeChildCompany = null;
      if( sysConfigMapper.selectByExample(scinterHomeChildCompanyE).size()>0){
      	
    	  scinterHomeChildCompany = sysConfigMapper.selectByExample(scinterHomeChildCompanyE).get(0);
      }
      // 获取百度统计的信息
  	  SysConfigExample sysConfigExampleStatistics = new SysConfigExample();
      Criteria csystat= sysConfigExampleStatistics.createCriteria();
      csystat.andKeyNameEqualTo("scinter_home_statistics");
      csystat.andValueNotEqualTo("");
	  csystat.andBranchCompanyEqualTo(myBranchCompany);
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
	  criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(myBranchCompany);
      SysConfig statScinterHomeSeoTitle= null;
      if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).size()> 0){
    	  statScinterHomeSeoTitle = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).get(0);
      }
      
      // SEO 关键字信息
      SysConfigExample sysConfigExampleScinterhomeSeoKeyword = new SysConfigExample();
      Criteria criteriaScinterhomeSeoKeyword = sysConfigExampleScinterhomeSeoKeyword.createCriteria();
      criteriaScinterhomeSeoKeyword.andKeyNameEqualTo("scinter_home_seo_keyword");
      criteriaScinterhomeSeoKeyword.andValueNotEqualTo("");
	  criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(myBranchCompany);
      SysConfig statScinterhomeSeoKeyword= null;
      if(sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).size()> 0){
    	  statScinterhomeSeoKeyword = sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).get(0);
      }
      // SEO 描述信息
      SysConfigExample sysConfigExampleScinterHomeSeoDesc = new SysConfigExample();
      Criteria criteriaScinterHomeSeoDesc = sysConfigExampleScinterHomeSeoDesc.createCriteria();
      criteriaScinterHomeSeoDesc.andKeyNameEqualTo("scinter_home_seo_desc");
      criteriaScinterHomeSeoDesc.andValueNotEqualTo("");
	  criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(myBranchCompany);
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
      session.setAttribute("branchCompany", myBranchCompany);
      session.setAttribute("statScinterHomeSeoTitle", statScinterHomeSeoTitle);
      session.setAttribute("statScinterhomeSeoKeyword", statScinterhomeSeoKeyword);
      session.setAttribute("statScinterHomeSeoDesc", statScinterHomeSeoDesc);
      session.setAttribute("scinterHomeChildCompany", scinterHomeChildCompany);
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
}
