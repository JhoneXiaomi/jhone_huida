package com.rbw.mobile.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rbw.mBase.controller.MbaseController;
import com.rbw.www.dao.CaseShowImageMapper;
import com.rbw.www.dao.CasesMapper;
import com.rbw.www.dao.DesignerMapper;
import com.rbw.www.dao.SysConfigMapper;
import com.rbw.www.model.CaseShowImage;
import com.rbw.www.model.CaseShowImageExample;
import com.rbw.www.model.CaseShowImageExample.Criteria;
import com.rbw.www.model.Cases;
import com.rbw.www.model.CasesExample;
import com.rbw.www.model.Designer;
import com.rbw.www.model.SysConfig;
import com.rbw.www.model.SysConfigExample;
import com.rbw.www.util.Page;


@Controller
@RequestMapping("m")
public class McasesController extends MbaseController {

	private Logger logger = Logger.getLogger(McasesController.class);
	@Autowired
	private DesignerMapper designerMapper;
	@Autowired
	private CasesMapper caseMapper;
    @Autowired
    private CaseShowImageMapper casesShowImgeMapper;
    @Autowired
    private SysConfigMapper sysConfigMapper;
	
	@RequestMapping(value = "cases/p{page}")
	public ModelAndView caseList(
			@RequestParam(value="CaseStyle",required=false,defaultValue="") String CaseStyle,
			@RequestParam(value="CasesNum",required=false,defaultValue="") String CasesNum,
			@PathVariable("page") int page,HttpServletResponse response,HttpSession session,HttpServletRequest request) {
		
		super.getPublicMes(request, session);
		try {
			CaseStyle = new String(CaseStyle.getBytes("ISO-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			logger.info(e.getMessage());
		}
		ModelAndView  model = new ModelAndView();
//	       初始化CasesNum
		int MyCasesNum = 0;
		if(CasesNum.isEmpty()){
			MyCasesNum = 12;
		}else{
			MyCasesNum = Integer.parseInt(CasesNum);
		}
//		获取session 中的 BranchCompany
		String branchCompany	= (String) session.getAttribute("branchCompany");
		if(branchCompany ==""){
			branchCompany= "sjzrbw1";
		}
		CasesExample casesExample =new CasesExample();
		com.rbw.www.model.CasesExample.Criteria criteria = casesExample.createCriteria();
		
//		查询案例图片非空的案例
		criteria.andCaseThumbImgNotEqualTo("");
//		分公司查询
	    if(null != branchCompany && branchCompany.length()>0){
			criteria.andBranchCompanyEqualTo(branchCompany);
		}else{
			criteria.andBranchCompanyEqualTo(branchCompany);
		}
//		查询非删除状态的案例
	    if( StringUtils.isNotBlank(CaseStyle)){
	    	criteria.andCaseStyleEqualTo(CaseStyle);
	    }
		criteria.andCaseStatusEqualTo(1);
		int totalNums = caseMapper.countByExample(casesExample);
		int rows = 12;//每页显示10条数据
		if(page<=0){
			page = 1;
		}
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		casesExample.setPage(p);
//		排序
		casesExample.setOrderByClause("create_time desc");
		List<Cases> casesList = caseMapper.selectByExample(casesExample);
		List<Cases> caseList = new ArrayList<Cases>();
		for(int i=0;i<MyCasesNum && i<casesList.size();i++){
			
			if(i<casesList.size()){
				caseList.add(casesList.get(i));
			}
		}
		session.setAttribute("branchCompany", branchCompany);
		for(Cases cs : caseList){
			int designerId = cs.getDesignerId();
			Designer ds =  designerMapper.selectByPrimaryKey(designerId);
			cs.setCaseDesigner(ds.getDesignerName());
		}

		/*获取SEO 的配置信息*/
        // SEO 标题信息
        SysConfigExample sysConfigExampleScinterHomeSeoTitle = new SysConfigExample();
        com.rbw.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoTitle = sysConfigExampleScinterHomeSeoTitle.createCriteria();
        criteriaScinterHomeSeoTitle.andKeyNameEqualTo("scinter_cases_seoTitle_str");
        criteriaScinterHomeSeoTitle.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "sjzrbw1";
  			criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig casesSeoTitleStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).size()> 0){
        	casesSeoTitleStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).get(0);
        }
        
