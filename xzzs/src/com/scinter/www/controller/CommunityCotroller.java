package com.scinter.www.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.scinter.base.baseController.BaseController;
import com.scinter.www.dao.CasesMapper;
import com.scinter.www.dao.CommunitysMapper;
import com.scinter.www.dao.NewsMapper;
import com.scinter.www.dao.OrderInfoMapper;
import com.scinter.www.model.Cases;
import com.scinter.www.model.CasesExample;
import com.scinter.www.model.Communitys;
import com.scinter.www.model.CommunitysExample;
import com.scinter.www.model.News;
import com.scinter.www.model.NewsExample;
import com.scinter.www.model.OrderInfoExample;
import com.scinter.www.model.CommunitysExample.Criteria;
import com.scinter.www.util.Page;


@Controller
public class CommunityCotroller extends BaseController{
	
	@Autowired
	private CommunitysMapper communityMapper;
	@Autowired
	private CasesMapper casesMapper;
	@Autowired
	private OrderInfoMapper orderInfoMapper;
	@Autowired
	private NewsMapper newsMapper;
	
	@RequestMapping(value = "community/p{page}")
	public ModelAndView community(@PathVariable("page") int page,@RequestParam(value="key",required=false)String key,HttpServletRequest request,HttpSession session){
		
		super.getPublicMes(session);
		ModelAndView model =  new ModelAndView();
		int rows = 4; 
		if(page<=0){
			page = 1;
		}
		String branchCompany =  (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany))
			branchCompany = "bjxz";
		CommunitysExample  communitysE = new CommunitysExample();
        Criteria communitysC = communitysE.createCriteria();
        communitysC.andCommunityImageNotEqualTo("");
        communitysC.andStatusEqualTo("是");
        communitysC.andBranchCompanyEqualTo(branchCompany);
        
	        if(StringUtils.isNotBlank(key)){
				
				try {
					String str = new String(key.getBytes("iso-8859-1"),"utf-8");
					str= "%"+str+"%";
					communitysC.andCommunityNameLike(key);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
	    communitysE.setOrderByClause("update_time desc");
        int totalNums = communityMapper.countByExample(communitysE);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		communitysE.setPage(p);;
		// 排序	
		communitysE.setOrderByClause("create_time desc");
        List<Communitys> communitys = communityMapper.selectByExample(communitysE);
		
       // 获取订单总数
 		OrderInfoExample oe = new OrderInfoExample();
 		com.scinter.www.model.OrderInfoExample.Criteria oc =  oe.createCriteria();
 		oc.andStatusEqualTo(1);
 		oc.andBranchCompanyEqualTo(branchCompany);
 		Integer orderNumber = orderInfoMapper.countByExample(oe);
 		
 		model.addObject("orderNumber", orderNumber);
        model.addObject("communitys",communitys);
        model.addObject("page", p);
        model.setViewName("www/department");
		return model;
	}
	
	@RequestMapping(value = "departmentDetail")
	public ModelAndView departmentDetail(String communityId,HttpServletRequest request,HttpSession session){
		
		super.getPublicMes(session);
		String branchCompany = (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany))
			branchCompany = "bjxz";
		
		ModelAndView model = new ModelAndView();
		Communitys community =  communityMapper.selectByPrimaryKey(Integer.parseInt(communityId));
		
		CasesExample ce = new CasesExample();
		com.scinter.www.model.CasesExample.Criteria cc = ce.createCriteria();
		cc.andCaseStatusEqualTo(1);
		cc.andBranchCompanyEqualTo(branchCompany);
		List<Cases> communityCases =  casesMapper.selectByExample(ce);
		
		// 获取订单总数
		OrderInfoExample oe = new OrderInfoExample();
		com.scinter.www.model.OrderInfoExample.Criteria oc =  oe.createCriteria();
		oc.andStatusEqualTo(1);
		oc.andBranchCompanyEqualTo(branchCompany);
		Integer orderNumber = orderInfoMapper.countByExample(oe);
		
		CommunitysExample communityE = new CommunitysExample();
		Criteria communityC =  communityE.createCriteria();
		communityC.andBranchCompanyEqualTo(branchCompany);
		communityC.andStatusEqualTo("是");
		communityE.setOrderByClause("create_time desc");
		List<Communitys> communitys = communityMapper.selectByExample(communityE);
		
		// 最新活动
		NewsExample  newsExample = new NewsExample();
		com.scinter.www.model.NewsExample.Criteria cn = newsExample.createCriteria();
		cn.andStatusEqualTo(8);
		cn.andBranchCompanyEqualTo(branchCompany);
		newsExample.setOrderByClause("update_time desc");
		List<News>  newsList = newsMapper.selectByExample(newsExample);
		News newsAct = null;
		if(newsList.size()>0)
			newsAct = newsList.get(0);
			
		model.addObject("newsAct",newsAct);
		model.addObject("newsList",newsList);
		model.addObject("communitys", communitys);
		model.addObject("orderNumber", orderNumber);
		model.addObject("communityCases", communityCases);
        model.addObject("community",community);
        model.setViewName("www/departmentDetail");
		return model;
	}

}
