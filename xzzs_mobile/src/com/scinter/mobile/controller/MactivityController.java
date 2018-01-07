package com.scinter.mobile.controller;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import com.scinter.mBase.controller.MbaseController;
import com.scinter.www.dao.CasesMapper;
import com.scinter.www.dao.NewsMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.dao.SysLogMapper;
import com.scinter.www.model.Cases;
import com.scinter.www.model.CasesExample;
import com.scinter.www.model.News;
import com.scinter.www.model.NewsExample;
import com.scinter.www.model.SysConfigExample;
import com.scinter.www.model.NewsExample.Criteria;
import com.scinter.www.util.JsonPrintUtil;
import com.scinter.www.util.Page;

@Controller
public class MactivityController extends MbaseController{

	@Autowired
	private SysLogMapper sysLogMapper;
	@Autowired
	private NewsMapper newsMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	@Autowired
	private CasesMapper caseMapper;
	@Autowired  
    private Producer captchaProducer = null;
	@RequestMapping(value = "Mspec/p{page}")
	public ModelAndView Mspec(
			@PathVariable("page") int page,
			HttpServletResponse response,HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException {
		
		super.getPublicMes(request, session);
		ModelAndView model = new ModelAndView();
		String branchCompany	= (String) session.getAttribute("branchCompany");
		NewsExample newsExample =new NewsExample();
		Criteria criteria = newsExample.createCriteria();
		// 分页的基本信息
		int rows = 20;
		if(page<=0){
			page = 1;
		}
		// 过滤说装修展示图片为空的新闻展示
		criteria.andThumbImgNotEqualTo("");
		// 非删除状态的活动的信息
		criteria.andStatusEqualTo(8);
		// 获取分公司的信息
	    if(null != branchCompany && branchCompany.length()>0){
			
			criteria.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjxz";
			criteria.andBranchCompanyEqualTo(branchCompany);
		}
	    int totalNums =newsMapper.countByExample(newsExample);
	    Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		newsExample.setPage(p);
//		排序	
		newsExample.setOrderByClause("create_time desc");
		List<News> newsList = newsMapper.selectByExample(newsExample);
		
        model.addObject("page", p);
		model.addObject("currentBCompany", branchCompany);
		model.addObject("newsList", newsList);
		model.setViewName("/mobile/activity");
		return model;
	}
	
	@RequestMapping("MactivityDetail")
	public ModelAndView MspecDetail(
			@RequestParam("newsId") Integer newsId,
			HttpServletResponse response,HttpSession session,HttpServletRequest request) {
		
		super.getPublicMes(request, session);
		ModelAndView model = new ModelAndView();
		String branchCompany = (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany))
			branchCompany = "bjxz";
		News news =  newsMapper.selectByPrimaryKey(newsId);
		
		String str = news.getContents();
		Document doc = null;
		if(StringUtils.isNotBlank(str)){
			
			doc = Jsoup.parse(str);
			str = doc.text();
		}
		if(StringUtils.isNotBlank(str)){
			
			model.setViewName("/mobile/activityDetailtwo");
		}else{
			model.setViewName("/mobile/activityDetail");
		}
		
		model.addObject("news", news);
		return model;
		
	}
	
	
	
