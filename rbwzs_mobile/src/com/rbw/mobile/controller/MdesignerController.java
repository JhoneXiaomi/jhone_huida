package com.rbw.mobile.controller;

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

import com.rbw.mBase.controller.MbaseController;
import com.rbw.www.dao.CasesMapper;
import com.rbw.www.dao.DesignerMapper;
import com.rbw.www.dao.SysConfigMapper;
import com.rbw.www.model.Cases;
import com.rbw.www.model.CasesExample;
import com.rbw.www.model.Designer;
import com.rbw.www.model.DesignerExample;
import com.rbw.www.model.SysConfig;
import com.rbw.www.model.SysConfigExample;
import com.rbw.www.model.DesignerExample.Criteria;
import com.rbw.www.util.Page;


@Controller
@RequestMapping("m")
public class MdesignerController extends MbaseController{

	private Logger logger = Logger.getLogger(MdesignerController.class);
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
	@RequestMapping(value = "designer/p{page}")
	public ModelAndView designerList(
			@PathVariable("page") int page,
			@RequestParam(value="designerDept",required=false)String designerDept,
			@RequestParam(value="DesignerNum",required=false,defaultValue="") String DesignerNum,
			HttpServletResponse response,HttpSession session,HttpServletRequest request) {
		
		super.getPublicMes(request, session);
		ModelAndView model = new ModelAndView();
//	       初始化CasesNum
		int MyDesignerNum = 0;
		if(DesignerNum.isEmpty()){
			MyDesignerNum = 6;
		}else{
			MyDesignerNum = Integer.parseInt(DesignerNum);
		}
		int rows = 20;//每页显示20条数据
		if(page<=0){
			page = 1;
		}
//		获取session 中的 BranchCompany
		String branchCompany	= (String) session.getAttribute("branchCompany");
		if(branchCompany ==""){
			branchCompany= "sjzrbw1";
		}
		DesignerExample designerExample = new DesignerExample();
		Criteria criDesigner = designerExample.createCriteria();
//		分公司查询
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
//		排序
		designerExample.setOrderByClause("update_time desc");
		int totalNums = designerMapper.countByExample(designerExample);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		designerExample.setPage(p);
		List<Designer> designersList = designerMapper.selectByExample(designerExample);
		List<Designer> designerList = new ArrayList<Designer>();
		for(int i=0;i<MyDesignerNum && i<designersList.size();i++){
			
			if(i<designersList.size()){
				designerList.add(designersList.get(i));
			}
		}
		/*获取SEO 的配置信息*/
        // SEO 标题信息
        SysConfigExample sysConfigExamplerbwHomeSeoTitle = new SysConfigExample();
        com.rbw.www.model.SysConfigExample.Criteria criteriarbwHomeSeoTitle = sysConfigExamplerbwHomeSeoTitle.createCriteria();
        criteriarbwHomeSeoTitle.andKeyNameEqualTo("scinter_designer_seoTitle_str");
        criteriarbwHomeSeoTitle.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriarbwHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "sjzrbw1";
  			criteriarbwHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig designerSeoTitleStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExamplerbwHomeSeoTitle).size()> 0){
        	designerSeoTitleStr = sysConfigMapper.selectByExample(sysConfigExamplerbwHomeSeoTitle).get(0);
        }
        
        // SEO 关键字信息
        SysConfigExample sysConfigExamplerbwhomeSeoKeyword = new SysConfigExample();
        com.rbw.www.model.SysConfigExample.Criteria criteriarbwhomeSeoKeyword = sysConfigExamplerbwhomeSeoKeyword.createCriteria();
        criteriarbwhomeSeoKeyword.andKeyNameEqualTo("scinter_designer_seoKeyword_str");
        criteriarbwhomeSeoKeyword.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriarbwhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "sjzrbw1";
  			criteriarbwhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig designerSeoKeywordStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExamplerbwhomeSeoKeyword).size()> 0){
        	designerSeoKeywordStr = sysConfigMapper.selectByExample(sysConfigExamplerbwhomeSeoKeyword).get(0);
        }
        
        // SEO 描述信息
        SysConfigExample sysConfigExamplerbwHomeSeoDesc = new SysConfigExample();
        com.rbw.www.model.SysConfigExample.Criteria criteriarbwHomeSeoDesc = sysConfigExamplerbwHomeSeoDesc.createCriteria();
        criteriarbwHomeSeoDesc.andKeyNameEqualTo("scinter_designer_seoDesc_str");
        criteriarbwHomeSeoDesc.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriarbwHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "sjzrbw1";
  			criteriarbwHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig designerSeoDescStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExamplerbwHomeSeoDesc).size()> 0){
        	
        	designerSeoDescStr = sysConfigMapper.selectByExample(sysConfigExamplerbwHomeSeoDesc).get(0);
        }
        session.setAttribute("designerSeoTitleStr", designerSeoTitleStr);
        session.setAttribute("designerSeoKeywordStr", designerSeoKeywordStr);
        session.setAttribute("designerSeoDescStr", designerSeoDescStr);
        model.addObject("designerSeoKeywordStr", designerSeoKeywordStr);
        model.addObject("designerSeoDescStr", designerSeoDescStr);
        model.addObject("page", p);
		session.setAttribute("branchCompany", branchCompany);
		model.addObject("DesignerNum", MyDesignerNum);
	    model.addObject("totalNums", totalNums);
		model.addObject("designerList", designerList);
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
	@RequestMapping("designerDetail")
	public ModelAndView MdesignerDetail(
			@RequestParam("designerId") String designerId,HttpSession session, 
			HttpServletResponse response,HttpServletRequest request) {
		
		super.getPublicMes(request, session);
		ModelAndView  model = new ModelAndView();
//		获取session 中的 BranchCompany
		String branchCompany	= (String) session.getAttribute("branchCompany");
		if(branchCompany ==""){
			branchCompany= "sjzrbw1";
		}
//		获取设计师的信息
		Designer designer = designerMapper.selectByPrimaryKey(Integer.valueOf(designerId));
//		获取案例的信息
		CasesExample casesExample =new CasesExample();
		com.rbw.www.model.CasesExample.Criteria criteria = casesExample.createCriteria();
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
	    /*推荐设计师*/
		DesignerExample designerE = new DesignerExample();
		com.rbw.www.model.DesignerExample.Criteria designerC= designerE.createCriteria();
		designerC.andStatusNotEqualTo(3);
		designerC.andBranchCompanyEqualTo(branchCompany);
		designerE.setOrderByClause("create_time desc");
		List<Designer> designerlist = designerMapper.selectByExample(designerE);
		session.setAttribute("branchCompany", branchCompany);
		model.addObject("designer", designer);
		model.addObject("casesList", caseList);
		model.addObject("designerlist", designerlist);
		model.setViewName("/mobile/designerDetail");
		logger.info("成功加载caseDetail");
		return model;
	}	
}
