package com.rbw.mobile.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.rbw.www.dao.DesignerMapper;
import com.rbw.www.dao.HotBuildingSiteImageMapper;
import com.rbw.www.dao.HotBuildingSiteMapper;
import com.rbw.www.model.Designer;
import com.rbw.www.model.HotBuildingSite;
import com.rbw.www.model.HotBuildingSiteImage;
import com.rbw.www.model.HotBuildingSiteImageExample;
import com.rbw.www.model.HotBuildingSiteImageExample.Criteria;


/**
 * 
 * 在建工地逻辑处理类
 * 
 * */
@Controller
public class ConstructionSiteController {

	@Autowired
	HotBuildingSiteMapper hotBuildingSiteMapper;
	@Autowired
	HotBuildingSiteImageMapper hotBuildingSiteImageMapper;
	@Autowired
	private DesignerMapper designerMapper;
	
	@RequestMapping("workBuildingDetail")
	public ModelAndView workBuildingDetail(@RequestParam("siteId")Integer siteId,HttpSession session, HttpServletResponse response){
		
		ModelAndView model = new ModelAndView();
		
		HotBuildingSite buildingSite = hotBuildingSiteMapper.selectByPrimaryKey(siteId);
		Designer d = designerMapper.selectByPrimaryKey(buildingSite.getDesignerId());
		buildingSite.setDesignerName(d.getDesignerName());
			
		// 获取工地的效果图
		HotBuildingSiteImageExample whe =new HotBuildingSiteImageExample();
		Criteria whc = whe.createCriteria();
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
