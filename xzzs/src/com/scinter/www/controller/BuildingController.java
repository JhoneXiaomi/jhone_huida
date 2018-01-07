package com.scinter.www.controller;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.scinter.base.baseController.BaseController;
import com.scinter.www.dao.CasesMapper;
import com.scinter.www.dao.CommunitysMapper;
import com.scinter.www.dao.DesignerMapper;
import com.scinter.www.dao.HotBuildingSiteImageMapper;
import com.scinter.www.dao.HotBuildingSiteMapper;
import com.scinter.www.dao.OrderInfoMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.dao.SysLogMapper;
import com.scinter.www.model.Cases;
import com.scinter.www.model.CasesExample;
import com.scinter.www.model.Communitys;
import com.scinter.www.model.CommunitysExample;
import com.scinter.www.model.CommunitysExample.Criteria;
import com.scinter.www.model.Designer;
import com.scinter.www.model.DesignerExample;
import com.scinter.www.model.HotBuildingSite;
import com.scinter.www.model.HotBuildingSiteExample;
import com.scinter.www.model.HotBuildingSiteImage;
import com.scinter.www.model.HotBuildingSiteImageExample;
import com.scinter.www.model.OrderInfoExample;
import com.scinter.www.util.Page;

@Controller
public class BuildingController extends BaseController{

	@Autowired
	private SysLogMapper sysLogMapper;
	@Autowired
	private HotBuildingSiteMapper hotBuildingSiteMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	@Autowired
	private OrderInfoMapper orderInfoMapper;
	@Autowired
	private CommunitysMapper communitysMapper;
	@Autowired
	private HotBuildingSiteImageMapper hotBuildingSiteImageMapper;
	@Autowired
	private DesignerMapper designerMapper;
	@Autowired
	private CasesMapper casesMapper;
	
	
	@RequestMapping(value = "workBuilding/p{page}", method = RequestMethod.GET)
	public ModelAndView workBuilding(@PathVariable("page") int page,HttpSession session,HttpServletResponse response) {
		
		
		ModelAndView model = new ModelAndView();
		// 获取公共信息
		super.getPublicMes(session);
		// 获取当前的楼盘信息
		String branchCompany = (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany))
			branchCompany = "bjxz";
		int rows = 9;
		if(page<=0){
			page = 1;
		}
		
		HotBuildingSiteExample hse =new HotBuildingSiteExample();
		com.scinter.www.model.HotBuildingSiteExample.Criteria criteria = hse.createCriteria();
		criteria.andSiteThumbImgNotEqualTo("");
		criteria.andStatusEqualTo(1);
		criteria.andBranchCompanyEqualTo(branchCompany);
		int totalNums = hotBuildingSiteMapper.countByExample(hse);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		hse.setPage(p);
		hse.setOrderByClause("update_time desc");
		List<HotBuildingSite> buildings = hotBuildingSiteMapper.selectByExample(hse);
		List<HotBuildingSite> hotBuildingList = new ArrayList<HotBuildingSite>();
		
		for(HotBuildingSite building:buildings){
			
			HotBuildingSiteImageExample he =new HotBuildingSiteImageExample();
			com.scinter.www.model.HotBuildingSiteImageExample.Criteria hc = he.createCriteria();
			hc.andSiteIdEqualTo(building.getId());
			hc.andImageUrlNotEqualTo("");
			hc.andImageTypeNotEqualTo("5");
			hc.andImageTypeNotEqualTo("6");
			hc.andStatusEqualTo(1);
			building.setXimages(hotBuildingSiteImageMapper.countByExample(he));
			
			HotBuildingSiteImageExample hhe =new HotBuildingSiteImageExample();
			hhe.or().andStatusEqualTo(1).andSiteIdEqualTo(building.getId()).andImageUrlNotEqualTo("").andImageTypeEqualTo("5");
			hhe.or().andStatusEqualTo(1).andSiteIdEqualTo(building.getId()).andImageUrlNotEqualTo("").andImageTypeEqualTo("6");
			building.setFimages(hotBuildingSiteImageMapper.countByExample(hhe));
			hotBuildingList.add(building);
		}
		// 五星工地推荐
		HotBuildingSiteExample fhse =new HotBuildingSiteExample();
		com.scinter.www.model.HotBuildingSiteExample.Criteria fhsec = fhse.createCriteria();
		fhsec.andSiteThumbImgNotEqualTo("");
		fhsec.andStatusEqualTo(1);
		fhsec.andBranchCompanyEqualTo(branchCompany);
		fhsec.andSiteStatusEqualTo("6");
		fhse.setOrderByClause("update_time desc");
		List<HotBuildingSite> fhotBuildingList = hotBuildingSiteMapper.selectByExample(fhse);
		
		// 获取订单总数
		OrderInfoExample oe = new OrderInfoExample();
		com.scinter.www.model.OrderInfoExample.Criteria oc =  oe.createCriteria();
		oc.andStatusEqualTo(1);
		oc.andBranchCompanyEqualTo(branchCompany);
		Integer orderNumber = orderInfoMapper.countByExample(oe);
		
		// 热装小区
		CommunitysExample ce = new CommunitysExample();
		Criteria cc = ce.createCriteria();
		cc.andStatusEqualTo("是");
		cc.andBranchCompanyEqualTo(branchCompany);
		List<Communitys>  communitys = communitysMapper.selectByExample(ce);
		
