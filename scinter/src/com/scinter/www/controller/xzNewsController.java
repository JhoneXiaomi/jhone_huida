package com.scinter.www.controller;

import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.scinter.www.dao.CasesMapper;
import com.scinter.www.dao.NewsMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.dao.SysLogMapper;
import com.scinter.www.model.News;
import com.scinter.www.model.NewsExample;
import com.scinter.www.model.Role;
import com.scinter.www.model.NewsExample.Criteria;
import com.scinter.www.model.SysLog;
import com.scinter.www.model.User;
import com.scinter.www.util.JsonPrintUtil;
import com.scinter.www.util.Page;
import com.scinter.www.util.SysLogUtil;
import com.scinter.www.util.TableName;

@Controller
@RequestMapping("admin")
public class xzNewsController extends BaseController {

	private Logger logger = Logger.getLogger(NewsController.class);
	
	@Autowired
	private NewsMapper newsMapper;
	@Autowired
	private CasesMapper caseMapper;
	@Autowired 
	private SysLogMapper sysLogMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	
	@RequestMapping("listXzNewsToJson")
	@ResponseBody
	// 页面参数：当前页 page 每页显示条数rows
	public void listNewsToJson(@RequestParam("page") int page,@RequestParam("rows") int rows,HttpSession session,HttpServletResponse response) {
		
		//分页条件查询
		NewsExample rx = new NewsExample();
		Criteria criteria = rx.createCriteria();
		criteria.andStatusEqualTo(7);
		Role currentRole= (Role)session.getAttribute("Role");
		String roleName = currentRole.getRoleName();
		if(!"超级管理员".equals(roleName)){
			String branchCompany = currentRole.getBranchCompany();
			criteria.andBranchCompanyEqualTo(branchCompany);//当前用户所属分公司
		}
		
		int totalNums = newsMapper.countByExample(rx);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		rx.setPage(p);
		rx.setOrderByClause("create_time desc");//排序
		List<News> caseList4Page = newsMapper.selectByExample(rx);
		
//		日志记录
		SysLog sysLog = new SysLog();
		sysLog =SysLogUtil.search(session, 0, TableName.news, "装修资讯列表信息");
		sysLogMapper.insert(sysLog);
		
		JsonPrintUtil.printGridData(response, caseList4Page, totalNums,"rows","total");
	}
	@RequestMapping("searchXzListNews")
	@ResponseBody
	// 页面参数：当前页 page 每页显示条数rows
	public void searchXzListNews(@RequestParam("page") int page,@RequestParam("rows") int rows,String BCompany,String keyWord,HttpSession session,HttpServletRequest request,HttpServletResponse response) {
		Role currentRole= (Role)session.getAttribute("Role");
		String branchCompany = currentRole.getBranchCompany();
		NewsExample ux = new NewsExample();
		NewsExample.Criteria criteria = ux.createCriteria();
		if(StringUtils.isNotBlank(keyWord) && !BCompany.equals("===请选择===")){
			keyWord = "%" + keyWord + "%";
			ux.or().andTitleLike(keyWord).andStatusEqualTo(7).andBranchCompanyEqualTo(BCompany);
			ux.or().andKeywordsLike(keyWord).andStatusEqualTo(7).andBranchCompanyEqualTo(BCompany);
			ux.or().andSourceLike(keyWord).andStatusEqualTo(7).andBranchCompanyEqualTo(BCompany);
			ux.or().andContentsLike(keyWord).andStatusEqualTo(7).andBranchCompanyEqualTo(BCompany);
		}else if(StringUtils.isNotBlank(keyWord) && BCompany.equals("===请选择===")){
			keyWord = "%" + keyWord + "%";
			int s = Integer.parseInt(BCompany);
			ux.or().andTitleLike(keyWord).andStatusEqualTo(s);
			ux.or().andKeywordsLike(keyWord).andStatusEqualTo(s);
			ux.or().andSourceLike(keyWord).andStatusEqualTo(s);
			ux.or().andContentsLike(keyWord).andStatusEqualTo(s);
		}else if(StringUtils.isBlank(keyWord) && !BCompany.equals("===请选择===")){
		 
		    criteria.andStatusEqualTo(7).andBranchCompanyEqualTo(BCompany);
		}else{
			String roleName = currentRole.getRoleName();
			if(!"超级管理员".equals(roleName)){
				criteria.andStatusEqualTo(7);//
				criteria.andBranchCompanyEqualTo(branchCompany);//当前用户所属分公司
			}else{
			
				criteria.andStatusEqualTo(7);// 
				
			}
			
		}

		int totalNums = newsMapper.countByExample(ux);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		ux.setPage(p);
		ux.setOrderByClause("create_time desc");//排序
		List<News> newsList4Page = newsMapper.selectByExample(ux);

//	       日志记录
		SysLog sysLog = new SysLog();
		sysLog =SysLogUtil.search(session,0, TableName.news, "装修资讯信息");
		sysLogMapper.insert(sysLog);
	
		JsonPrintUtil.printGridData(response, newsList4Page, totalNums,"rows","total");
	}
	
