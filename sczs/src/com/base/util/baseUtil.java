package com.base.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import com.base.controller.BaseController;
import com.scinter.www.dao.CasesMapper;
import com.scinter.www.dao.DesignerMapper;
import com.scinter.www.dao.HotBuildingMapper;
import com.scinter.www.dao.NewsMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.dao.SysLogMapper;
import com.scinter.www.model.SysConfig;
import com.scinter.www.model.SysConfigExample;
import com.scinter.www.model.SysConfigExample.Criteria;

public class baseUtil {

		/*定义日志变量*/
		private Logger logger = Logger.getLogger(BaseController.class);
		@Autowired
		private SysLogMapper sysLogMapper;
		@Autowired
		private CasesMapper caseMapper;
		@Autowired
		private static SysConfigMapper sysConfigMapper;
		@Autowired
		private NewsMapper newsMapper;
		@Autowired
		private HotBuildingMapper hotBuildingMapper;
		@Autowired
		private CasesMapper casesMapper;
		@Autowired
		private DesignerMapper disignerMapper;
		
	    public static void getHomeMessage(HttpServletRequest request,HttpSession session){
		  
		  ModelAndView model = new ModelAndView();  
//	           获取分公司
	      String MyBranchCompany = (String) session.getAttribute("branchCompany");
//	          获取首页LOGO
	  	  SysConfigExample sysConfigExampleLogo = new SysConfigExample();
	      Criteria csysLogo = sysConfigExampleLogo.createCriteria();
	      csysLogo.andKeyNameEqualTo("scinter_home_logo");
	      csysLogo.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(MyBranchCompany) && MyBranchCompany.length()>0){
	      	csysLogo.andBranchCompanyEqualTo(MyBranchCompany);
			}else{
				MyBranchCompany = "bjsc";
				csysLogo.andBranchCompanyEqualTo(MyBranchCompany);
			}
	      SysConfig  homeLogo =  null;
	      if(sysConfigMapper.selectByExample(sysConfigExampleLogo).size()>0){
	      	
	      	homeLogo= sysConfigMapper.selectByExample(sysConfigExampleLogo).get(0);
	      }
//	    获取首页底部二维码图片
	  	  SysConfigExample sysConfigExampleTwoCodeImg = new SysConfigExample();
	      Criteria csysTc = sysConfigExampleTwoCodeImg.createCriteria();
	      csysTc.andKeyNameEqualTo("scinter_home_twoCodeImg");
	      csysTc.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(MyBranchCompany) && MyBranchCompany.length()>0){
	      	csysTc.andBranchCompanyEqualTo(MyBranchCompany);
			}else{
				MyBranchCompany = "bjsc";
				csysTc.andBranchCompanyEqualTo(MyBranchCompany);
			}
	      SysConfig homeTc = null;
	      if(sysConfigMapper.selectByExample(sysConfigExampleTwoCodeImg).size()>0){
	          homeTc= sysConfigMapper.selectByExample(sysConfigExampleTwoCodeImg).get(0);
	      }
//	    获取首页底部友情链接
	  	  SysConfigExample sysConfigExampleFriendlyLink = new SysConfigExample();
	      Criteria csysFlink = sysConfigExampleFriendlyLink.createCriteria();
	      csysFlink.andKeyNameEqualTo("scinter_home_friendlyLink");
	      csysFlink.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(MyBranchCompany) && MyBranchCompany.length()>0){
	      	csysFlink.andBranchCompanyEqualTo(MyBranchCompany);
			}else{
				MyBranchCompany = "bjsc";
				csysFlink.andBranchCompanyEqualTo(MyBranchCompany);
			}
	      SysConfig homeLk = null;
	      if( sysConfigMapper.selectByExample(sysConfigExampleFriendlyLink).size()>0){
	      	
	      	homeLk = sysConfigMapper.selectByExample(sysConfigExampleFriendlyLink).get(0);
	      }
	      
//	    获取公司地址
	  	  SysConfigExample sysConfigExampleAddress = new SysConfigExample();
	      Criteria csysAddress= sysConfigExampleAddress.createCriteria();
	      csysAddress.andKeyNameEqualTo("scinter_home_address");
	      csysAddress.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(MyBranchCompany) && MyBranchCompany.length()>0){
	      	csysAddress.andBranchCompanyEqualTo(MyBranchCompany);
			}else{
				MyBranchCompany = "bjsc";
				csysAddress.andBranchCompanyEqualTo(MyBranchCompany);
			}
	      SysConfig homeAdress =null;
	      if(sysConfigMapper.selectByExample(sysConfigExampleAddress).size()>0){
	      	 homeAdress = sysConfigMapper.selectByExample(sysConfigExampleAddress).get(0);
	      }
	    
	      
