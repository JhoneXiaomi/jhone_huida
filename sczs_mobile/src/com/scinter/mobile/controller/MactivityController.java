package com.scinter.mobile.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mBase.controller.MbaseController;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.dao.TbMobileActivityDtoMapper;
import com.scinter.www.model.SysConfig;
import com.scinter.www.model.SysConfigExample;
import com.scinter.www.model.TbMobileActivityDto;
import com.scinter.www.model.TbMobileActivityDtoExample;
import com.scinter.www.model.TbMobileActivityDtoExample.Criteria;

@Controller
public class MactivityController extends MbaseController{
	
	@Autowired
	private TbMobileActivityDtoMapper tbMobileActivityDtoMapperl;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	
	@RequestMapping("mActicityDetail")
	public ModelAndView newDetail(@RequestParam("newsId") String newsId,HttpSession session, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView();
//		获取session 中的 BranchCompany
		String myBranchCompany	= (String) session.getAttribute("branchCompany");
		TbMobileActivityDto news =  tbMobileActivityDtoMapperl.selectByPrimaryKey(newsId);
//		过滤文本中的图片
		String html = news.getContent();
		Document doc =Jsoup.parse(html);
		doc.select("img").removeAttr("width");
		doc.select("img").removeAttr("height");
		news.setContent(doc.toString());
		TbMobileActivityDtoExample newsExampleLast= new TbMobileActivityDtoExample();
		Criteria criteria = newsExampleLast.createCriteria();
		criteria.andStatusNotEqualTo(3);
		newsExampleLast.setOrderByClause("news_id desc");//排序

//      获取百度商桥的信息
    	SysConfigExample sysConfigExampleShangqiao = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria csysSq= sysConfigExampleShangqiao.createCriteria();
        csysSq.andKeyNameEqualTo("scinter_home_M_shangQiao");
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
//      获取百度统计的信息
    	SysConfigExample sysConfigExampleStatistics = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria csystat= sysConfigExampleStatistics.createCriteria();
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
        model.addObject("statistics", statistics);
        session.setAttribute("statistics", statistics);
//      获取公司电话
    	SysConfigExample sysConfigExampleTelePhone = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria csysTp= sysConfigExampleTelePhone.createCriteria();
        csysTp.andKeyNameEqualTo("scinter_home_M_telePhone");
        csysTp.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(myBranchCompany) && myBranchCompany.length()>0){
        	csysTp.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			csysTp.andBranchCompanyEqualTo(myBranchCompany);
		}
        SysConfig MhomeTp = null;
        if(sysConfigMapper.selectByExample(sysConfigExampleTelePhone).size()>0){
        	
            MhomeTp = sysConfigMapper.selectByExample(sysConfigExampleTelePhone).get(0);
        }
        
        session.setAttribute("MhomeTp",MhomeTp );
        session.setAttribute("shangqiao",shangqiao );
        model.addObject("shangqiao", shangqiao);
		session.setAttribute("branchCompany", myBranchCompany);
		model.addObject("news", news);
		
		model.setViewName("/mobile/mActivityDetail");
		return model;
		
	} 

}
