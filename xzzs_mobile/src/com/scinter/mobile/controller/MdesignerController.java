package com.scinter.mobile.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.scinter.mBase.controller.MbaseController;
import com.scinter.www.dao.CasesMapper;
import com.scinter.www.dao.DesignerMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.model.Cases;
import com.scinter.www.model.CasesExample;
import com.scinter.www.model.Designer;
import com.scinter.www.model.DesignerExample;
import com.scinter.www.model.SysConfig;
import com.scinter.www.model.SysConfigExample;
import com.scinter.www.model.DesignerExample.Criteria;
import com.scinter.www.util.Page;


@Controller
public class MdesignerController extends MbaseController{

	private Logger logger = Logger.getLogger(MhotBuildingController.class);
	@Autowired
	private DesignerMapper designerMapper;
	@Autowired
	private CasesMapper caseMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;

	/**
	 * 实现设计师的列表页的信息的展示
	 * @author JhoneZhang
	 * @date   2016年8月9日下午3:43:55
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "Mdesigner/p{page}")
	public ModelAndView designerList(
			@PathVariable("page") int page,
			@RequestParam(value="designerDept",required=false)String designerDept,
			HttpServletResponse response,HttpSession session,HttpServletRequest request) {
		
		super.getPublicMes(request, session);
		ModelAndView model = new ModelAndView();
		int rows = 20;//每页显示20条数据
		if(page<=0){
			page = 1;
		}
		// 获取session 中的 BranchCompany
		String branchCompany = (String) session.getAttribute("branchCompany");
		if(branchCompany ==""){
			branchCompany= "bjxz";
		}
		DesignerExample designerExample = new DesignerExample();
		Criteria criDesigner = designerExample.createCriteria();
		// 分公司查询
	    if(null != branchCompany && branchCompany.length()>0){
	    	criDesigner.andBranchCompanyEqualTo(branchCompany);
		}else{
			criDesigner.andBranchCompanyEqualTo(branchCompany);
		}
	    criDesigner.andDesignerPhotoImgNotEqualTo("");
		criDesigner.andStatusNotEqualTo(3);
		if(StringUtils.isNotBlank(designerDept)){
			try {
				designerDept = new String(designerDept.getBytes("ISO-8859-1"),"utf-8");
			} catch (UnsupportedEncodingException e) {
				logger.info(e.getMessage());
			}
		}
		int totalNums = designerMapper.countByExample(designerExample);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		designerExample.setPage(p);
		designerExample.setOrderByClause("update_time desc");
		List<Designer> designersList = designerMapper.selectByExample(designerExample);
		
		
		/*获取SEO 的配置信息*/
        // SEO 标题信息
        SysConfigExample sysConfigExampleScinterHomeSeoTitle = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoTitle = sysConfigExampleScinterHomeSeoTitle.createCriteria();
        criteriaScinterHomeSeoTitle.andKeyNameEqualTo("scinter_designer_seoTitle_str");
        criteriaScinterHomeSeoTitle.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "bjxz";
  			criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig designerSeoTitleStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).size()> 0){
        	designerSeoTitleStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).get(0);
        }
        
        // SEO 关键字信息
        SysConfigExample sysConfigExampleScinterhomeSeoKeyword = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria criteriaScinterhomeSeoKeyword = sysConfigExampleScinterhomeSeoKeyword.createCriteria();
        criteriaScinterhomeSeoKeyword.andKeyNameEqualTo("scinter_designer_seoKeyword_str");
        criteriaScinterhomeSeoKeyword.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "bjxz";
  			criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig designerSeoKeywordStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).size()> 0){
        	designerSeoKeywordStr = sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).get(0);
        }
        
        // SEO 描述信息
        SysConfigExample sysConfigExampleScinterHomeSeoDesc = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoDesc = sysConfigExampleScinterHomeSeoDesc.createCriteria();
        criteriaScinterHomeSeoDesc.andKeyNameEqualTo("scinter_designer_seoDesc_str");
        criteriaScinterHomeSeoDesc.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "bjxz";
  			criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig designerSeoDescStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).size()> 0){
        	
        	designerSeoDescStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).get(0);
        }
        session.setAttribute("designerSeoTitleStr", designerSeoTitleStr);
        session.setAttribute("designerSeoKeywordStr", designerSeoKeywordStr);
        session.setAttribute("designerSeoDescStr", designerSeoDescStr);
        model.addObject("designerSeoKeywordStr", designerSeoKeywordStr);
        model.addObject("designerSeoDescStr", designerSeoDescStr);
        model.addObject("page", p);
	    model.addObject("totalNums", totalNums);
		model.addObject("designerList", designersList);
		model.setViewName("/mobile/designer");
		return model;
	}
	/**
	 * 手机站案例的详情展示的方法
	 * @param casesId			  展示的案例的ID
	 * @param designerId		  展示的设计师的ID
	 * @param response           用于动态响应客户端请示
	 * @return
	 */
	@RequestMapping("MdesignerDetail")
	public ModelAndView MdesignerDetail(
			@RequestParam("designerId") String designerId,HttpSession session, 
			HttpServletResponse response,HttpServletRequest request) {
		
		super.getPublicMes(request, session);
		ModelAndView  model = new ModelAndView();
//		获取session 中的 BranchCompany
		String branchCompany	= (String) session.getAttribute("branchCompany");
		if(branchCompany ==""){
			branchCompany= "bjsc";
		}
//		获取设计师的信息
		Designer designer = designerMapper.selectByPrimaryKey(Integer.valueOf(designerId));
//		获取案例的信息
		CasesExample casesExample =new CasesExample();
		com.scinter.www.model.CasesExample.Criteria criteria = casesExample.createCriteria();
		criteria.andDesignerIdEqualTo(Integer.valueOf(designerId));
		criteria.andCaseStatusNotEqualTo(3);
//		分公司查询
	    if(null != branchCompany && branchCompany.length()>0){
	    	criteria.andBranchCompanyEqualTo(branchCompany);
		}else{
			criteria.andBranchCompanyEqualTo(branchCompany);
		}
//		排序
		casesExample.setOrderByClause("create_time desc");
		List<Cases> caseList = caseMapper.selectByExample(casesExample);
//      获取百度商桥的信息
    	SysConfigExample sysConfigExampleShangqiao = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria csysSq= sysConfigExampleShangqiao.createCriteria();
        csysSq.andKeyNameEqualTo("scinter_home_M_shangQiao");
        csysSq.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany) && branchCompany.length()>0){
        	csysSq.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjsc";
			csysSq.andBranchCompanyEqualTo(branchCompany);
		}
        SysConfig shangqiao= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleShangqiao).size()> 0){
        	
        	shangqiao = sysConfigMapper.selectByExample(sysConfigExampleShangqiao).get(0);
        }
        
//      将信息保存到session中
        session.setAttribute("shangqiao",shangqiao );
        model.addObject("shangqiao", shangqiao);
		session.setAttribute("branchCompany", branchCompany);
		model.addObject("designer", designer);
		model.addObject("casesList", caseList);
		model.setViewName("/mobile/designerDetail");
		logger.info("成功加载caseDetail");
		return model;
	}	
}
