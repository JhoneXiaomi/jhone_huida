package com.scinter.www.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.scinter.base.baseController.BaseController;
import com.scinter.www.dao.CaseShowImageMapper;
import com.scinter.www.dao.CasesMapper;
import com.scinter.www.dao.DesignerMapper;
import com.scinter.www.dao.OrderInfoMapper;
import com.scinter.www.dao.RoleMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.dao.SysLogMapper;
import com.scinter.www.dao.UserMapper;
import com.scinter.www.model.CaseShowImageExample;
import com.scinter.www.model.Cases;
import com.scinter.www.model.CasesExample;
import com.scinter.www.model.Designer;
import com.scinter.www.model.DesignerExample;
import com.scinter.www.model.CasesExample.Criteria;
import com.scinter.www.model.SysConfig;
import com.scinter.www.model.SysConfigExample;


//SubjectController用于显示专题页页面
@Controller
public class SubjectController extends BaseController{
	
	@Autowired
	private DesignerMapper designerMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	@Autowired
	private CasesMapper caseMapper;
	@Autowired
	private CaseShowImageMapper caseShowImageMapper;

	
	/***
	 * 进入新洲新站页面
	 * @return
	 * sourceType
	 */
	@RequestMapping("subject/xzpc")
	public ModelAndView orderLineForXzPc(HttpServletResponse response,HttpSession session){
		// 获取公共信息
		super.getPublicMes(session);
		String branchCompany=new String();
		ModelAndView model = new ModelAndView();
		//进入新洲新站
		// 获取分公司
	    branchCompany = (String) session.getAttribute("branchCompany");
	    if(StringUtils.isBlank(branchCompany))
	        branchCompany = "bjxz";
		// 获取合作品牌图片展示
	    SysConfigExample sysConfigExampleCoworker = new SysConfigExample();
	    com.scinter.www.model.SysConfigExample.Criteria csysCok = sysConfigExampleCoworker.createCriteria();
	    csysCok.andKeyNameEqualTo("scinter_home_coworkerImg");
	    csysCok.andValueNotEqualTo("");
		csysCok.andBranchCompanyEqualTo(branchCompany);
	    List<SysConfig> homeCok = sysConfigMapper.selectByExample(sysConfigExampleCoworker);
	    model.addObject("homeCok", homeCok);
		model.addObject("myBranchCompany", branchCompany);
		model.setViewName("/www/xzPc");
    	return model;
    	
	}
	
	
	
	
	/***
	 * 效果图页面
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping("subject/zxxg")
	public ModelAndView zxxg(HttpServletResponse response,HttpSession session){
		// 获取公共信息
		super.getPublicMes(session);
		String branchCompany=new String();
		ModelAndView model = new ModelAndView();
		//进入新洲新站
		// 获取分公司
		branchCompany = (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany))
			  branchCompany = "bjxz";
		
		// 获取首页合作品牌图片展示
    	SysConfigExample sysConfigExampleCoworker = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria csysCok = sysConfigExampleCoworker.createCriteria();
        csysCok.andKeyNameEqualTo("scinter_home_coworkerImg");
        csysCok.andValueNotEqualTo("");
		csysCok.andBranchCompanyEqualTo(branchCompany);
        List<SysConfig> homeCok = sysConfigMapper.selectByExample(sysConfigExampleCoworker);

		
		
		//获取案例信息展示
		CasesExample casesExample=new CasesExample();
		Criteria casesCriteria=casesExample.createCriteria();
		casesExample.setOrderByClause("update_time desc");//根据修改时间排序案例
		casesCriteria.andCaseStatusEqualTo(1);
		casesCriteria.andIsHotCaseEqualTo("是");
		casesCriteria.andBranchCompanyEqualTo(branchCompany);
		List<Cases> caseList = caseMapper.selectByExample(casesExample);
        List<Cases> casesList = new ArrayList<Cases>();
        for(Cases cases:caseList){
        	CaseShowImageExample ce = new CaseShowImageExample();
        	com.scinter.www.model.CaseShowImageExample.Criteria cc = ce.createCriteria();
        	cc.andCaseIdEqualTo(cases.getCaseId());
        	Designer designer = designerMapper.selectByPrimaryKey(cases.getDesignerId());
        	cases.setCaseThumbNumber(caseShowImageMapper.countByExample(ce));
        	cases.setDesignerPhoto(designer.getDesignerPhotoImg());
        	cases.setDesignerName(designer.getDesignerName());
        	casesList.add(cases);
        }
       // 获取设计师信息
       DesignerExample designerExamle = new DesignerExample();
       com.scinter.www.model.DesignerExample.Criteria cd = designerExamle.createCriteria();
       cd.andDesignerPhotoImgNotEqualTo("");
       cd.andStatusEqualTo(1);
       designerExamle.setOrderByClause("update_time desc");
       cd.andBranchCompanyEqualTo(branchCompany);
       List<Designer> designerList = designerMapper.selectByExample(designerExamle); 
       List<Designer> designers = new ArrayList<Designer>();	
       for(Designer designer:designerList){
		 	CasesExample ce = new  CasesExample();
		 	com.scinter.www.model.CasesExample.Criteria cc = ce.createCriteria();
		 	cc.andDesignerIdEqualTo(designer.getDesignerId());
		 	designer.setDesignerCases(caseMapper.countByExample(ce));
		 	designers.add(designer);
		}
		
		
		model.addObject("homeCok", homeCok);
		model.addObject("designers", designers);
		model.addObject("myBranchCompany", branchCompany);
		model.addObject("casesList",casesList);
		model.setViewName("www/zxxg");
		return model;
	}
	
	@RequestMapping("detail/taocan555")
	public ModelAndView taocan(HttpServletResponse response,HttpSession session){
		// 获取公共信息
		super.getPublicMes(session);
		String branchCompany=new String();
		ModelAndView model = new ModelAndView();
		//进入新洲新站
		// 获取分公司
		branchCompany = (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany))
			  branchCompany = "bjxz";
		
		
		model.setViewName("www/xz555");
		return model;
	}
	
	
}
