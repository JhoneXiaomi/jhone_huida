package com.scinter.www.controller;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.base.controller.BaseController;
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
import com.scinter.www.util.Page;

@Controller
public class HouseController extends BaseController{

	private Logger logger = Logger.getLogger(HouseController.class);
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
	 * 实现楼盘信息的列表页信息的展示
	 * @param page			当前的页码
	 * @param rows			页内容量
	 * @param response		用于动态响应客户端请示
	 */
	@RequestMapping(value = "house/p{page}", method = RequestMethod.GET)
	public ModelAndView HouseMessage(@PathVariable("page") int page,HttpServletRequest request, HttpSession session,HttpServletResponse response) {
		
		/*配置共有的信息*/
		super.getHomeMessage(request, session);
		ModelAndView model = new ModelAndView();
//		获取当前的楼盘信息
		String branchCompany = (String) session.getAttribute("branchCompany");
		int rows = 12;//每页显示12条数据
		if(page<=0){
			page = 1;
		}
		HotBuildingExample hotBuildingExample =new HotBuildingExample();
		com.scinter.www.model.HotBuildingExample.Criteria criteria = hotBuildingExample.createCriteria();
//		非删除状态
		criteria.andBulidingThumbImgNotEqualTo("");
		criteria.andStatusNotEqualTo(3);
//      获取分公司的信息
	    if(null != branchCompany && branchCompany.length()>0){
			
			criteria.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjsc";
			criteria.andBranchCompanyEqualTo(branchCompany);
		}
		int totalNums = hotBuildingMapper.countByExample(hotBuildingExample);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		hotBuildingExample.setPage(p);
//		排序	
		hotBuildingExample.setOrderByClause("create_time desc");
		List<HotBuilding> hotBuildingList = hotBuildingMapper.selectByExample(hotBuildingExample);
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
		model.addObject("page", p);
		model.addObject("currentBCompany", branchCompany); 
		model.addObject("hotBuildingList", hotBuildingList);
		model.addObject("totalNums",totalNums);
		model.setViewName("/www/house");
		logger.info("成功实现热装楼盘的查询功能");
		return model;
	}
	
	/**
	 * 实现热装楼盘的详情的展示
	 * @param response		用于动态响应客户端请示
	 */
	@RequestMapping("houseDetail")
	public ModelAndView houseDetail(
			@RequestParam("hotBuildingId") String hotBuildingId,
			HttpSession session, HttpServletResponse response,HttpServletRequest request) {
		
		/*获取共有信息*/
		super.getHomeMessage(request, session);
		ModelAndView model = new ModelAndView();
//		获取当前的楼盘信息
		String branchCompany = (String) session.getAttribute("branchCompany");
//		获取当前的楼盘信息
		HotBuilding currentHouse = hotBuildingMapper.selectByPrimaryKey(Integer.valueOf(hotBuildingId));
		String area = currentHouse.getBulidingArea();
		String[] ss = area.split(",");
		List<String> newArea = new ArrayList<String>();
		for(String s:ss){
			if(!s.equals("null") && s.length()>0){
				newArea.add(s);
			}
		}
		area = newArea.toString().substring(1,newArea.toString().length()-1);
		currentHouse.setBulidingArea(area);
		
		
		HotBuildingExample hotBuildingExample =new HotBuildingExample();
		com.scinter.www.model.HotBuildingExample.Criteria criteria = hotBuildingExample.createCriteria();
//		非删除状态
		criteria.andStatusNotEqualTo(3);
		criteria.andBranchCompanyEqualTo(branchCompany);
		criteria.andBulidingThumbImgNotEqualTo("");
//		排序	
		hotBuildingExample.setOrderByClause("create_time desc");
		List<HotBuilding> hotBuildingList = hotBuildingMapper.selectByExample(hotBuildingExample);
		model.addObject("hotBuildingList", hotBuildingList);
		model.addObject("currentHouse", currentHouse);
		model.addObject("currentBCompany", branchCompany); 
		model.setViewName("/www/houseDetail");
		return model;
	}
	/**
	 * 实现热装楼盘的列表页信息的展示
	 * @param page			当前的页码
	 * @param rows			页内容量
	 * @param response		用于动态响应客户端请示
	 */
	@RequestMapping(value = "hotBuilding/p{page}", method = RequestMethod.GET)
	public ModelAndView HotBuilding(
			@PathVariable("page") int page,HttpSession session,HttpServletResponse response,HttpServletRequest request) {
		
		super.getHomeMessage(request, session);
		ModelAndView model = new ModelAndView();
		// 获取当前的楼盘信息
		String branchCompany = (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany))
			 branchCompany = "bjsc";
		int rows = 12;//每页显示12条数据
		if(page<=0){
			page = 1;
		}
		HotBuildingExample hotBuildingExample =new HotBuildingExample();
		com.scinter.www.model.HotBuildingExample.Criteria criteria = hotBuildingExample.createCriteria();
		// 非删除状态
		criteria.andBulidingThumbImgNotEqualTo("");
		criteria.andStatusNotEqualTo(3);
		// 获取分公司的信息
		criteria.andBranchCompanyEqualTo(branchCompany);
		int totalNums = hotBuildingMapper.countByExample(hotBuildingExample);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		hotBuildingExample.setPage(p);
		// 排序	
		hotBuildingExample.setOrderByClause("create_time desc");
		List<HotBuilding> hotBuildingList = hotBuildingMapper.selectByExample(hotBuildingExample);
		model.addObject("page", p);
		model.addObject("currentBCompany", branchCompany);
		model.addObject("hotBuildingList", hotBuildingList);
		model.addObject("totalNums",totalNums);
		model.setViewName("/www/hotBuiding");
		return model;
	}
	
}
