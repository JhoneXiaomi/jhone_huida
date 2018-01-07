package com.rbw.www.controller;
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

import com.rbw.base.controller.BaseController;
import com.rbw.www.dao.DesignerMapper;
import com.rbw.www.dao.HotBuildingMapper;
import com.rbw.www.dao.NewsMapper;
import com.rbw.www.dao.SysConfigMapper;
import com.rbw.www.dao.SysLogMapper;
import com.rbw.www.model.HotBuilding;
import com.rbw.www.model.HotBuildingExample;
import com.rbw.www.model.SysConfig;
import com.rbw.www.model.SysConfigExample;
import com.rbw.www.util.Page;

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
		com.rbw.www.model.HotBuildingExample.Criteria criteria = hotBuildingExample.createCriteria();
//		非删除状态
		criteria.andBulidingThumbImgNotEqualTo("");
		criteria.andStatusNotEqualTo(3);
//      获取分公司的信息
	    if(null != branchCompany && branchCompany.length()>0){
			
			criteria.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "sjzrbw1";
			criteria.andBranchCompanyEqualTo(branchCompany);
		}
		int totalNums = hotBuildingMapper.countByExample(hotBuildingExample);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		hotBuildingExample.setPage(p);
//		排序	
		hotBuildingExample.setOrderByClause("update_time desc");
		List<HotBuilding> hotBuildingList = hotBuildingMapper.selectByExample(hotBuildingExample);
		/*获取案例列表页SEO 的配置信息*/
	      
	      // SEO 标题信息
	      SysConfigExample rbwNewsSeoTitleStrE = new SysConfigExample();
	      com.rbw.www.model.SysConfigExample.Criteria rbwNewsSeoTitleStrC = rbwNewsSeoTitleStrE.createCriteria();
	      rbwNewsSeoTitleStrC.andKeyNameEqualTo("scinter_house_seo_title");
	      rbwNewsSeoTitleStrC.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(branchCompany)){
	    	  rbwNewsSeoTitleStrC.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "sjzrbw1";
				rbwNewsSeoTitleStrC.andBranchCompanyEqualTo(branchCompany);
			}
	      SysConfig rbwHouseSeoTitle= null;
	      if(sysConfigMapper.selectByExample(rbwNewsSeoTitleStrE).size()> 0){
	    	  rbwHouseSeoTitle = sysConfigMapper.selectByExample(rbwNewsSeoTitleStrE).get(0);
	      }
	      
	      // SEO 关键字信息 
	      SysConfigExample rbwNewsSeoKeywordStrE = new SysConfigExample();
	      com.rbw.www.model.SysConfigExample.Criteria rbwNewsSeoKeywordStrC = rbwNewsSeoKeywordStrE.createCriteria();
	      rbwNewsSeoKeywordStrC.andKeyNameEqualTo("scinter_house_seo_keyword");
	      rbwNewsSeoKeywordStrC.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(branchCompany)){
	    	  rbwNewsSeoKeywordStrC.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "sjzrbw1";
				rbwNewsSeoKeywordStrC.andBranchCompanyEqualTo(branchCompany);
			}
	      SysConfig rbwHouseSeoKeyword= null;
	      if(sysConfigMapper.selectByExample(rbwNewsSeoKeywordStrE).size()> 0){
	    	  
	    	  rbwHouseSeoKeyword = sysConfigMapper.selectByExample(rbwNewsSeoKeywordStrE).get(0);
	      }
	      // SEO 描述信息
	      SysConfigExample rbwNewsSeoDescStrE = new SysConfigExample();
	      com.rbw.www.model.SysConfigExample.Criteria rbwNewsSeoDescStrC = rbwNewsSeoDescStrE.createCriteria();
	      rbwNewsSeoDescStrC.andKeyNameEqualTo("scinter_house_seo_desc");
	      rbwNewsSeoDescStrC.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(branchCompany)){
	    	  rbwNewsSeoDescStrC.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "sjzrbw1";
				rbwNewsSeoDescStrC.andBranchCompanyEqualTo(branchCompany);
			}
	      SysConfig rbwHouseSeoDesc= null;
	      if(sysConfigMapper.selectByExample(rbwNewsSeoDescStrE).size()> 0){
	      	
	    	  rbwHouseSeoDesc = sysConfigMapper.selectByExample(rbwNewsSeoDescStrE).get(0);
	      }
	    model.addObject("rbwHouseSeoTitle", rbwHouseSeoTitle);
	    model.addObject("rbwHouseSeoKeyword", rbwHouseSeoKeyword);
	    model.addObject("rbwHouseSeoDesc", rbwHouseSeoDesc); 
		model.addObject("page", p);
		model.addObject("currentBCompany", branchCompany); 
		model.addObject("branchCompany", branchCompany); 
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
		// 获取当前的楼盘信息
		String branchCompany = (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany)){
			branchCompany = "sjzrbw1";
		}
		// 获取当前的楼盘信息
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
		com.rbw.www.model.HotBuildingExample.Criteria criteria = hotBuildingExample.createCriteria();
		// 非删除状态
		criteria.andStatusNotEqualTo(3);
		criteria.andBulidingThumbImgNotEqualTo("");
		criteria.andBranchCompanyEqualTo(branchCompany);
		// 排序	
		hotBuildingExample.setOrderByClause("create_time desc");
		List<HotBuilding> hotBuildingList = hotBuildingMapper.selectByExample(hotBuildingExample);
		model.addObject("hotBuildingList", hotBuildingList);
		model.addObject("currentHouse", currentHouse);
		model.addObject("branchCompany", branchCompany);
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
			@PathVariable("page") int page,HttpSession session,HttpServletResponse response,HttpServletRequest  request) {
		
		super.getHomeMessage(request, session);
		ModelAndView model = new ModelAndView();
//		获取当前的楼盘信息
		String branchCompany	= (String) session.getAttribute("branchCompany");
		int rows = 12;//每页显示12条数据
		if(page<=0){
			page = 1;
		}
		HotBuildingExample hotBuildingExample =new HotBuildingExample();
		com.rbw.www.model.HotBuildingExample.Criteria criteria = hotBuildingExample.createCriteria();
//		非删除状态
		criteria.andBulidingThumbImgNotEqualTo("");
		criteria.andStatusNotEqualTo(3);
//      获取分公司的信息
	    if(null != branchCompany && branchCompany.length()>0){
			
			criteria.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "sjzrbw1";
			criteria.andBranchCompanyEqualTo(branchCompany);
		}
		int totalNums = hotBuildingMapper.countByExample(hotBuildingExample);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		hotBuildingExample.setPage(p);
//		排序	
		hotBuildingExample.setOrderByClause("create_time desc");
		List<HotBuilding> hotBuildingList = hotBuildingMapper.selectByExample(hotBuildingExample);
		logger.info("热装楼盘的总条目为"+hotBuildingList.size());
		
		model.addObject("page", p);
		model.addObject("currentBCompany", branchCompany);
		model.addObject("branchCompany", branchCompany);
		model.addObject("hotBuildingList", hotBuildingList);
		model.addObject("totalNums",totalNums);
		model.setViewName("/www/hotBuiding");
		return model;
	}
	
	
	
}