	@RequestMapping("showXzNews")
	public ModelAndView showNews(int newsId,HttpSession session){
		
		/*初始化SEO案例列表页的信息*/
		Role currentRole= (Role)session.getAttribute("Role");
		String branchCompany = currentRole.getBranchCompany();
		ModelAndView model = new ModelAndView();
		News news = newsMapper.selectByPrimaryKey(newsId);
//		日志记录
		SysLog sysLog = new SysLog();
		sysLog =SysLogUtil.search(session, news.getNewsId(), TableName.news, "装修资讯信息");
		sysLogMapper.insert(sysLog);
		
		model.addObject("newsInfo", news);
		model.setViewName("/admin/xzNewsSave");
		return model;
	}
	
	@RequestMapping("saveXzNews")
	@ResponseBody
	public void saveNews(News news,HttpServletResponse response,HttpServletRequest request,HttpSession session) {
		/*scinterNewsSeoTitleStr scinterNewsSeoKeywordStr scinterNewsSeoDescStr
		scinter_news_seoDesc_str scinter_news_seoKeyword_str scinter_news_seoTitle_str*/
		 /*保存新闻列表页的SEO信息*/
		Role currentRole= (Role)session.getAttribute("Role");
		String branchCompany = currentRole.getBranchCompany();  
		int num = 0;
		User currentLoginUser = (User)request.getSession().getAttribute("UserInfo");
		if(null==news.getNewsId()){
			news.setStatus(7);
			news.setCreateTime(new Date());
			news.setCreater(currentLoginUser.getUserName());
			news.setUpdateTime(new Date());
			num = newsMapper.insert(news);
			
//			日志记录
			SysLog sysLog = new SysLog();
			sysLog =SysLogUtil.add(session, news.getNewsId(), TableName.news, "装修资讯信息");
			sysLogMapper.insert(sysLog);
			
		}else{
			news.setUpdateTime(new Date());
			news.setUpdater(currentLoginUser.getUserName());
			
//			日志记录在装修资讯条目的编辑
			SysLog sysLog = new SysLog();
			sysLog =SysLogUtil.edit(session, news.getNewsId(), TableName.news, "装修资讯信息");
			sysLogMapper.insert(sysLog);
			
			num = newsMapper.updateByPrimaryKeySelective(news);//只更新传值的字段
		}
		if(num>0){
			logger.info("saveNews success!");
			JsonPrintUtil.printObjData(response, "ok");
		}
	}
	
	@RequestMapping("delXzNews")
	@ResponseBody
	public void delNews(String newsIds,HttpSession session,HttpServletResponse response) {
		User currentLoginUser = (User)session.getAttribute("UserInfo");
		if(!StringUtils.isBlank(newsIds)){
			String[] newsIdsArr = newsIds.split(",");
			for(int i=0;i<newsIdsArr.length;i++){
				int uId = Integer.parseInt(newsIdsArr[i]);
				News u = newsMapper.selectByPrimaryKey(uId);
				u.setStatus(3);//1正常  3已删除 
				u.setUpdateTime(new Date());
				u.setUpdater(currentLoginUser.getUserName());
				newsMapper.updateByPrimaryKeySelective(u);
				
//				日志记录
				SysLog sysLog = new SysLog();
				sysLog =SysLogUtil.delete(session, u.getNewsId(), TableName.news, "装修资讯信息");
				sysLogMapper.insert(sysLog);
			}
			JsonPrintUtil.printObjData(response, "ok");
		}else{
			JsonPrintUtil.printObjData(response, "fail");
		}
	}
}
