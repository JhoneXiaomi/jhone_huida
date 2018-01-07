package com.scinter.www.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.scinter.base.baseController.BaseController;
import com.scinter.www.dao.CaseShowImageMapper;
import com.scinter.www.dao.CasesMapper;
import com.scinter.www.dao.DesignerMapper;
import com.scinter.www.dao.NewsMapper;
import com.scinter.www.dao.OrderInfoMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.dao.SysLogMapper;
import com.scinter.www.model.CaseShowImageExample;
import com.scinter.www.model.Cases;
import com.scinter.www.model.CasesExample;
import com.scinter.www.model.Designer;
import com.scinter.www.model.DesignerExample;
import com.scinter.www.model.OrderInfoExample;
import com.scinter.www.model.SysConfig;
import com.scinter.www.model.SysConfigExample;
import com.scinter.www.model.DesignerExample.Criteria;
import com.scinter.www.util.Page;

@Controller
public class DesignerController extends BaseController{

	private Logger logger = Logger.getLogger(DesignerController.class);
	@Autowired
	private DesignerMapper designerMapper;
	@Autowired
	private CasesMapper caseMapper;
	@Autowired
	private CaseShowImageMapper caseShowImageMapper;
	@Autowired
	private SysLogMapper sysLogMapper;
	@Autowired
	private NewsMapper newsMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	@Autowired
	private OrderInfoMapper orderInfoMapper;
	