        // SEO 关键字信息
        SysConfigExample sysConfigExampleScinterhomeSeoKeyword = new SysConfigExample();
        com.rbw.www.model.SysConfigExample.Criteria criteriaScinterhomeSeoKeyword = sysConfigExampleScinterhomeSeoKeyword.createCriteria();
        criteriaScinterhomeSeoKeyword.andKeyNameEqualTo("scinter_cases_seoKeyword_str");
        criteriaScinterhomeSeoKeyword.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "sjzrbw1";
  			criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig casesSeoKeywordStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).size()> 0){
        	casesSeoKeywordStr = sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).get(0);
        }
        
        // SEO 描述信息
        SysConfigExample sysConfigExampleScinterHomeSeoDesc = new SysConfigExample();
        com.rbw.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoDesc = sysConfigExampleScinterHomeSeoDesc.createCriteria();
        criteriaScinterHomeSeoDesc.andKeyNameEqualTo("scinter_cases_seoDesc_str");
        criteriaScinterHomeSeoDesc.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "sjzrbw1";
  			criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig casesSeoDescStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).size()> 0){
        	
        	casesSeoDescStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).get(0);
        }
        model.addObject("casesSeoTitleStr", casesSeoTitleStr);
        model.addObject("casesSeoKeywordStr", casesSeoKeywordStr);
        model.addObject("casesSeoDescStr", casesSeoDescStr);
        model.addObject("page", p);
        model.addObject("CasesNum", MyCasesNum);
        model.addObject("totalNums", totalNums);
		model.addObject("casesList", caseList);
		model.setViewName("/mobile/cases");
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
	public ModelAndView caseDetail(
			@RequestParam("casesId") String casesId,@RequestParam("designerId") String designerId,HttpServletRequest request,
			HttpSession session, HttpServletResponse response) {
		
		super.getPublicMes(request, session);
		ModelAndView  model = new ModelAndView();
//		获取session 中的 BranchCompany
		String branchCompany	= (String) session.getAttribute("branchCompany");
		if(branchCompany ==""){
			branchCompany= "sjzrbw1";
		}
//		获取设计师的信息
		Designer designer = designerMapper.selectByPrimaryKey(Integer.valueOf(designerId));
//		获取当前点击的案例的信息
		Cases CurrentCase = caseMapper.selectByPrimaryKey(Integer.valueOf(casesId));
		CasesExample casesExample =new CasesExample();
		com.rbw.www.model.CasesExample.Criteria criteria = casesExample.createCriteria();
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
		/*获取案例的图片信息*/
		CaseShowImageExample ImageExample = new CaseShowImageExample();
		Criteria ic =  ImageExample.createCriteria();
		ic.andCaseIdEqualTo(Integer.valueOf(casesId));
		ic.andStatusNotEqualTo("3");
		List<CaseShowImage> caseImages = casesShowImgeMapper.selectByExample(ImageExample);
//      将信息保存到session中
		session.setAttribute("branchCompany", branchCompany);
		model.addObject("caseImages", caseImages);
		model.addObject("totalNums");
		model.addObject("caseshowImages", caseshowImages);
		model.addObject("designer", designer);
		model.addObject("CurrentCase", CurrentCase);
		model.addObject("casesList", caseList);
		model.setViewName("/mobile/casesDetail");
		logger.info("成功加载caseDetail");
		return model;
	}	
	
	/**
	 * 手机站案例的交叉选择
	 * @author JhoneZhang
	 * @date   2016年8月29日下午5:09:50
	 * @param caseStyle						案例风格
	 * @param caseAcreage					案例面积
	 * @param casesType						案例户型
	 * @param page							页码
	 * @param session
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "selectCases/p{page}")
	@ResponseBody
	public void selectCases(
			@RequestParam(value="caseStyle",required=false,defaultValue="") String caseStyle,
			@RequestParam(value="caseAcreage",required=false,defaultValue="") String caseAcreage,
			@RequestParam(value="casesType",required=false,defaultValue="") String casesType,
			@PathVariable("page") int page,HttpSession session,HttpServletRequest request,HttpServletResponse response) {
		
		response.setContentType("text/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		JSONObject json = new JSONObject();
		ModelAndView model = new ModelAndView();
		// 获取公共信息
		super.getPublicMes(request, session);
		String branchCompany = (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany)){
			branchCompany = "sjzrbw1";
		}
		// 初始化参数
		if(StringUtils.isBlank(caseStyle)){
			caseStyle = "全部";
		}
		if(StringUtils.isBlank(caseAcreage)){
			caseAcreage = "全部";
		}
		if(StringUtils.isBlank(casesType)){
			casesType = "全部";
		}
		// 从session 中获取户型，风格，面积，组合查询
		String SessionCaseStyle = (String) session.getAttribute("caseStyle");
		String SessionCaseAcreage = (String) session.getAttribute("caseAcreage");
		String SessionCasesType = (String) session.getAttribute("casesType");
		// 将session中的值初始化
		if(StringUtils.isBlank(SessionCaseStyle)){
			SessionCaseStyle = "全部";
		}
		if(StringUtils.isBlank(SessionCasesType)){
			SessionCasesType = "全部";
		}
		if(StringUtils.isBlank(SessionCaseAcreage)){
			SessionCaseAcreage = "全部";
		}
		if(!SessionCaseStyle.equals(caseStyle)){
			session.setAttribute("caseStyle", caseStyle);
			SessionCaseStyle = (String) session.getAttribute("caseStyle");
		}else{
			session.setAttribute("caseStyle", caseStyle);
		}
	    if(!SessionCasesType.equals(casesType)){
	    	session.setAttribute("casesType", casesType);
			SessionCasesType = (String) session.getAttribute("casesType");
		}else{
			session.setAttribute("casesType", casesType);
		}
		if(!SessionCaseAcreage.equals(caseAcreage)){
			session.setAttribute("caseAcreage", caseAcreage);
			SessionCaseAcreage = (String) session.getAttribute("caseAcreage");
		}else{
			session.setAttribute("caseAcreage", caseAcreage);
		}
		int rows = 20;//每页显示20条数据
		if(page<=0){
			page = 1;
		}
		CasesExample cs =new CasesExample();
		com.rbw.www.model.CasesExample.Criteria criteria = cs.createCriteria();
		// 图例为空的将不会显示
		criteria.andCaseThumbImgNotEqualTo("");
		// 非删除状态
		criteria.andCaseStatusNotEqualTo(3);
		criteria.andBranchCompanyEqualTo(branchCompany);
	    // 添加分类查询条件
	    if(StringUtils.isNotBlank(SessionCaseStyle) && !SessionCaseStyle.equals("全部") ){
			criteria.andCaseStyleEqualTo(SessionCaseStyle);
		}
	    if(StringUtils.isNotBlank(SessionCaseAcreage) && !SessionCaseAcreage.equals("全部")
	    		&& !SessionCaseAcreage.equals("其他") && !SessionCaseAcreage.equals("150平以上")){
	    	// 切分面积字符串实现面积的分段查询
	    	String[] ss = SessionCaseAcreage.split("-");
	        String begin = ss[0];
	        String end = ss[1];
    	    Pattern p=Pattern.compile("(\\d+)");  
    	    Matcher m=p.matcher(end);      
    	    if(m.find()){
    	    	logger.info(m.group(1));   
    	    } 
	    	criteria.andCaseAcreageBetween(Double.valueOf(begin),Double.valueOf(m.group(1)));
		}else if(SessionCaseAcreage.equals("150平以上")){
			 Pattern p = Pattern.compile("(\\d+)");  
    	     Matcher m = p.matcher(SessionCaseAcreage);      
    	     if(m.find()){
    	       logger.info(m.group(1));   
    	     } 
			criteria.andCaseAcreageGreaterThanOrEqualTo(Double.valueOf(m.group(1)));
		}else if(SessionCaseAcreage.equals("其他")){
			String min= "50";
			criteria.andCaseAcreageLessThanOrEqualTo(Double.valueOf(min));
		}
	    if(StringUtils.isNotBlank(SessionCasesType) && !SessionCasesType.equals("全部") ){
			
			criteria.andCaseHouseTypeEqualTo(SessionCasesType);
		}
		int totalNums = caseMapper.countByExample(cs);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		cs.setPage(p);
		// 排序	
		cs.setOrderByClause("create_time desc");
		List<Cases> caseList = caseMapper.selectByExample(cs);
		session.setAttribute("caseStyle", SessionCaseStyle);
		session.setAttribute("casesType", SessionCasesType);
		session.setAttribute("caseAcreage", SessionCaseAcreage);
		json.put("listCases", caseList);
		json.put("caseStyle", caseStyle);
		json.put("casesType", casesType);
		json.put("caseAcreage",caseAcreage);
		out.print(json.toString());
		out.flush();
		out.close();
	}
	

	@RequestMapping(value = "effectImgs/p{page}")
	public ModelAndView effectImgs(
			@PathVariable("page") int page,HttpServletResponse response,HttpSession session,HttpServletRequest request) {
		
		ModelAndView  model = new ModelAndView();
		String branchCompany = (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany)){
			branchCompany = "sjzrbw1";
		}
		super.getPublicMes(request, session);
		CasesExample ce = new CasesExample();
		com.rbw.www.model.CasesExample.Criteria criteria = ce.createCriteria();
		criteria.andCaseThumbImgNotEqualTo("");
		criteria.andCaseStatusEqualTo(4);
		criteria.andBranchCompanyEqualTo(branchCompany);
		List<Cases>  caseList = caseMapper.selectByExample(ce);
		model.addObject("casesList", caseList);
		model.setViewName("/mobile/effectImgs");
		return model;
	}	
	
}