	//张紫薇后续添加的方法
	
	
	//二维码
	@RequestMapping("getKaptchaImage")
    public ModelAndView getKaptchaImage(HttpServletRequest request, HttpServletResponse response) {  
		HttpSession session = request.getSession();
		response.setDateHeader("Expires", 0);
		// Set standard HTTP/1.1 no-cache headers.
		response.setHeader("Cache-Control","no-store, no-cache, must-revalidate");
		// Set IE extended HTTP/1.1 no-cache headers (use addHeader).
		response.addHeader("Cache-Control", "post-check=0, pre-check=0");
		// Set standard HTTP/1.0 no-cache header.
		response.setHeader("Pragma", "no-cache");
		// return a jpeg
		response.setContentType("image/jpeg");
		// create the text for the image
		String capText = captchaProducer.createText();
		// store the text in the session
		session.setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);
		// create the image with the text
		BufferedImage bi = captchaProducer.createImage(capText);
		try {
			ServletOutputStream out = response.getOutputStream();
			ImageIO.write(bi, "jpg", out);
			out.flush();
			out.close();
		} catch (IOException e) {
			
		}
		return null;
    }
	
	//验证码是否显示
	@RequestMapping("showKaptchaImageOrNot")
	@ResponseBody
	public void showKaptchaImageOrNot(HttpServletResponse response,HttpSession session) {
		String login_captcha = (String)getValueByKeyName("login_captcha");
		String scinter_login_bg = (String)getValueByKeyName("scinter_login_bg");
		try {
			session.setAttribute("scinter_login_bg", scinter_login_bg);
		} catch (Exception e) {
		}
		Map<String,String> map = new HashMap<String,String>();
		map.put("bg_url", scinter_login_bg);
		map.put("login_captcha", login_captcha);
		
		JsonPrintUtil.printObjData(response, map);
	}
	
	private Object getValueByKeyName(String keyName) {
		SysConfigExample cx = new SysConfigExample();
		SysConfigExample.Criteria criteria = cx.createCriteria();
		criteria.andKeyNameEqualTo(keyName);
		Object oValue = sysConfigMapper.selectByExample(cx).get(0).getValue();
		return oValue;
	}
	
	//验证码是否显示
	@RequestMapping("getKaptchaCode")
	@ResponseBody
	public void getKaptchaCode(HttpServletResponse response,HttpSession session) {
		
		String code = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);		
		JsonPrintUtil.printObjData(response, code);
	}
	
	
	
		/***
		 * 进入腾讯新闻页面
		 * @return
		 * sourceType 网站来源(腾讯新闻)
		 */
		@RequestMapping("activity/txxinwen")
		public ModelAndView MactivityTcxw(HttpServletResponse response,HttpSession session,String sourceType){
			// 获取公共信息
			ModelAndView model = new ModelAndView();
			String branchCompany	= (String) session.getAttribute("branchCompany");
			//进入腾讯新闻
			// 腾讯新闻装修案例展示
	        CasesExample casesExample = new CasesExample();
	        com.scinter.www.model.CasesExample.Criteria criteriaCas = casesExample.createCriteria();
	        criteriaCas.andCaseThumbImgNotEqualTo("");
	        criteriaCas.andCaseStatusNotEqualTo(3);
		    if(null != branchCompany && branchCompany.length()>0){
		    	criteriaCas.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjxz";
				criteriaCas.andBranchCompanyEqualTo(branchCompany);
			}
	        casesExample.setOrderByClause("case_id desc");
	        List<Cases> CasesLists = caseMapper.selectByExample(casesExample);
			model.addObject("casesList", CasesLists);
			model.setViewName("/mobile/txxw");
			
			  return model;
			    	
		}
		
		/***
		 * 进入快报app
		 * @return
		 * sourceType 网站来源(快报app)
		 */
		@RequestMapping("activity/kuaibao")
		public ModelAndView MactivitykuaiBao(HttpServletResponse response,HttpSession session,String sourceType){
			// 获取公共信息
			ModelAndView model = new ModelAndView();
			String branchCompany	= (String) session.getAttribute("branchCompany");
			//进入腾讯新闻
			// 腾讯新闻装修案例展示
	        CasesExample casesExample = new CasesExample();
	        com.scinter.www.model.CasesExample.Criteria criteriaCas = casesExample.createCriteria();
	        criteriaCas.andCaseThumbImgNotEqualTo("");
	        criteriaCas.andCaseStatusNotEqualTo(3);
		    if(null != branchCompany && branchCompany.length()>0){
		    	criteriaCas.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjxz";
				criteriaCas.andBranchCompanyEqualTo(branchCompany);
			}
	        casesExample.setOrderByClause("case_id desc");
	        List<Cases> CasesLists = caseMapper.selectByExample(casesExample);
			model.addObject("casesList", CasesLists);
			model.setViewName("/mobile/kuaibao");
			
			  return model;
			    	
		}
		
		
		/***
		 * 进入快报app
		 * @return
		 * sourceType 网站来源(快报app)
		 */
		@RequestMapping("activity/toutiao")
		public ModelAndView MactivityToutiao(HttpServletResponse response,HttpSession session,String sourceType){
			// 获取公共信息
			ModelAndView model = new ModelAndView();
			String branchCompany	= (String) session.getAttribute("branchCompany");
			//进入腾讯新闻
			// 腾讯新闻装修案例展示
	        CasesExample casesExample = new CasesExample();
	        com.scinter.www.model.CasesExample.Criteria criteriaCas = casesExample.createCriteria();
	        criteriaCas.andCaseThumbImgNotEqualTo("");
	        criteriaCas.andCaseStatusNotEqualTo(3);
		    if(null != branchCompany && branchCompany.length()>0){
		    	criteriaCas.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjxz";
				criteriaCas.andBranchCompanyEqualTo(branchCompany);
			}
	        casesExample.setOrderByClause("case_id desc");
	        List<Cases> CasesLists = caseMapper.selectByExample(casesExample);
			model.addObject("casesList", CasesLists);
			model.setViewName("/mobile/toutiao");
			
			  return model;
			    	
		}
		
		/***
		 * 进入五一腾讯新闻
		 * @return
		 */
		@RequestMapping("activity/txxinwen02")
		public ModelAndView txxinwen02(HttpServletResponse response,HttpSession session,String sourceType){
			// 获取公共信息
			ModelAndView model = new ModelAndView();
			String branchCompany	= (String) session.getAttribute("branchCompany");
			//进入腾讯新闻
			// 腾讯新闻装修案例展示
	        CasesExample casesExample = new CasesExample();
	        com.scinter.www.model.CasesExample.Criteria criteriaCas = casesExample.createCriteria();
	        criteriaCas.andCaseThumbImgNotEqualTo("");
	        criteriaCas.andCaseStatusNotEqualTo(3);
		    if(null != branchCompany && branchCompany.length()>0){
		    	criteriaCas.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjxz";
				criteriaCas.andBranchCompanyEqualTo(branchCompany);
			}
	        casesExample.setOrderByClause("case_id desc");
	        List<Cases> CasesLists = caseMapper.selectByExample(casesExample);
			model.addObject("casesList", CasesLists);
			model.setViewName("/mobile/txxw51");
			
			  return model;
			    	
		}
		
		/***
		 * 进入五一今日头条
		 * @return
		 * sourceType 网站来源(快报app)
		 */
		@RequestMapping("activity/toutiao02")
		public ModelAndView toutiao02(HttpServletResponse response,HttpSession session,String sourceType){
			// 获取公共信息
			ModelAndView model = new ModelAndView();
			String branchCompany	= (String) session.getAttribute("branchCompany");
			//进入腾讯新闻
			// 腾讯新闻装修案例展示
	        CasesExample casesExample = new CasesExample();
	        com.scinter.www.model.CasesExample.Criteria criteriaCas = casesExample.createCriteria();
	        criteriaCas.andCaseThumbImgNotEqualTo("");
	        criteriaCas.andCaseStatusNotEqualTo(3);
		    if(null != branchCompany && branchCompany.length()>0){
		    	criteriaCas.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjxz";
				criteriaCas.andBranchCompanyEqualTo(branchCompany);
			}
	        casesExample.setOrderByClause("case_id desc");
	        List<Cases> CasesLists = caseMapper.selectByExample(casesExample);
			model.addObject("casesList", CasesLists);
			model.setViewName("/mobile/jrtt51");
			
			  return model;
			    	
		}
		@RequestMapping("activity/txxw")
		public ModelAndView toutiaoAll(@RequestParam(value="source",required=false)String source,
				HttpServletRequest request,HttpSession session){
			// 获取公共信息
			ModelAndView model = new ModelAndView();
			if(source.lastIndexOf("/")==-1){
				model.setViewName("/mobile/txxw_"+source);
			}else{
				model.setViewName("/mobile/txxw_"+source.substring(0, source.lastIndexOf("/")));
			}
			  return model;
			    	
		}
		@RequestMapping("activity/jrtt")
		public ModelAndView jinRiTouTiaoAll(@RequestParam(value="source",required=false)String source,
				HttpServletRequest request,HttpSession session){
			// 获取公共信息
			ModelAndView model = new ModelAndView();
			if(source.lastIndexOf("/")==-1){
				model.setViewName("/mobile/jrtt_"+source);
			}else{
				model.setViewName("/mobile/jrtt_"+source.substring(0, source.lastIndexOf("/")));
			}
			  return model;
			    	
		}
}