	/**
	 * 实现装设计师信息的展示
	 * @param page			当前的页码
	 * @param rows			页内容量
	 * @param response		用于动态响应客户端请示
	 */
	/*@RequestMapping(value = "designer/p{page}", method = RequestMethod.GET)
	public ModelAndView designerMessage(
			@RequestParam(value="designerName",required=false)String designerName,
			@RequestParam(value="designerDept",required=false)String designerDept,
			@PathVariable("page") int page,HttpSession session,HttpServletResponse response) {
		
		// 获取公共信息
		super.getPublicMes(session);
		if(StringUtils.isNotBlank(designerName)){
			try {
				designerName = new String(designerName.getBytes("ISO8859_1"),"utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		if(StringUtils.isNotBlank(designerDept)){
			try {
				designerDept = new String(designerDept.getBytes("ISO8859_1"),"utf-8");
			} catch (UnsupportedEncodingException e) {
				logger.info(e.getMessage());
			}
		}
		ModelAndView model = new ModelAndView();
		String branchCompany = (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany)){
			branchCompany = "bjxz";
		}
		DesignerExample designerExample = new DesignerExample();
		Criteria criDesigner = designerExample.createCriteria();
		// 过滤掉图片为空的设计师
		criDesigner.andDesignerPhotoImgNotEqualTo("");
		criDesigner.andStatusNotEqualTo(3);
		if(StringUtils.isNotBlank(designerName)){
			criDesigner.andDesignerNameLike("%"+designerName+"%");
		}
		if(StringUtils.isNotBlank(designerDept)){
			criDesigner.andDesignerDeptEqualTo(designerDept);
		}
	    criDesigner.andBranchCompanyEqualTo(branchCompany);
		designerExample.setOrderByClause("update_time desc");//排序
		List<Designer> designersList = designerMapper.selectByExample(designerExample);
		List<Designer> designerList = new ArrayList<Designer>();
		
			for(Designer designer:designersList){
				
			 	CasesExample ce = new  CasesExample();
			 	com.scinter.www.model.CasesExample.Criteria cc = ce.createCriteria();
			 	cc.andDesignerIdEqualTo(designer.getDesignerId());
			 	cc.andCaseThumbImgNotEqualTo("");
			 	cc.andCaseStatusNotEqualTo(3);
			 	designer.setDesignerCases(caseMapper.countByExample(ce));
			 
			 	List<Cases> listcases = caseMapper.selectByExample(ce);
			 	List<Cases> cases = new ArrayList<Cases>();
			 	
			 	for(Cases cs:listcases){
			 		
			 		cases.add(cs);
			 	}
			 	designer.setCases(cases);
				designerList.add(designer);
			}
		
		// 热装案例 
		CasesExample cee = new CasesExample();
		com.scinter.www.model.CasesExample.Criteria cca = cee.createCriteria();
		cca.andBranchCompanyEqualTo(branchCompany);
		cca.andCaseStatusEqualTo(1);
		cca.andCaseThumbImgNotEqualTo("");
		List<Cases> casesList =  caseMapper.selectByExample(cee);
		
		// 获取订单总数
		
		OrderInfoExample oe = new OrderInfoExample();
		com.scinter.www.model.OrderInfoExample.Criteria oc =  oe.createCriteria();
		oc.andStatusEqualTo(1);
		oc.andBranchCompanyEqualTo(branchCompany);
		Integer orderNumber = orderInfoMapper.countByExample(oe);
		获取SEO 的配置信息
        // SEO 标题信息
        SysConfigExample sysConfigExampleScinterHomeSeoTitle = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoTitle = sysConfigExampleScinterHomeSeoTitle.createCriteria();
        criteriaScinterHomeSeoTitle.andKeyNameEqualTo("scinter_designer_seoTitle_str");
        criteriaScinterHomeSeoTitle.andValueNotEqualTo("");
  		criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
        SysConfig designerSeoTitleStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).size()> 0){
        	designerSeoTitleStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).get(0);
        }
        
        // SEO 关键字信息
        SysConfigExample sysConfigExampleScinterhomeSeoKeyword = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria criteriaScinterhomeSeoKeyword = sysConfigExampleScinterhomeSeoKeyword.createCriteria();
        criteriaScinterhomeSeoKeyword.andKeyNameEqualTo("scinter_designer_seoKeyword_str");
        criteriaScinterhomeSeoKeyword.andValueNotEqualTo("");
  		criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
        SysConfig designerSeoKeywordStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).size()> 0){
        	designerSeoKeywordStr = sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).get(0);
        }
        
        // SEO 描述信息
        SysConfigExample sysConfigExampleScinterHomeSeoDesc = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoDesc = sysConfigExampleScinterHomeSeoDesc.createCriteria();
        criteriaScinterHomeSeoDesc.andKeyNameEqualTo("scinter_designer_seoDesc_str");
        criteriaScinterHomeSeoDesc.andValueNotEqualTo("");
  		criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
        SysConfig designerSeoDescStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).size()> 0){
        	
        	designerSeoDescStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).get(0);
        }
        session.setAttribute("designerSeoTitleStr", designerSeoTitleStr);
        session.setAttribute("designerSeoKeywordStr", designerSeoKeywordStr);
        session.setAttribute("designerSeoDescStr", designerSeoDescStr);
        model.addObject("orderNumber", orderNumber);
        model.addObject("casesList", casesList);
        model.addObject("designerSeoKeywordStr", designerSeoKeywordStr);
        model.addObject("designerSeoDescStr", designerSeoDescStr);
		model.addObject("currentBCompany",branchCompany );
		model.addObject("designerList", designerList);
		model.setViewName("/www/designer");
		return model;
	}
*/
	@RequestMapping(value = "designer/p{page}", method = RequestMethod.GET)
	public ModelAndView designerMessage(
			@RequestParam(value="designerName",required=false)String designerName,
			@RequestParam(value="designerDept",required=false)String designerDept,
			@RequestParam(value="houseStyle",required=false)String houseStyle,
			@RequestParam(value="designerLevel",required=false)String designerLevel,
			@PathVariable("page") int page,HttpSession session,HttpServletResponse response) {
		
		// 获取公共信息
		super.getPublicMes(session);
		if(StringUtils.isNotBlank(designerName)){
			try {
				designerName = new String(designerName.getBytes("ISO8859_1"),"utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		if(StringUtils.isNotBlank(designerDept)){
			try {
				designerDept = new String(designerDept.getBytes("ISO8859_1"),"utf-8");
			} catch (UnsupportedEncodingException e) {
				logger.info(e.getMessage());
			}
		}
		ModelAndView model = new ModelAndView();
		String branchCompany = (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany)){
			branchCompany = "bjxz";
		}
		DesignerExample designerExample = new DesignerExample();
		Criteria criDesigner = designerExample.createCriteria();
		Criteria criDesigner2 = designerExample.createCriteria();
		// 过滤掉图片为空的设计师
		criDesigner.andDesignerPhotoImgNotEqualTo("");
		criDesigner.andStatusNotEqualTo(3);
		criDesigner2.andStatusNotEqualTo(3);
		if(StringUtils.isNotBlank(designerName)){
			criDesigner.andDesignerNameLike("%"+designerName+"%");
			criDesigner2.andDesignerNameLike("%"+designerName+"%");
		}
		if(StringUtils.isNotBlank(designerDept)){
			criDesigner.andDesignerDeptEqualTo(designerDept);
			criDesigner2.andDesignerDeptEqualTo(designerDept);
		}
		//设计风格
		model.addObject("houseStyle", houseStyle);
	 	if(!StringUtils.isBlank(houseStyle)){
			houseStyle=getHouseStyle(houseStyle);
			criDesigner.andDesignerStyleLike("%"+houseStyle+"%");
			criDesigner2.andDesignerStyleLike("%"+houseStyle+"%");
		}
	 	//设计级别
	 	model.addObject("designerLevel", designerLevel);
	 	if(!StringUtils.isBlank(designerLevel)){
		 	if(designerLevel.equals("sjzj")){
		 		criDesigner.andDesignerTitleLike("%总监%");
		 		criDesigner2.andDesignerTitleLike("%经理%");
			}
		 	if(designerLevel.equals("gjsxsjs")){
		 		criDesigner.andDesignerTitleLike("%主管%");
		 		criDesigner2.andDesignerTitleLike("%主任%");
			}
		 	if(designerLevel.equals("sxsjs")){
		 		criDesigner.andDesignerTitleLike("%首席%");
		 		criDesigner2.andDesignerTitleLike("%首席%");
			}
		 	if(designerLevel.equals("zrsjs")){
		 		criDesigner.andDesignerTitleLike("%高级%");
		 		criDesigner2.andDesignerTitleLike("%精品%");
			}
		 	if(designerLevel.equals("yxsjs")){
		 		criDesigner.andDesignerTitleLike("%设计师%");
		 		criDesigner2.andDesignerTitleLike("%设计师%");
			}
	 	}
	    criDesigner.andBranchCompanyEqualTo(branchCompany);
	    criDesigner2.andBranchCompanyEqualTo(branchCompany);
	 	designerExample.or(criDesigner2);
		designerExample.setOrderByClause("update_time desc");//排序
		List<Designer> designersList = designerMapper.selectByExample(designerExample);
		List<Designer> designerList = new ArrayList<Designer>();
		
			for(Designer designer:designersList){
				
			 	CasesExample ce = new  CasesExample();
			 	com.scinter.www.model.CasesExample.Criteria cc = ce.createCriteria();
			 	cc.andDesignerIdEqualTo(designer.getDesignerId());
			 	cc.andCaseThumbImgNotEqualTo("");
			 	cc.andCaseStatusNotEqualTo(3);
			 	designer.setDesignerCases(caseMapper.countByExample(ce));

			 	List<Cases> listcases = caseMapper.selectByExample(ce);
			 	List<Cases> cases = new ArrayList<Cases>();
			 	
			 	for(Cases cs:listcases){
			 		
			 		cases.add(cs);
			 	}
			 	designer.setCases(cases);
				designerList.add(designer);
			}
		
		// 热装案例 
		
		CasesExample cee = new CasesExample();
		com.scinter.www.model.CasesExample.Criteria cca = cee.createCriteria();
		cca.andBranchCompanyEqualTo(branchCompany);
		cca.andCaseStatusEqualTo(1);
		cca.andCaseThumbImgNotEqualTo("");
		List<Cases> casesList =  caseMapper.selectByExample(cee);
		
		// 获取订单总数
		
		OrderInfoExample oe = new OrderInfoExample();
		com.scinter.www.model.OrderInfoExample.Criteria oc =  oe.createCriteria();
		oc.andStatusEqualTo(1);
		oc.andBranchCompanyEqualTo(branchCompany);
		Integer orderNumber = orderInfoMapper.countByExample(oe);
		//获取SEO 的配置信息
        // SEO 标题信息
        SysConfigExample sysConfigExampleScinterHomeSeoTitle = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoTitle = sysConfigExampleScinterHomeSeoTitle.createCriteria();
        criteriaScinterHomeSeoTitle.andKeyNameEqualTo("scinter_designer_seoTitle_str");
        criteriaScinterHomeSeoTitle.andValueNotEqualTo("");
  		criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
        SysConfig designerSeoTitleStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).size()> 0){
        	designerSeoTitleStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).get(0);
        }
        
        // SEO 关键字信息
        SysConfigExample sysConfigExampleScinterhomeSeoKeyword = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria criteriaScinterhomeSeoKeyword = sysConfigExampleScinterhomeSeoKeyword.createCriteria();
        criteriaScinterhomeSeoKeyword.andKeyNameEqualTo("scinter_designer_seoKeyword_str");
        criteriaScinterhomeSeoKeyword.andValueNotEqualTo("");
  		criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
        SysConfig designerSeoKeywordStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).size()> 0){
        	designerSeoKeywordStr = sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).get(0);
        }
        
        // SEO 描述信息
        SysConfigExample sysConfigExampleScinterHomeSeoDesc = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoDesc = sysConfigExampleScinterHomeSeoDesc.createCriteria();
        criteriaScinterHomeSeoDesc.andKeyNameEqualTo("scinter_designer_seoDesc_str");
        criteriaScinterHomeSeoDesc.andValueNotEqualTo("");
  		criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
        SysConfig designerSeoDescStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).size()> 0){
        	
        	designerSeoDescStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).get(0);
        }
        session.setAttribute("designerSeoTitleStr", designerSeoTitleStr);
        session.setAttribute("designerSeoKeywordStr", designerSeoKeywordStr);
        session.setAttribute("designerSeoDescStr", designerSeoDescStr);
        model.addObject("orderNumber", orderNumber);
        model.addObject("casesList", casesList);
        model.addObject("designerSeoKeywordStr", designerSeoKeywordStr);
        model.addObject("designerSeoDescStr", designerSeoDescStr);
		model.addObject("currentBCompany",branchCompany );
		model.addObject("designerList", designerList);
		
		model.setViewName("/www/designer");
		return model;
	}
	/**
	 * 设计师的详细信息
	 * @author JhoneZhang
	 * @date   2016年8月22日下午4:16:24
	 * @param designerId
	 * @param page
	 * @param session
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "designerDetail/p{page}", method = RequestMethod.GET)
	public ModelAndView designerDetail(@RequestParam("designerId")Integer designerId,@PathVariable("page") int page,
			HttpSession session,HttpServletResponse response) {
		ModelAndView model = new ModelAndView();
		String branchCompany = (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany))
			branchCompany = "bjxz";
		// 获取公共信息
		super.getPublicMes(session);
		// 获取设计师的信息
		Designer designer = designerMapper.selectByPrimaryKey(designerId);
		int rows = 8;//每页显示8条数据
		if(page<=0){
			page = 1;
		}
		// 获取设计师对应的所有的案例
		CasesExample cs =new CasesExample();
		com.scinter.www.model.CasesExample.Criteria criteria = cs.createCriteria();
		// 过滤案例图片为空的案例
		criteria.andCaseThumbImgNotEqualTo("");
		// 非删除状态
		criteria.andCaseStatusNotEqualTo(3);
		// 获取分公司的信息
		criteria.andBranchCompanyEqualTo(branchCompany);
		criteria.andDesignerIdEqualTo(designerId);
		int totalNums = caseMapper.countByExample(cs);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		cs.setPage(p);
		// 排序	
		cs.setOrderByClause("create_time desc");
		List<Cases> listCases = caseMapper.selectByExample(cs);
		List<Cases> caseList = new ArrayList<Cases>();
		
        for(Cases cases:listCases){
        	
        	CaseShowImageExample ce = new CaseShowImageExample();
        	com.scinter.www.model.CaseShowImageExample.Criteria cc = ce.createCriteria();
        	cc.andCaseIdEqualTo(cases.getCaseId());
        	Designer de = designerMapper.selectByPrimaryKey(cases.getDesignerId());
        	cases.setCaseThumbNumber(caseShowImageMapper.countByExample(ce));
        	cases.setDesignerPhoto(de.getDesignerPhotoImg());
        	cases.setDesignerName(de.getDesignerName());
        	caseList.add(cases);
        }
		
		// 获取所有的案例
		CasesExample csall =new CasesExample();
		com.scinter.www.model.CasesExample.Criteria criteriaAll = csall.createCriteria();
		// 过滤案例图片为空的案例
		criteriaAll.andCaseThumbImgNotEqualTo("");
		// 非删除状态
		criteriaAll.andCaseStatusNotEqualTo(3);
		// 获取分公司的信息
		criteriaAll.andBranchCompanyEqualTo(branchCompany);
	    // 排序	
		csall.setOrderByClause("create_time desc");
		List<Cases> caseAll = caseMapper.selectByExample(csall);
		
		
		// 获取更多设计师的信息
		DesignerExample de = new DesignerExample();
		Criteria dCriteria = de.createCriteria();
		dCriteria.andBranchCompanyEqualTo(branchCompany);
		dCriteria.andStatusNotEqualTo(3);
		dCriteria.andDesignerPhotoImgNotEqualTo("");
		de.setOrderByClause("update_time desc");
		List<Designer> designerList =  designerMapper.selectByExample(de);
		
		// 推荐案例
		CasesExample  casesEx = new CasesExample();
 		com.scinter.www.model.CasesExample.Criteria caseC = casesEx.createCriteria();
 		caseC.andBranchCompanyEqualTo(branchCompany);
 		caseC.andCaseStatusEqualTo(1);
 		caseC.andCaseThumbImgNotEqualTo("");
 		
 		
		
		model.addObject("designerList", designerList);
		model.addObject("caseAll", caseAll);
		model.addObject("page", p);
		model.addObject("caseList", caseList);
		model.addObject("designer", designer);
		model.addObject("totalNums",totalNums);
		model.addObject("currentBCompany", branchCompany);
		model.setViewName("/www/designerDetail");
		return model;
	}
	
	public String getHouseStyle(String houseStyle){
		if(houseStyle.equals("styleAll")){
			houseStyle="";
		}
		if(houseStyle.equals("xdjy")){
			houseStyle="现代简约";
		}
		if(houseStyle.equals("osgd")){
			houseStyle="欧式";
		}
		
		if(houseStyle.equals("tyxc")){
			houseStyle="田园";
		}
		if(houseStyle.equals("jo")){
			houseStyle="简欧";
		}
		
		if(houseStyle.equals("msfg")){
			houseStyle="美式";
		}
		if(houseStyle.equals("dzh")){
			houseStyle="地中海";
		}
		if(houseStyle.equals("hd")){
			houseStyle="";
		}
		if(houseStyle.equals("zs")){
			houseStyle="中式";
		}
		if(houseStyle.equals("xzs")){
			houseStyle="中式";
		}
		if(houseStyle.equals("hxd")){
			houseStyle="后现代";
		}
		return houseStyle;
	}
	
}
