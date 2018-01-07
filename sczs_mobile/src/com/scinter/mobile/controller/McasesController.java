package com.scinter.mobile.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.scinter.www.dao.CaseShowImageMapper;
import com.scinter.www.dao.CasesMapper;
import com.scinter.www.dao.DesignerMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.model.CaseShowImage;
import com.scinter.www.model.CaseShowImageExample;
import com.scinter.www.model.CaseShowImageExample.Criteria;
import com.scinter.www.model.Cases;
import com.scinter.www.model.CasesExample;
import com.scinter.www.model.Designer;
import com.scinter.www.model.SysConfig;
import com.scinter.www.model.SysConfigExample;


@Controller
public class McasesController {

	private Logger logger = Logger.getLogger(MhotBuildingController.class);
	@Autowired
	private DesignerMapper designerMapper;
	@Autowired
	private CasesMapper caseMapper;
    @Autowired
    private CaseShowImageMapper casesShowImgeMapper;
    @Autowired
    private SysConfigMapper sysConfigMapper;
	
	@RequestMapping("cases")
	public ModelAndView caseList(
			@RequestParam(value="CaseStyle",required=false,defaultValue="") String CaseStyle,
			@RequestParam(value="CasesNum",required=false,defaultValue="") String CasesNum,
			HttpServletResponse response,HttpSession session) {
		
		try {
			CaseStyle = new String(CaseStyle.getBytes("ISO-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			logger.info(e.getMessage());
		}
		ModelAndView  model = new ModelAndView();
//	       初始化CasesNum
		int MyCasesNum = 0;
		if(CasesNum.isEmpty()){
			MyCasesNum = 6;
		}else{
			MyCasesNum = Integer.parseInt(CasesNum);
		}
//		获取session 中的 BranchCompany
		String myBranchCompany	= (String) session.getAttribute("branchCompany");
		if(myBranchCompany ==""){
			myBranchCompany= "bjsc";
		}
		CasesExample casesExample =new CasesExample();
		com.scinter.www.model.CasesExample.Criteria criteria = casesExample.createCriteria();
		
//		查询案例图片非空的案例
		criteria.andCaseThumbImgNotEqualTo("");
//		分公司查询
	    if(null != myBranchCompany && myBranchCompany.length()>0){
			criteria.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			criteria.andBranchCompanyEqualTo(myBranchCompany);
		}
//		查询非删除状态的案例
	    if( StringUtils.isNotBlank(CaseStyle)){
	    	criteria.andCaseStyleEqualTo(CaseStyle);
	    }
		criteria.andCaseStatusNotEqualTo(3);
		int totalNums = caseMapper.countByExample(casesExample);
//		排序
		casesExample.setOrderByClause("create_time desc");
		List<Cases> casesList = caseMapper.selectByExample(casesExample);
		List<Cases> caseList = new ArrayList<Cases>();
		for(int i=0;i<MyCasesNum && i<casesList.size();i++){
			
			if(i<casesList.size()){
				caseList.add(casesList.get(i));
			}
		}
		session.setAttribute("branchCompany", myBranchCompany);
		for(Cases cs : caseList){
			int designerId = cs.getDesignerId();
			Designer ds =  designerMapper.selectByPrimaryKey(designerId);
			cs.setCaseDesigner(ds.getDesignerName());
		}
		/*获取案例列表页SEO 的配置信息*/
	      
	      // SEO 标题信息
	      SysConfigExample scinterCasesSeoTitleStrE = new SysConfigExample();
	      com.scinter.www.model.SysConfigExample.Criteria scinterCasesSeoTitleStrC = scinterCasesSeoTitleStrE.createCriteria();
	      scinterCasesSeoTitleStrC.andKeyNameEqualTo("Scinter_cases_seoTitle_str");
	      scinterCasesSeoTitleStrC.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(myBranchCompany)){
	    	  scinterCasesSeoTitleStrC.andBranchCompanyEqualTo(myBranchCompany);
			}else{
				myBranchCompany = "bjsc";
				scinterCasesSeoTitleStrC.andBranchCompanyEqualTo(myBranchCompany);
			}
	      SysConfig scinterCasesSeoTitleStr= null;
	      if(sysConfigMapper.selectByExample(scinterCasesSeoTitleStrE).size()> 0){
	    	  scinterCasesSeoTitleStr = sysConfigMapper.selectByExample(scinterCasesSeoTitleStrE).get(0);
	      }
	      
	      // SEO 关键字信息 
	      SysConfigExample scinterCasesSeoKeywordStrE = new SysConfigExample();
	      com.scinter.www.model.SysConfigExample.Criteria scinterCasesSeoKeywordStrC = scinterCasesSeoKeywordStrE.createCriteria();
	      scinterCasesSeoKeywordStrC.andKeyNameEqualTo("Scinter_cases_seoKeyword_str");
	      scinterCasesSeoKeywordStrC.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(myBranchCompany)){
	    	  scinterCasesSeoKeywordStrC.andBranchCompanyEqualTo(myBranchCompany);
			}else{
				myBranchCompany = "bjsc";
				scinterCasesSeoKeywordStrC.andBranchCompanyEqualTo(myBranchCompany);
			}
	      SysConfig scinterCasesSeoKeywordStr= null;
	      if(sysConfigMapper.selectByExample(scinterCasesSeoKeywordStrE).size()> 0){
	    	  
	    	  scinterCasesSeoKeywordStr = sysConfigMapper.selectByExample(scinterCasesSeoKeywordStrE).get(0);
	      }
	      
	      // SEO 描述信息
	      SysConfigExample scinterCasesSeoDescStrE = new SysConfigExample();
	      com.scinter.www.model.SysConfigExample.Criteria scinterCasesSeoDescStrC = scinterCasesSeoDescStrE.createCriteria();
	      scinterCasesSeoDescStrC.andKeyNameEqualTo("Scinter_cases_seoDesc_str");
	      scinterCasesSeoDescStrC.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(myBranchCompany)){
	    	  scinterCasesSeoDescStrC.andBranchCompanyEqualTo(myBranchCompany);
			}else{
				myBranchCompany = "bjsc";
				scinterCasesSeoDescStrC.andBranchCompanyEqualTo(myBranchCompany);
			}
	      SysConfig scinterCasesSeoDescStr= null;
	      if(sysConfigMapper.selectByExample(scinterCasesSeoDescStrE).size()> 0){
	      	
	    	  scinterCasesSeoDescStr = sysConfigMapper.selectByExample(scinterCasesSeoDescStrE).get(0);
	      }
	    model.addObject("scinterCasesSeoTitleStr", scinterCasesSeoTitleStr);
	    model.addObject("scinterCasesSeoKeywordStr", scinterCasesSeoKeywordStr);
	    model.addObject("scinterCasesSeoDescStr", scinterCasesSeoDescStr);  
        model.addObject("CasesNum", MyCasesNum);
        model.addObject("totalNums", totalNums);
		model.addObject("casesList", caseList);
		model.setViewName("/mobile/cases");
		logger.info("成功加载mobileCase");
		return model;
	}	
	/**
	 * 手机站案例的详情展示的方法
	 * @param casesId			  展示的案例的ID
	 * @param designerId		  展示的设计师的ID
	 * @param response           用于动态响应客户端请示
	 * @return
	 */
	@RequestMapping("casesDetail")
	public ModelAndView caseDetail(@RequestParam("casesId") String casesId,@RequestParam("designerId") String designerId,
			HttpSession session, HttpServletResponse response) {
		
		ModelAndView  model = new ModelAndView();
//		获取session 中的 BranchCompany
		String myBranchCompany	= (String) session.getAttribute("branchCompany");
		if(myBranchCompany ==""){
			myBranchCompany= "bjsc";
		}
//		获取设计师的信息
		Designer designer = designerMapper.selectByPrimaryKey(Integer.valueOf(designerId));
//		获取当前点击的案例的信息
		Cases CurrentCase = caseMapper.selectByPrimaryKey(Integer.valueOf(casesId));
		CasesExample casesExample =new CasesExample();
		com.scinter.www.model.CasesExample.Criteria criteria = casesExample.createCriteria();
		criteria.andCaseStatusNotEqualTo(3);
//		分公司查询
	    if(null != myBranchCompany && myBranchCompany.length()>0){
	    	criteria.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			criteria.andBranchCompanyEqualTo(myBranchCompany);
		}
//		排序
		casesExample.setOrderByClause("create_time desc");
		List<Cases> caseList = caseMapper.selectByExample(casesExample);
		
//		获取案例的详情图片
		CaseShowImageExample caseShowImageExample =new CaseShowImageExample();
		Criteria criteriaImg = caseShowImageExample.createCriteria();
		criteriaImg.andCaseIdEqualTo(Integer.valueOf(casesId));
		criteriaImg.andImageUrlNotEqualTo("");
		criteriaImg.andStatusNotEqualTo("3");
//		排序
		caseShowImageExample.setOrderByClause("create_time desc");
		List<CaseShowImage> caseShowImageList = casesShowImgeMapper.selectByExample(caseShowImageExample);
		List<CaseShowImage> caseshowImages = new ArrayList<CaseShowImage>();
		for(CaseShowImage cases:caseShowImageList){
			if(cases.getImageUrl() != ""){
				cases.setImageUrl(cases.getImageUrl().substring(0,27)+"_logo"+CurrentCase.getCaseThumbImg().substring(27,31));
			}
			caseshowImages.add(cases);
		}
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
//      将信息保存到session中
        session.setAttribute("shangqiao",shangqiao );
        model.addObject("shangqiao", shangqiao);
		session.setAttribute("branchCompany", myBranchCompany);
		model.addObject("totalNums");
		model.addObject("caseshowImages", caseshowImages);
		model.addObject("designer", designer);
		model.addObject("CurrentCase", CurrentCase);
		model.addObject("casesList", caseList);
		model.setViewName("/mobile/casesDetail");
		logger.info("成功加载caseDetail");
		return model;
	}	
}
