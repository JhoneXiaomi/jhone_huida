package com.scinter.www.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.scinter.base.baseController.BaseController;
import com.scinter.www.dao.DesignerMapper;
import com.scinter.www.dao.HomeTurnImgMapper;
import com.scinter.www.dao.IntegratedPackageMapper;
import com.scinter.www.dao.NewsMapper;
import com.scinter.www.dao.OrderInfoMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.model.Designer;
import com.scinter.www.model.DesignerExample;
import com.scinter.www.model.HomeTurnImg;
import com.scinter.www.model.HomeTurnImgExample;
import com.scinter.www.model.IntegratedPackage;
import com.scinter.www.model.IntegratedPackageExample;
import com.scinter.www.model.News;
import com.scinter.www.model.NewsExample;
import com.scinter.www.model.OrderInfoExample;
import com.scinter.www.model.SysConfig;
import com.scinter.www.model.SysConfigExample;
import com.scinter.www.model.DesignerExample.Criteria;

@Controller
public class OldPackageController extends BaseController{

	
	private Logger logger = Logger.getLogger(OldPackageController.class);
	
	@Autowired
	private DesignerMapper designerMapper;
	@Autowired
	private OrderInfoMapper orderInfoMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	@Autowired
	private HomeTurnImgMapper homeTurnImgMapper ;
	@Autowired
	private IntegratedPackageMapper integratedPackageMapper;
	@Autowired
	private NewsMapper newsMapper;
	
	@RequestMapping("IntegratedPackageOld")
	public ModelAndView IntegratedPackageOld(HttpSession session){
		
		
		// 获取公共信息
		super.getPublicMes(session);
		
	    ModelAndView model = new ModelAndView();
	    
	    String branchCompany = (String) session.getAttribute("branchCompany");
	    if(StringUtils.isBlank(branchCompany))
	    	branchCompany = "bjxz";
	    DesignerExample designerExample = new DesignerExample();
		Criteria criDesigner = designerExample.createCriteria();
		// 过滤掉图片为空的设计师
		criDesigner.andDesignerPhotoImgNotEqualTo("");
		criDesigner.andStatusEqualTo(1);
	    criDesigner.andBranchCompanyEqualTo(branchCompany);
		designerExample.setOrderByClause("update_time desc");
		List<Designer> designerList = designerMapper.selectByExample(designerExample);
		
		// 获取订单总数
		
		OrderInfoExample oe = new OrderInfoExample();
		com.scinter.www.model.OrderInfoExample.Criteria oc =  oe.createCriteria();
		oc.andStatusEqualTo(1);
		oc.andBranchCompanyEqualTo(branchCompany);
		Integer orderNumber = orderInfoMapper.countByExample(oe);
		

		// 获取首页合作品牌图片展示
    	SysConfigExample sysConfigExampleCoworker = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria csysCok = sysConfigExampleCoworker.createCriteria();
        csysCok.andKeyNameEqualTo("scinter_home_coworkerImg");
        csysCok.andValueNotEqualTo("");
		csysCok.andBranchCompanyEqualTo(branchCompany);
        List<SysConfig> homeCok = sysConfigMapper.selectByExample(sysConfigExampleCoworker);
        
        // 获取首页焦点图
  		HomeTurnImgExample hhe = new HomeTurnImgExample();
  		com.scinter.www.model.HomeTurnImgExample.Criteria homeTurnc = hhe.createCriteria();
  		homeTurnc.andStateEqualTo(0);
  		homeTurnc.andHomeimgSrcNotEqualTo("");
  		homeTurnc.andBranchCompanyEqualTo(branchCompany);
        hhe.setOrderByClause("update_time desc");
  		List<HomeTurnImg> homeTurn = homeTurnImgMapper.selectByExample(hhe);
      	
  		
  		// 获取空间配置图
  		IntegratedPackageExample ie = new IntegratedPackageExample();
  		com.scinter.www.model.IntegratedPackageExample.Criteria ic =  ie.createCriteria();
  		ic.andIntegratedPackageImageNotEqualTo("");
  		ic.andBranchCompanyEqualTo(branchCompany);
  		ic.andIntegratedPackageStatusEqualTo(true);
  		List<IntegratedPackage>  listPackage =  integratedPackageMapper.selectByExample(ie);
  		
  	   
        // 装修活动
        NewsExample ace = new NewsExample();
        com.scinter.www.model.NewsExample.Criteria acc = ace.createCriteria();
        acc.andStatusEqualTo(8);
        acc.andBranchCompanyEqualTo(branchCompany);
        List<News> activitys = newsMapper.selectByExample(ace);
        
        model.addObject("activitys", activitys);
  		model.addObject("listPackage", listPackage);
  	    model.addObject("homeTurn", homeTurn);	
        model.addObject("homeCok", homeCok);
		model.addObject("orderNumber", orderNumber);
		model.addObject("designerList", designerList);
		model.setViewName("/www/Integrated_package_old");
	    return model;
	}
}
