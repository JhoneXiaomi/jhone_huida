package com.scinter.base.baseController;


import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.model.SysConfig;
import com.scinter.www.model.SysConfigExample;
import com.scinter.www.model.SysConfigExample.Criteria;
@Controller
public class TjController {

	@Autowired
	private SysConfigMapper sysConfigMapper;
	
	public void getPublicMes(HttpSession session){  
		
		String branchCompany = (String) session.getAttribute("branchCompany");
		SysConfigExample sysConfigExampleStatistics = new SysConfigExample();
        Criteria csystat= sysConfigExampleStatistics.createCriteria();
        csystat.andKeyNameEqualTo("scinter_home_statistics");
        csystat.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany) && branchCompany.length()>0){
        	csystat.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "bjxz";
  			csystat.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig statistics= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleStatistics).size()> 0){
        	
        	statistics = sysConfigMapper.selectByExample(sysConfigExampleStatistics).get(0);
        }
        
        session.setAttribute("statistics", statistics);
    }
}
