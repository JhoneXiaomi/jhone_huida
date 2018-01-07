package com.scinter.mobile.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.scinter.www.dao.DesignerMapper;
import com.scinter.www.dao.HotBuildingSiteImageMapper;
import com.scinter.www.dao.HotBuildingSiteMapper;
import com.scinter.www.dao.HouseTypeReviewMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.dao.SysLogMapper;
import com.scinter.www.model.Designer;
import com.scinter.www.model.HotBuildingSite;
import com.scinter.www.model.HotBuildingSiteExample;
import com.scinter.www.model.HotBuildingSiteExample.Criteria;
import com.scinter.www.model.HotBuildingSiteImage;
import com.scinter.www.model.HotBuildingSiteImageExample;
import com.scinter.www.util.Page;

@Controller
public class MhotBuildingSiteController {

	
	@Autowired
	private HotBuildingSiteMapper hotBuildingSiteMapper;
	@Autowired
	private SysLogMapper sysLogMapper;
	@Autowired
	private DesignerMapper designerMapper;
	@Autowired 
	private HouseTypeReviewMapper houseTypeReviewMapper;
	@Autowired
	private HotBuildingSiteImageMapper hotBuildingSiteImageMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	
	/**
	 * 获取在手机站在建工地的信息
	 * @param page  				页码
	 * @param rows					页容量
	 * @param response				返回处理结果的响应的内容
	 */
	@RequestMapping("MlistHotBuildingSite/p{page}")
	public ModelAndView  MlistHotBuildingSite(@PathVariable("page") int page,HttpSession session,HttpServletResponse response) {

		ModelAndView model = new ModelAndView();
		String branchCompany = (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany))
			branchCompany = "bjxz";
		
		HotBuildingSiteExample hotBuildingSiteExample = new HotBuildingSiteExample();
		Criteria criteria = hotBuildingSiteExample.createCriteria();
		criteria.andStatusNotEqualTo(3);
		criteria.andBranchCompanyEqualTo(branchCompany);
		int totalNums = hotBuildingSiteMapper.countByExample(hotBuildingSiteExample);
		int rows = 20;
		if(page<=0){
			page = 1;
		}
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		hotBuildingSiteExample.setPage(p);
		hotBuildingSiteExample.setOrderByClause("create_time desc");
		List<HotBuildingSite> buildingList = hotBuildingSiteMapper.selectByExample(hotBuildingSiteExample);
		List<HotBuildingSite> buildingSiteList = new ArrayList<HotBuildingSite>();
		for(HotBuildingSite building:buildingList){
			
			Integer designerId =  building.getDesignerId();
			Designer designer = designerMapper.selectByPrimaryKey(designerId);
			String designerName = designer.getDesignerName();
			building.setDesignerName(designerName);
			buildingSiteList.add(building);
		}
		
		model.addObject("totalNums", totalNums);
		model.addObject("buildingSiteList",buildingSiteList);
		model.addObject("page", p);
		model.setViewName("/mobile/buildingSite");
        return model;
	}
	
    /**
     * 在建工地的详细信息的展示
     * @param siteId	     选中的在建工地的ID值
     * @param session     获取同一个回话中的信息
     * @param response	     返回响应值
     * @return
     */
	@RequestMapping("MshowBuildingSite")
	@ResponseBody
	public ModelAndView showHouse(@RequestParam("siteId") int siteId,HttpSession session,HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView();
		String branchCompany = (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany))
			branchCompany = "bjxz";
		
		HotBuildingSite buildingSite = hotBuildingSiteMapper.selectByPrimaryKey(siteId);
		Designer d = designerMapper.selectByPrimaryKey(buildingSite.getDesignerId());
		buildingSite.setDesignerName(d.getDesignerName());
			
		// 获取工地的效果图
		HotBuildingSiteImageExample whe =new HotBuildingSiteImageExample();
		com.scinter.www.model.HotBuildingSiteImageExample.Criteria whc = whe.createCriteria();
		whc.andSiteIdEqualTo(Integer.valueOf(siteId));
		whc.andImageUrlNotEqualTo("");
		whc.andStatusEqualTo(1);
		whe.setOrderByClause("create_time desc");
		List<HotBuildingSiteImage> wShowImageList = hotBuildingSiteImageMapper.selectByExample(whe);
		
		model.addObject("buildingSite",buildingSite);
		model.addObject("siteImageList",wShowImageList);
		model.setViewName("/mobile/buildingSiteDetail");
		return model;
	}
		
}
