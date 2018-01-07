package com.scinter.mobile.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mBase.controller.MbaseController;
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
	@RequestMapping("designer")
	public ModelAndView designerList(
			@RequestParam(value="DesignerNum",required=false,defaultValue="") String DesignerNum,
			HttpServletResponse response,HttpSession session,HttpServletRequest request) {
		
		/*获取共有信息*/
		super.getHomeMessage(request, session);
		ModelAndView model = new ModelAndView();
		// 初始化CasesNum
		int MyDesignerNum = 0;
		if(DesignerNum.isEmpty()){
			MyDesignerNum = 6;
		}else{
			MyDesignerNum = Integer.parseInt(DesignerNum);
		}
		// 获取session 中的 BranchCompany
		String myBranchCompany	= (String) session.getAttribute("branchCompany");
		if(myBranchCompany ==""){
			myBranchCompany= "bjsc";
		}
		DesignerExample designerExample = new DesignerExample();
		Criteria criDesigner = designerExample.createCriteria();
		// 分公司查询
	    if(null != myBranchCompany && myBranchCompany.length()>0){
	    	criDesigner.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			criDesigner.andBranchCompanyEqualTo(myBranchCompany);
		}
	    criDesigner.andDesignerPhotoImgNotEqualTo("");
		criDesigner.andStatusNotEqualTo(3);
		// 排序
		designerExample.setOrderByClause("update_time desc");
		int totalNums = designerMapper.countByExample(designerExample);
		List<Designer> designersList = designerMapper.selectByExample(designerExample);
		List<Designer> designerList = new ArrayList<Designer>();
		for(int i=0;i<MyDesignerNum && i<designersList.size();i++){
			
			if(i<designersList.size()){
				designerList.add(designersList.get(i));
			}
		}
		/*获取SEO 的配置信息*/
	      
	      // SEO 标题信息
	      SysConfigExample sysConfigExampleScinterHomeSeoTitle = new SysConfigExample();
	      com.scinter.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoTitle = sysConfigExampleScinterHomeSeoTitle.createCriteria();
	      criteriaScinterHomeSeoTitle.andKeyNameEqualTo("scinter_designer_seoTitle_str");
	      criteriaScinterHomeSeoTitle.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(myBranchCompany)){
	    	  criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(myBranchCompany);
			}else{
				myBranchCompany = "bjsc";
				criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(myBranchCompany);
			}
	      SysConfig scinterDesignerSeoTitleStr= null;
	      if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).size()> 0){
	    	  scinterDesignerSeoTitleStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).get(0);
	      }
	      
	      // SEO 关键字信息
	      SysConfigExample sysConfigExampleScinterhomeSeoKeyword = new SysConfigExample();
	      com.scinter.www.model.SysConfigExample.Criteria criteriaScinterhomeSeoKeyword = sysConfigExampleScinterhomeSeoKeyword.createCriteria();
	      criteriaScinterhomeSeoKeyword.andKeyNameEqualTo("scinter_designer_seoKeyword_str");
	      criteriaScinterhomeSeoKeyword.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(myBranchCompany)){
	    	  criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(myBranchCompany);
			}else{
				myBranchCompany = "bjsc";
				criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(myBranchCompany);
			}
	      SysConfig scinterDesignerSeoKeywordStr= null;
	      if(sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).size()> 0){
	      	
	    	  scinterDesignerSeoKeywordStr = sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).get(0);
	      }
	      
	      // SEO 描述信息
	      SysConfigExample sysConfigExampleScinterHomeSeoDesc = new SysConfigExample();
	      com.scinter.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoDesc = sysConfigExampleScinterHomeSeoDesc.createCriteria();
	      criteriaScinterHomeSeoDesc.andKeyNameEqualTo("scinter_designer_seoDesc_str");
	      criteriaScinterHomeSeoDesc.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(myBranchCompany)){
	    	  criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(myBranchCompany);
			}else{
				myBranchCompany = "bjsc";
				criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(myBranchCompany);
			}
	      SysConfig scinterDesignerSeoDescStr= null;
	      if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).size()> 0){
	      	
	    	  scinterDesignerSeoDescStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).get(0);
	      }
	      session.setAttribute("scinterDesignerSeoTitleStr", scinterDesignerSeoTitleStr);
	      session.setAttribute("scinterDesignerSeoKeywordStr", scinterDesignerSeoKeywordStr);
	      session.setAttribute("scinterDesignerSeoDescStr", scinterDesignerSeoDescStr);
	      model.addObject("scinterDesignerSeoTitleStr", scinterDesignerSeoTitleStr);
	      model.addObject("scinterDesignerSeoKeywordStr", scinterDesignerSeoKeywordStr);
	      model.addObject("scinterDesignerSeoDescStr", scinterDesignerSeoDescStr);
		session.setAttribute("branchCompany", myBranchCompany);
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
	@RequestMapping("MdesignerDetail")
	public ModelAndView MdesignerDetail(
			@RequestParam("designerId") String designerId,HttpSession session, 
			HttpServletResponse response,HttpServletRequest request) {
		
		/*获取共有的信息*/
		super.getHomeMessage(request, session);
		ModelAndView  model = new ModelAndView();
		// 获取session 中的 BranchCompany
		String myBranchCompany	= (String) session.getAttribute("branchCompany");
		if(myBranchCompany ==""){
			myBranchCompany= "bjsc";
		}
		// 获取设计师的信息
		Designer designer = designerMapper.selectByPrimaryKey(Integer.valueOf(designerId));
		// 获取案例的信息
		CasesExample casesExample =new CasesExample();
		com.scinter.www.model.CasesExample.Criteria criteria = casesExample.createCriteria();
		criteria.andDesignerIdEqualTo(Integer.valueOf(designerId));
		criteria.andCaseStatusNotEqualTo(3);
        // 分公司查询
	    if(null != myBranchCompany && myBranchCompany.length()>0){
	    	criteria.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			criteria.andBranchCompanyEqualTo(myBranchCompany);
		}
	    // 排序
		casesExample.setOrderByClause("create_time desc");
		List<Cases> caseList = caseMapper.selectByExample(casesExample);
		session.setAttribute("branchCompany", myBranchCompany);
		model.addObject("designer", designer);
		model.addObject("casesList", caseList);
		model.setViewName("/mobile/designerDetail");
		logger.info("成功加载caseDetail");
		return model;
	}	
}
