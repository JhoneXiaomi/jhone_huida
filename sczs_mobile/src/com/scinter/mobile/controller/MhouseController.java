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
import com.scinter.www.dao.DesignerMapper;
import com.scinter.www.dao.HotBuildingMapper;
import com.scinter.www.dao.HouseTypeReviewMapper;
import com.scinter.www.dao.NewsMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.dao.SysLogMapper;
import com.scinter.www.model.HotBuilding;
import com.scinter.www.model.HotBuildingExample;
import com.scinter.www.model.SysConfig;
import com.scinter.www.model.SysConfigExample;

@Controller
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
	@RequestMapping("Mhouse")
	public ModelAndView HouseMessage(HttpSession session,HttpServletResponse response,HttpServletRequest request) {
		
	    /*获取共有信息*/
		super.getHomeMessage(request, session);
		ModelAndView model = new ModelAndView();
		String branchCompany	= (String) session.getAttribute("branchCompany");
		HotBuildingExample hotBuildingExample =new HotBuildingExample();
		com.scinter.www.model.HotBuildingExample.Criteria criteria = hotBuildingExample.createCriteria();
//		非删除状态
		criteria.andStatusNotEqualTo(3);
//      获取分公司的信息
	    if(null != branchCompany && branchCompany.length()>0){
			
			criteria.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjsc";
			criteria.andBranchCompanyEqualTo(branchCompany);
		}
//		排序	
		hotBuildingExample.setOrderByClause("create_time desc");
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
			hotBuildingLists.add(house);
		}
		/*获取案例列表页SEO 的配置信息*/
	      
	      // SEO 标题信息
	      SysConfigExample scinterNewsSeoTitleStrE = new SysConfigExample();
	      com.scinter.www.model.SysConfigExample.Criteria scinterNewsSeoTitleStrC = scinterNewsSeoTitleStrE.createCriteria();
	      scinterNewsSeoTitleStrC.andKeyNameEqualTo("scinter_house_seo_title");
	      scinterNewsSeoTitleStrC.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(branchCompany)){
	    	  scinterNewsSeoTitleStrC.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjsc";
				scinterNewsSeoTitleStrC.andBranchCompanyEqualTo(branchCompany);
			}
	      SysConfig scinterHouseSeoTitle= null;
	      if(sysConfigMapper.selectByExample(scinterNewsSeoTitleStrE).size()> 0){
	    	  scinterHouseSeoTitle = sysConfigMapper.selectByExample(scinterNewsSeoTitleStrE).get(0);
	      }
	      
	      // SEO 关键字信息 
	      SysConfigExample scinterNewsSeoKeywordStrE = new SysConfigExample();
	      com.scinter.www.model.SysConfigExample.Criteria scinterNewsSeoKeywordStrC = scinterNewsSeoKeywordStrE.createCriteria();
	      scinterNewsSeoKeywordStrC.andKeyNameEqualTo("scinter_house_seo_keyword");
	      scinterNewsSeoKeywordStrC.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(branchCompany)){
	    	  scinterNewsSeoKeywordStrC.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjsc";
				scinterNewsSeoKeywordStrC.andBranchCompanyEqualTo(branchCompany);
			}
	      SysConfig scinterHouseSeoKeyword= null;
	      if(sysConfigMapper.selectByExample(scinterNewsSeoKeywordStrE).size()> 0){
	    	  
	    	  scinterHouseSeoKeyword = sysConfigMapper.selectByExample(scinterNewsSeoKeywordStrE).get(0);
	      }
	      // SEO 描述信息
	      SysConfigExample scinterNewsSeoDescStrE = new SysConfigExample();
	      com.scinter.www.model.SysConfigExample.Criteria scinterNewsSeoDescStrC = scinterNewsSeoDescStrE.createCriteria();
	      scinterNewsSeoDescStrC.andKeyNameEqualTo("scinter_house_seo_desc");
	      scinterNewsSeoDescStrC.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(branchCompany)){
	    	  scinterNewsSeoDescStrC.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjsc";
				scinterNewsSeoDescStrC.andBranchCompanyEqualTo(branchCompany);
			}
	      SysConfig scinterHouseSeoDesc= null;
	      if(sysConfigMapper.selectByExample(scinterNewsSeoDescStrE).size()> 0){
	      	
	    	  scinterHouseSeoDesc = sysConfigMapper.selectByExample(scinterNewsSeoDescStrE).get(0);
	      }
	    model.addObject("scinterHouseSeoTitle", scinterHouseSeoTitle);
	    model.addObject("scinterHouseSeoKeyword", scinterHouseSeoKeyword);
	    model.addObject("scinterHouseSeoDesc", scinterHouseSeoDesc); 
		model.addObject("hotBuildingList", hotBuildingLists);
		model.setViewName("/mobile/house");
		logger.info("成功实现热装楼盘的查询功能");
		return model;
	}
	
	
	/**
	 * 实现热装楼盘的详情的展示
	 * @param response		用于动态响应客户端请示
	 */
	@RequestMapping("MhouseDetail")
	public ModelAndView houseDetail(
			@RequestParam("hotBuildingId") String hotBuildingId,HttpSession session, 
			HttpServletResponse response,HttpServletRequest request) {
		
	   /*获取共有的信息*/
		super.getHomeMessage(request, session);
		ModelAndView model = new ModelAndView();
		String branchCompany	= (String) session.getAttribute("branchCompany");
		HotBuildingExample hotBuildingExample =new HotBuildingExample();
		com.scinter.www.model.HotBuildingExample.Criteria criteria = hotBuildingExample.createCriteria();
//		非删除状态
		criteria.andStatusNotEqualTo(3);
//		查询分公司的信息
	    if(null != branchCompany && branchCompany.length()>0){
	    	
	    	criteria.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjsc";
			criteria.andBranchCompanyEqualTo(branchCompany);
		}
//		排序	
		hotBuildingExample.setOrderByClause("create_time desc");
		List<HotBuilding> hotBuildingList = hotBuildingMapper.selectByExample(hotBuildingExample);
		model.addObject("hotBuildingList", hotBuildingList);
		model.setViewName("/mobile/houseDetail");
		logger.info("成功实现热装楼盘详情功能");
		return model;
	}
	
	
}
