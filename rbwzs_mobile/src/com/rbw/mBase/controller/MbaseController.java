package com.rbw.mBase.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		//	获取session 中的 BranchCompany
		String myBranchCompany	= (String) session.getAttribute("branchCompany");
		//  获取首页头部的logo
		SysConfigExample sysConfigExampleLogo = new SysConfigExample();
	    Criteria csysLo = sysConfigExampleLogo.createCriteria();
	    csysLo.andKeyNameEqualTo("scinter_home_M_logoImg");
	    sysConfigExampleLogo.setOrderByClause("config_id desc");
	    if(StringUtils.isNotBlank(myBranchCompany)){
	    	csysLo.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "sjzrbw1";
			csysLo.andBranchCompanyEqualTo(myBranchCompany);
		}
	    SysConfig MhomeLo = null;
	    if(sysConfigMapper.selectByExample(sysConfigExampleLogo).size()>0){
	    	  MhomeLo = sysConfigMapper.selectByExample(sysConfigExampleLogo).get(0);
	    }
	    //  获取首页底部二维码图片
		SysConfigExample sysConfigExampleTwoCodeImg = new SysConfigExample();
	    Criteria csysTc = sysConfigExampleTwoCodeImg.createCriteria();
	    csysTc.andKeyNameEqualTo("scinter_home_M_twoCodeImg");
	    sysConfigExampleTwoCodeImg.setOrderByClause("config_id desc");
	    if(StringUtils.isNotBlank(myBranchCompany) && myBranchCompany.length()>0){
	    	csysTc.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "sjzrbw1";
			csysTc.andBranchCompanyEqualTo(myBranchCompany);
		}
	    SysConfig MhomeTc = null;
	    if(sysConfigMapper.selectByExample(sysConfigExampleTwoCodeImg).size()>0){
	    	   MhomeTc = sysConfigMapper.selectByExample(sysConfigExampleTwoCodeImg).get(0);
	    }
	    //  获取公司地址
		SysConfigExample sysConfigExampleAddress = new SysConfigExample();
	    Criteria csysAddress= sysConfigExampleAddress.createCriteria();
	    csysAddress.andKeyNameEqualTo("scinter_home_M_address");
	    csysAddress.andValueNotEqualTo("");
	    if(StringUtils.isNotBlank(myBranchCompany)){
	    	csysAddress.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "sjzrbw1";
			csysAddress.andBranchCompanyEqualTo(myBranchCompany);
		}
	    SysConfig MhomeAdress = null;
	    if(sysConfigMapper.selectByExample(sysConfigExampleAddress).size()>0){
	    	  MhomeAdress = sysConfigMapper.selectByExample(sysConfigExampleAddress).get(0);
	    }
	    //  获取公司电话
		SysConfigExample sysConfigExampleTelePhone = new SysConfigExample();
	    Criteria csysTp= sysConfigExampleTelePhone.createCriteria();
	    csysTp.andKeyNameEqualTo("scinter_home_M_telePhone");
	    if(StringUtils.isNotBlank(myBranchCompany) && myBranchCompany.length()>0){
	    	csysTp.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "sjzrbw1";
			csysTp.andBranchCompanyEqualTo(myBranchCompany);
		}
	    csysTp.andValueNotEqualTo("");
	    SysConfig MhomeTp = null;
	    if(sysConfigMapper.selectByExample(sysConfigExampleTelePhone).size()>0){
	    	
	        MhomeTp = sysConfigMapper.selectByExample(sysConfigExampleTelePhone).get(0);
	    }
	    //  获取公司邮箱
		SysConfigExample sysConfigExamplePost = new SysConfigExample();
	    Criteria csysPt= sysConfigExamplePost.createCriteria();
	    csysPt.andKeyNameEqualTo("scinter_home_M_postBox");
	    csysPt.andValueNotEqualTo("");
	    if(StringUtils.isNotBlank(myBranchCompany)){
	    	csysPt.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "sjzrbw1";
			csysPt.andBranchCompanyEqualTo(myBranchCompany);
		}
	    SysConfig MhomePost = null;
	    if(sysConfigMapper.selectByExample(sysConfigExamplePost).size()>0){
	    	
	    	  MhomePost = sysConfigMapper.selectByExample(sysConfigExamplePost).get(0);
	    }
	    //  获取联系人
		SysConfigExample sysConfigExamplePortraiture = new SysConfigExample();
	    Criteria csysPort= sysConfigExamplePortraiture.createCriteria();
	    csysPort.andKeyNameEqualTo("scinter_home_M_person");
	    csysPort.andValueNotEqualTo("");
	    if(StringUtils.isNotBlank(myBranchCompany)){
	    	csysPort.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "sjzrbw1";
			csysPort.andBranchCompanyEqualTo(myBranchCompany);
		}
	    SysConfig MhomePer = null;
	    if(sysConfigMapper.selectByExample(sysConfigExamplePortraiture).size()>0){
	    	
	    	   MhomePer = sysConfigMapper.selectByExample(sysConfigExamplePortraiture).get(0);
	    }
	    //  获取百度商桥的信息
		SysConfigExample sysConfigExampleShangqiao = new SysConfigExample();
	    Criteria csysSq= sysConfigExampleShangqiao.createCriteria();
	    csysSq.andKeyNameEqualTo("scinter_home_M_shangQiao");
	    csysSq.andValueNotEqualTo("");
	    if(StringUtils.isNotBlank(myBranchCompany)){
	    	csysSq.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "sjzrbw1";
			csysSq.andBranchCompanyEqualTo(myBranchCompany);
		}
	    SysConfig shangqiao= null;
	    if(sysConfigMapper.selectByExample(sysConfigExampleShangqiao).size()> 0){
	    	
	    	shangqiao = sysConfigMapper.selectByExample(sysConfigExampleShangqiao).get(0);
	    }
	    //  获取百度统计的信息
		SysConfigExample sysConfigExampleStatistics = new SysConfigExample();
	    com.rbw.www.model.SysConfigExample.Criteria csystat= sysConfigExampleStatistics.createCriteria();
	    csystat.andKeyNameEqualTo("scinter_home_statistics");
	    csystat.andValueNotEqualTo("");
	    if(StringUtils.isNotBlank(myBranchCompany) && myBranchCompany.length()>0){
	    	csystat.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "sjzrbw1";
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
				myBranchCompany = "sjzrbw1";
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
				myBranchCompany = "sjzrbw1";
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
				myBranchCompany = "sjzrbw1";
				criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(myBranchCompany);
			}
	      SysConfig statScinterHomeSeoDesc= null;
	      if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).size()> 0){
	      	
	    	  statScinterHomeSeoDesc = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).get(0);
	      }
	    session.setAttribute("statistics", statistics);
	    session.setAttribute("shangqiao", shangqiao);
	    session.setAttribute("MhomePost",MhomePost );
	    session.setAttribute("MhomeAdress",MhomeAdress );
	    session.setAttribute("MhomeTp",MhomeTp );
	    session.setAttribute("MhomeTc",MhomeTc );
	    session.setAttribute("branchCompany", myBranchCompany);
	    session.setAttribute("MhomeLo", MhomeLo);
	    model.addObject("statistics", statistics);
	    model.addObject("shangqiao", shangqiao);
	    model.addObject("MhomeLo", MhomeLo);
	    model.addObject("MhomePort", MhomePost);
	    model.addObject("MhomePer", MhomePer);
	    model.addObject("MhomeTc", MhomeTc); 
	    model.addObject("MhomeTp", MhomeTp);
	    session.setAttribute("statScinterHomeSeoTitle", statScinterHomeSeoTitle);
        session.setAttribute("statScinterhomeSeoKeyword", statScinterhomeSeoKeyword);
        session.setAttribute("statScinterHomeSeoDesc", statScinterHomeSeoDesc);
        model.addObject("statScinterHomeSeoTitle", statScinterHomeSeoTitle);
        model.addObject("statScinterhomeSeoKeyword", statScinterhomeSeoKeyword);
        model.addObject("statScinterHomeSeoDesc", statScinterHomeSeoDesc);
	}
}
