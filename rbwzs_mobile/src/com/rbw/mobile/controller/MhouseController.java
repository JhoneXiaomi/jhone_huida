package com.rbw.mobile.controller;
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
import com.rbw.www.dao.DesignerMapper;
import com.rbw.www.dao.HotBuildingMapper;
import com.rbw.www.dao.HouseTypeReviewMapper;
import com.rbw.www.dao.NewsMapper;
import com.rbw.www.dao.SysConfigMapper;
import com.rbw.www.dao.SysLogMapper;
import com.rbw.www.model.HotBuilding;
import com.rbw.www.model.HotBuildingExample;
import com.rbw.www.model.SysConfig;
import com.rbw.www.model.SysConfigExample;
import com.rbw.www.util.Page;

@Controller
@RequestMapping("m")
public class MhouseController extends MbaseController{

	private Logger logger = Logger.getLogger(MhouseController.class);
	@Autowired
	private SysLogMapper sysLogMapper;
	@Autowired
	private DesignerMapper designerMapper;
	@Autowired
	private NewsMapper newsMapper;
	@Autowired
	private HotBuildingMapper hotBuildingMapper;
	@Autowired
	private HouseTypeReviewMapper houseTypeReviewMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	/**
	 * 实现热装楼盘的列表页信息的展示
	 * @param response		用于动态响应客户端请示
	 */
	@RequestMapping(value = "house/p{page}")
	public ModelAndView HouseMessage(
			@PathVariable("page") int page,
			HttpSession session,HttpServletResponse response,HttpServletRequest request) {
		
		/*获取共有的信息*/
		super.getPublicMes(request, session);
		int rows = 10;//每页显示20条数据
		if(page<=0){
			page = 1;
		}
		ModelAndView model = new ModelAndView();
		String branchCompany	= (String) session.getAttribute("branchCompany");
		HotBuildingExample hotBuildingExample =new HotBuildingExample();
		com.rbw.www.model.HotBuildingExample.Criteria criteria = hotBuildingExample.createCriteria();
//		非删除状态
		criteria.andStatusNotEqualTo(3);
//      获取分公司的信息
	    if(null != branchCompany && branchCompany.length()>0){
			
			criteria.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "sjzrbw1";
			criteria.andBranchCompanyEqualTo(branchCompany);
		}
//		排序	
		hotBuildingExample.setOrderByClause("create_time desc");
		int totalNums = hotBuildingMapper.countByExample(hotBuildingExample);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		hotBuildingExample.setPage(p);
		List<HotBuilding> hotBuildingList = hotBuildingMapper.selectByExample(hotBuildingExample);
		List<HotBuilding> hotBuildingLists = new ArrayList<HotBuilding>();
		for(HotBuilding house:hotBuildingList){
//			去除行政区域中的空值
			String area = house.getBulidingArea();
			String[] ss = area.split(",");
			List<String> newArea = new ArrayList<String>();
			for(String s:ss){
				if(!s.equals("null") && s.length()>0){
					newArea.add(s);
				}
			}
			area = newArea.toString().substring(1,newArea.toString().length()-1);
			house.setBulidingArea(area);
//			获取设计师姓名,并将其植入house 类
//			Designer designer = designerMapper.selectByPrimaryKey(Integer.valueOf(house.getDsesignerId()));
//			house.setHouseDesigner(designer.getDesignerName());
			hotBuildingLists.add(house);
		}

		/*获取SEO 的配置信息*/
        // SEO 标题信息
        SysConfigExample sysConfigExamplerbwHomeSeoTitle = new SysConfigExample();
        com.rbw.www.model.SysConfigExample.Criteria criteriarbwHomeSeoTitle = sysConfigExamplerbwHomeSeoTitle.createCriteria();
        criteriarbwHomeSeoTitle.andKeyNameEqualTo("rbw_house_seo_title");
        criteriarbwHomeSeoTitle.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriarbwHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "sjzrbw1";
  			criteriarbwHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig xzzsHouseSeoTitle= null;
        if(sysConfigMapper.selectByExample(sysConfigExamplerbwHomeSeoTitle).size()> 0){
        	xzzsHouseSeoTitle = sysConfigMapper.selectByExample(sysConfigExamplerbwHomeSeoTitle).get(0);
        }
        
        // SEO 关键字信息
        SysConfigExample sysConfigExamplerbwhomeSeoKeyword = new SysConfigExample();
        com.rbw.www.model.SysConfigExample.Criteria criteriarbwhomeSeoKeyword = sysConfigExamplerbwhomeSeoKeyword.createCriteria();
        criteriarbwhomeSeoKeyword.andKeyNameEqualTo("rbw_house_seo_keyword");
        criteriarbwhomeSeoKeyword.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriarbwhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "sjzrbw1";
  			criteriarbwhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig xzzsHouseSeoKeyword= null;
        if(sysConfigMapper.selectByExample(sysConfigExamplerbwhomeSeoKeyword).size()> 0){
        	xzzsHouseSeoKeyword = sysConfigMapper.selectByExample(sysConfigExamplerbwhomeSeoKeyword).get(0);
        }
        
        // SEO 描述信息
        SysConfigExample sysConfigExamplerbwHomeSeoDesc = new SysConfigExample();
        com.rbw.www.model.SysConfigExample.Criteria criteriarbwHomeSeoDesc = sysConfigExamplerbwHomeSeoDesc.createCriteria();
        criteriarbwHomeSeoDesc.andKeyNameEqualTo("rbw_house_seo_desc");
        criteriarbwHomeSeoDesc.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriarbwHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "sjzrbw1";
  			criteriarbwHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig xzzsHouseSeoDesc= null;
        if(sysConfigMapper.selectByExample(sysConfigExamplerbwHomeSeoDesc).size()> 0){
        	xzzsHouseSeoDesc = sysConfigMapper.selectByExample(sysConfigExamplerbwHomeSeoDesc).get(0);
        }
        model.addObject("xzzsHouseSeoTitle", xzzsHouseSeoTitle);
        model.addObject("xzzsHouseSeoKeyword", xzzsHouseSeoKeyword);
        model.addObject("designerSeoDescStr", xzzsHouseSeoDesc);
		model.addObject("page", p);
		model.addObject("totalNums", totalNums);
		model.addObject("hotBuildingLists", hotBuildingLists);
		model.setViewName("/mobile/house");
		return model;
	}
	
	
	/**
	 * 实现热装楼盘的详情的展示
	 * @param response		用于动态响应客户端请示
	 */
	@RequestMapping("houseDetail")
	public ModelAndView houseDetail(@RequestParam("buildingId") Integer buildingId,HttpSession session, HttpServletResponse response) {
		ModelAndView model = new ModelAndView();
		String branchCompany = (String) session.getAttribute("branchCompany");
		HotBuildingExample hotBuildingExample =new HotBuildingExample();
		com.rbw.www.model.HotBuildingExample.Criteria criteria = hotBuildingExample.createCriteria();
//		非删除状态
		criteria.andStatusNotEqualTo(3);
//		查询分公司的信息
	    if(null != branchCompany && branchCompany.length()>0){
	    	
	    	criteria.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "sjzrbw1";
			criteria.andBranchCompanyEqualTo(branchCompany);
		}
//		排序	
		hotBuildingExample.setOrderByClause("create_time desc");
		List<HotBuilding> hotBuildingList = hotBuildingMapper.selectByExample(hotBuildingExample);
		/*获取当前的楼盘*/
		HotBuilding building = hotBuildingMapper.selectByPrimaryKey(buildingId);
		model.addObject("buliding", building);
		model.addObject("hotBuildingList", hotBuildingList);
		model.setViewName("/mobile/houseDetail");
		return model;
	}
	
	
}