		model.addObject("fhotBuildingList", fhotBuildingList);
		model.addObject("communitys", communitys);
		model.addObject("orderNumber", orderNumber);
		model.addObject("page", p);
		model.addObject("currentBCompany", branchCompany);
		model.addObject("hotBuildingList", hotBuildingList);
		model.addObject("totalNums",totalNums);
		model.setViewName("/www/workBuilding");
		return model;
	}
	
	/**
	 * 
	 * 在建工地
	 */
	@RequestMapping("workBuildingDetail")
	public ModelAndView workBuildingDetail(@RequestParam("siteId")String siteId,HttpSession session, HttpServletResponse response){
		
		// 获取公共信息
		super.getPublicMes(session);
		ModelAndView  model = new ModelAndView();
		String branchCompany	= (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany)){
			branchCompany = "bjxz";
		}
		// 获取当前点击的工地的信息
		HotBuildingSite CurrentSite = hotBuildingSiteMapper.selectByPrimaryKey(Integer.valueOf(siteId));
		
		// 获取工地的施工图
		HotBuildingSiteImageExample he =new HotBuildingSiteImageExample();
		com.scinter.www.model.HotBuildingSiteImageExample.Criteria hc = he.createCriteria();
		hc.andSiteIdEqualTo(Integer.valueOf(siteId));
		hc.andImageUrlNotEqualTo("");
		hc.andStatusEqualTo(1);
		hc.andImageTypeNotEqualTo("5");
		hc.andImageTypeNotEqualTo("6");
		he.setOrderByClause("create_time desc");
		List<HotBuildingSiteImage> ShowImageList = hotBuildingSiteImageMapper.selectByExample(he);
		List<HotBuildingSiteImage> showImages = new ArrayList<HotBuildingSiteImage>();
		for(HotBuildingSiteImage image:ShowImageList){
			if(image.getImageUrl() != ""){
				image.setImageUrl(image.getImageUrl().substring(0,27)+"_logo"+CurrentSite.getSiteThumbImg().substring(27,31));
			}
			showImages.add(image);
		}
		
		Integer buildingNum = showImages.size();
		
		// 获取工地的效果图
		HotBuildingSiteImageExample whe =new HotBuildingSiteImageExample();
		whe.or().andSiteIdEqualTo(Integer.valueOf(siteId)).andStatusEqualTo(1).andImageUrlNotEqualTo("").andImageTypeEqualTo("5");
		whe.or().andSiteIdEqualTo(Integer.valueOf(siteId)).andStatusEqualTo(1).andImageUrlNotEqualTo("").andImageTypeEqualTo("6");
		whe.setOrderByClause("create_time desc");
		List<HotBuildingSiteImage> wShowImageList = hotBuildingSiteImageMapper.selectByExample(whe);
		List<HotBuildingSiteImage> wshowImages = new ArrayList<HotBuildingSiteImage>();
		for(HotBuildingSiteImage image:wShowImageList){
			if(image.getImageUrl() != ""){
				image.setImageUrl(image.getImageUrl().substring(0,27)+"_logo"+CurrentSite.getSiteThumbImg().substring(27,31));
			}
			wshowImages.add(image);
		}
		
		Integer wbuildingNum = wshowImages.size();
		
		// 获取订单总数
		OrderInfoExample oe = new OrderInfoExample();
		com.scinter.www.model.OrderInfoExample.Criteria oc =  oe.createCriteria();
		oc.andStatusEqualTo(1);
		oc.andBranchCompanyEqualTo(branchCompany);
		Integer orderNumber = orderInfoMapper.countByExample(oe);
		
		Integer designerId = CurrentSite.getDesignerId();
		Designer designer =  designerMapper.selectByPrimaryKey(designerId);
		
		// 获取设计师的列表页
		DesignerExample  designerEx = new DesignerExample();
		com.scinter.www.model.DesignerExample.Criteria designerCriter =  designerEx.createCriteria();
		designerCriter.andBranchCompanyEqualTo(branchCompany);
		designerCriter.andStatusEqualTo(1);
		designerCriter.andDesignerPhotoImgNotEqualTo("");
		designerEx.setOrderByClause("update_time desc");
		List<Designer> designers = designerMapper.selectByExample(designerEx);
		
		// 推荐案例
		CasesExample  casesEx = new CasesExample();
		com.scinter.www.model.CasesExample.Criteria  casesC =  casesEx.createCriteria();
		casesC.andCaseThumbImgNotEqualTo("");
		casesC.andCaseStatusNotEqualTo(3);
		casesEx.setOrderByClause("update_time desc");
		List<Cases> listCases = casesMapper.selectByExample(casesEx); 
		
		model.addObject("listCases", listCases);
		model.addObject("designers", designers);
		model.addObject("wshowImages", wshowImages);
		model.addObject("wbuildingNum", wbuildingNum);
		model.addObject("designer", designer);
		model.addObject("buildingNum", buildingNum);
		model.addObject("orderNumber", orderNumber);
		model.addObject("CurrentSite", CurrentSite);
		model.addObject("showImages", showImages);
		model.setViewName("/www/workBuildingDetail");
		return model;
	}
	
	
}
