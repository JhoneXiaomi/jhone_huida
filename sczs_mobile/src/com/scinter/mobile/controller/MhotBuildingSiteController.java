package com.scinter.mobile.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mBase.controller.MbaseController;
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
import com.scinter.www.util.JsonPrintUtil;
import com.scinter.www.util.Page;

@Controller
public class MhotBuildingSiteController extends MbaseController{

	private Logger logger = Logger.getLogger(MhotBuildingSiteController.class);
	
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
	@RequestMapping("MlistHotBuildingSite")
	@ResponseBody
	public void MlistHotBuildingSite(
			@RequestParam("page") int page,@RequestParam("rows") int rows,
			HttpSession session,HttpServletResponse response,HttpServletRequest request) {

		
		/*获取共有的信息*/
		super.getHomeMessage(request, session);
//		获取session 中的 BranchCompany
		String MyBranchCompany	= (String) session.getAttribute("branchCompany");
//		分页条件查询
		HotBuildingSiteExample hotBuildingSiteExample = new HotBuildingSiteExample();
		Criteria criteria = hotBuildingSiteExample.createCriteria();
//		非删除状态
		criteria.andStatusNotEqualTo(3);
//		分公司查询
	    if(null != MyBranchCompany && MyBranchCompany.length()>0){
			criteria.andBranchCompanyEqualTo(MyBranchCompany);
		}else{
			MyBranchCompany = "bjsc";
			criteria.andBranchCompanyEqualTo(MyBranchCompany);
		}
		int totalNums = hotBuildingSiteMapper.countByExample(hotBuildingSiteExample);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		hotBuildingSiteExample.setPage(p);
//		排序
		hotBuildingSiteExample.setOrderByClause("create_time desc");
		List<HotBuildingSite> siteList4Page = hotBuildingSiteMapper.selectByExample(hotBuildingSiteExample);
		List<HotBuildingSite>  sites = new ArrayList<HotBuildingSite>() ;
//		添加设计师的信息
		for(HotBuildingSite site:siteList4Page){
			Designer designer = designerMapper.selectByPrimaryKey(site.getDesignerId());
			site.setDesignerName(designer.getDesignerName());
			sites.add(site);
		}
		JsonPrintUtil.printGridData(response, sites, totalNums,"rows","total");
	}
	
    /**
     * 在建工地的详细信息的展示
     * @param siteId	     选中的在建工地的ID值
     * @param session     获取同一个回话中的信息
     * @param response	     返回响应值
     * @return
     */
	@RequestMapping("showHouseSite")
	@ResponseBody
	public ModelAndView showHouse(
			@RequestParam("siteId") int siteId,HttpSession session,
			HttpServletResponse response,HttpServletRequest request) {
		
		/*获取共有的信息*/
		super.getHomeMessage(request, session);
		ModelAndView model = new ModelAndView();
//		获取session 中的 BranchCompany
		String MyBranchCompany	= (String) session.getAttribute("branchCompany");
		List<HotBuildingSite> bulidingList = new ArrayList<HotBuildingSite>();
		HotBuildingSite buildingSiteLogo = hotBuildingSiteMapper.selectByPrimaryKey(siteId);
//		获取本在建工地的设计师的信息
		Designer designer = designerMapper.selectByPrimaryKey(buildingSiteLogo.getDesignerId());
//		获取水印图片
		String str = buildingSiteLogo.getSiteThumbImg().substring(0, 27)+"_logo"+buildingSiteLogo.getSiteThumbImg().substring(27,31);
//		logger.info(str);
		buildingSiteLogo.setSiteThumbImg(str);
		
//		查询点击的在建工地的装修的状况
		HotBuildingSiteImageExample hotBuildingSiteImageExample = new HotBuildingSiteImageExample();
		com.scinter.www.model.HotBuildingSiteImageExample.Criteria criteriaSite = hotBuildingSiteImageExample.createCriteria();
		criteriaSite.andStatusNotEqualTo(3);
		criteriaSite.andSiteIdEqualTo(siteId);
//		排序
		hotBuildingSiteImageExample.setOrderByClause("create_time asc");
		List<HotBuildingSiteImage> siteImageList= hotBuildingSiteImageMapper.selectByExample(hotBuildingSiteImageExample);
//	          继续查询4个在建的工地的信息
		HotBuildingSiteExample hotBuildingSiteExample = new HotBuildingSiteExample();
		Criteria criteria = hotBuildingSiteExample.createCriteria();
//		非删除状态
		criteria.andStatusNotEqualTo(3);
		int totalNums = hotBuildingSiteMapper.countByExample(hotBuildingSiteExample);
		Page p = new Page(1 , 4);
		p.setTotalRecords(totalNums);
		hotBuildingSiteExample.setPage(p);
//		排序
		hotBuildingSiteExample.setOrderByClause("create_time desc");
		List<HotBuildingSite> hotBuildingList4Page = hotBuildingSiteMapper.selectByExample(hotBuildingSiteExample);
		for(HotBuildingSite site:hotBuildingList4Page){

			bulidingList.add(site);
		}	
		model.addObject("buildingSiteLogo",buildingSiteLogo);
		model.addObject("bulidingList",bulidingList);
		model.addObject("siteImageList",siteImageList);
		model.addObject("designer",designer);
		model.setViewName("/m/2301/m.wtzs.cc/2301");
		return model;
	}
		
}