//	    获取公司电话
	  	  SysConfigExample sysConfigExampleTelePhone = new SysConfigExample();
	      Criteria csysTp= sysConfigExampleTelePhone.createCriteria();
	      csysTp.andKeyNameEqualTo("scinter_home_telePhone");
	      csysTp.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(MyBranchCompany) && MyBranchCompany.length()>0){
	      	csysTp.andBranchCompanyEqualTo(MyBranchCompany);
			}else{
				MyBranchCompany = "bjsc";
				csysTp.andBranchCompanyEqualTo(MyBranchCompany);
			}
	      SysConfig homeTp = null;
	      if(sysConfigMapper.selectByExample(sysConfigExampleTelePhone).size()>0){
	      	homeTp = sysConfigMapper.selectByExample(sysConfigExampleTelePhone).get(0);
	      }
	      
//	    获取公司邮箱
	  	  SysConfigExample sysConfigExamplePost = new SysConfigExample();
	      Criteria csysPt= sysConfigExamplePost.createCriteria();
	      csysPt.andKeyNameEqualTo("scinter_home_postBox");
	      csysPt.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(MyBranchCompany) && MyBranchCompany.length()>0){
	      	csysPt.andBranchCompanyEqualTo(MyBranchCompany);
			}else{
				MyBranchCompany = "bjsc";
				csysPt.andBranchCompanyEqualTo(MyBranchCompany);
			}
	      SysConfig homePost = null;
	      if(sysConfigMapper.selectByExample(sysConfigExamplePost).size()>0){
	      	
	      	  homePost = sysConfigMapper.selectByExample(sysConfigExamplePost).get(0);
	      }
	      
//	    获取公司传真
	  	  SysConfigExample sysConfigExamplePortraiture = new SysConfigExample();
	      Criteria csysPort= sysConfigExamplePortraiture.createCriteria();
	      csysPort.andKeyNameEqualTo("scinter_home_portraiture");
	      csysPort.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(MyBranchCompany) && MyBranchCompany.length()>0){
	      	csysPort.andBranchCompanyEqualTo(MyBranchCompany);
			}else{
				MyBranchCompany = "bjsc";
				csysPort.andBranchCompanyEqualTo(MyBranchCompany);
			}
	      
	      SysConfig homePort = null;
	      if(sysConfigMapper.selectByExample(sysConfigExamplePortraiture).size()>0){
	      	 homePort= sysConfigMapper.selectByExample(sysConfigExamplePortraiture).get(0);
	      }

//	    获取百度商桥的信息
	  	  SysConfigExample sysConfigExampleShangqiao = new SysConfigExample();
	      Criteria csysSq= sysConfigExampleShangqiao.createCriteria();
	      csysSq.andKeyNameEqualTo("scinter_home_shangQiao");
	      csysSq.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(MyBranchCompany) && MyBranchCompany.length()>0){
	      	csysSq.andBranchCompanyEqualTo(MyBranchCompany);
			}else{
				MyBranchCompany = "bjsc";
				csysSq.andBranchCompanyEqualTo(MyBranchCompany);
			}
	      SysConfig shangqiao= null;
	      if(sysConfigMapper.selectByExample(sysConfigExampleShangqiao).size()> 0){
	      	
	      	shangqiao = sysConfigMapper.selectByExample(sysConfigExampleShangqiao).get(0);
	      }
//	    获取百度统计的信息
	  	  SysConfigExample sysConfigExampleStatistics = new SysConfigExample();
	      Criteria csystat= sysConfigExampleStatistics.createCriteria();
	      csystat.andKeyNameEqualTo("scinter_home_statistics");
	      csystat.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(MyBranchCompany) && MyBranchCompany.length()>0){
	      	csystat.andBranchCompanyEqualTo(MyBranchCompany);
			}else{
				MyBranchCompany = "bjsc";
				csystat.andBranchCompanyEqualTo(MyBranchCompany);
			}
	      SysConfig statistics= null;
	      if(sysConfigMapper.selectByExample(sysConfigExampleStatistics).size()> 0){
	      	
	      	statistics = sysConfigMapper.selectByExample(sysConfigExampleStatistics).get(0);
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
