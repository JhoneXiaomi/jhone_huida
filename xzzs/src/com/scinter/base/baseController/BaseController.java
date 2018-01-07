package com.scinter.base.baseController;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.scinter.www.dao.CasesMapper;
import com.scinter.www.dao.CommentMapper;
import com.scinter.www.dao.DesignerMapper;
import com.scinter.www.dao.FaqMapper;
import com.scinter.www.dao.HotBuildingMapper;
import com.scinter.www.dao.NewsMapper;
import com.scinter.www.dao.OrderInfoMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.dao.SysLogMapper;
import com.scinter.www.model.Cases;
import com.scinter.www.model.CasesExample;
import com.scinter.www.model.SysConfig;
import com.scinter.www.model.SysConfigExample;
import com.scinter.www.model.SysConfigExample.Criteria;
@Controller
public class BaseController {

	private Logger logger = Logger.getLogger(BaseController.class);
	@Autowired
	private SysLogMapper sysLogMapper;
	@Autowired
	private CasesMapper caseMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	@Autowired
	private NewsMapper newsMapper;
	@Autowired
	private HotBuildingMapper hotBuildingMapper;
	@Autowired
	private CasesMapper casesMapper;
	@Autowired
	private DesignerMapper disignerMapper;
	@Autowired
	private FaqMapper faqMapper;
	@Autowired
	private CommentMapper commenMapper;
	@Autowired 
	private HotBuildingMapper hotbuildingMapper;
	@Autowired
	private OrderInfoMapper orderInfoMapper;
	public void getPublicMes(HttpSession session){  
		String myBranchCompany	= (String) session.getAttribute("branchCompany");
        ModelAndView model = new ModelAndView();  
        // 获取首页LOGO
    	SysConfigExample sysConfigExampleLogo = new SysConfigExample();
        Criteria csysLogo = sysConfigExampleLogo.createCriteria();
        csysLogo.andKeyNameEqualTo("scinter_home_logo");
        csysLogo.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(myBranchCompany) && myBranchCompany.length()>0){
        	csysLogo.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjxz";
			csysLogo.andBranchCompanyEqualTo(myBranchCompany);
		}
        SysConfig  homeLogo =  null;
        if(sysConfigMapper.selectByExample(sysConfigExampleLogo).size()>0){
        	
        	homeLogo= sysConfigMapper.selectByExample(sysConfigExampleLogo).get(0);
        }
        // 获取首页底部二维码图片
    	SysConfigExample sysConfigExampleTwoCodeImg = new SysConfigExample();
        Criteria csysTc = sysConfigExampleTwoCodeImg.createCriteria();
        csysTc.andKeyNameEqualTo("scinter_home_twoCodeImg");
        csysTc.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(myBranchCompany) && myBranchCompany.length()>0){
        	csysTc.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjxz";
			csysTc.andBranchCompanyEqualTo(myBranchCompany);
		}
        SysConfig homeTc = null;
        if(sysConfigMapper.selectByExample(sysConfigExampleTwoCodeImg).size()>0){
            homeTc= sysConfigMapper.selectByExample(sysConfigExampleTwoCodeImg).get(0);
        }
        // 获取首页底部友情链接
    	SysConfigExample sysConfigExampleFriendlyLink = new SysConfigExample();
        Criteria csysFlink = sysConfigExampleFriendlyLink.createCriteria();
        csysFlink.andKeyNameEqualTo("scinter_home_friendlyLink");
        csysFlink.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(myBranchCompany) && myBranchCompany.length()>0){
        	csysFlink.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjxz";
			csysFlink.andBranchCompanyEqualTo(myBranchCompany);
		}
        SysConfig homeLk = null;
        if( sysConfigMapper.selectByExample(sysConfigExampleFriendlyLink).size()>0){
        	
        	homeLk = sysConfigMapper.selectByExample(sysConfigExampleFriendlyLink).get(0);
        }
        
        // 获取公司地址
    	SysConfigExample sysConfigExampleAddress = new SysConfigExample();
        Criteria csysAddress= sysConfigExampleAddress.createCriteria();
        csysAddress.andKeyNameEqualTo("scinter_home_address");
        csysAddress.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(myBranchCompany) && myBranchCompany.length()>0){
        	csysAddress.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjxz";
			csysAddress.andBranchCompanyEqualTo(myBranchCompany);
		}
        SysConfig homeAdress =null;
        if(sysConfigMapper.selectByExample(sysConfigExampleAddress).size()>0){
        	 homeAdress = sysConfigMapper.selectByExample(sysConfigExampleAddress).get(0);
        }
      
        
        // 获取公司电话
    	SysConfigExample sysConfigExampleTelePhone = new SysConfigExample();
        Criteria csysTp= sysConfigExampleTelePhone.createCriteria();
        csysTp.andKeyNameEqualTo("scinter_home_telePhone");
        csysTp.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(myBranchCompany) && myBranchCompany.length()>0){
        	csysTp.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjxz";
			csysTp.andBranchCompanyEqualTo(myBranchCompany);
		}
        SysConfig homeTp = null;
        if(sysConfigMapper.selectByExample(sysConfigExampleTelePhone).size()>0){
        	homeTp = sysConfigMapper.selectByExample(sysConfigExampleTelePhone).get(0);
        }
       
        // 获取公司邮箱
    	SysConfigExample sysConfigExamplePost = new SysConfigExample();
        Criteria csysPt= sysConfigExamplePost.createCriteria();
        csysPt.andKeyNameEqualTo("scinter_home_postBox");
        csysPt.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(myBranchCompany) && myBranchCompany.length()>0){
        	csysPt.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjxz";
			csysPt.andBranchCompanyEqualTo(myBranchCompany);
		}
        SysConfig homePost = null;
        if(sysConfigMapper.selectByExample(sysConfigExamplePost).size()>0){
        	
        	  homePost = sysConfigMapper.selectByExample(sysConfigExamplePost).get(0);
        }
        // 获取公司传真
    	SysConfigExample sysConfigExamplePortraiture = new SysConfigExample();
        Criteria csysPort= sysConfigExamplePortraiture.createCriteria();
        csysPort.andKeyNameEqualTo("scinter_home_portraiture");
        csysPort.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(myBranchCompany) && myBranchCompany.length()>0){
        	csysPort.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjxz";
			csysPort.andBranchCompanyEqualTo(myBranchCompany);
		}
        
        SysConfig homePort = null;
        if(sysConfigMapper.selectByExample(sysConfigExamplePortraiture).size()>0){
        	 homePort= sysConfigMapper.selectByExample(sysConfigExamplePortraiture).get(0);
        }
        // 获取百度商桥的信息
    	SysConfigExample sysConfigExampleShangqiao = new SysConfigExample();
        Criteria csysSq= sysConfigExampleShangqiao.createCriteria();
        csysSq.andKeyNameEqualTo("scinter_home_shangQiao");
        csysSq.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(myBranchCompany) && myBranchCompany.length()>0){
        	csysSq.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjxz";
			csysSq.andBranchCompanyEqualTo(myBranchCompany);
		}
        SysConfig shangqiao= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleShangqiao).size()> 0){
        	
        	shangqiao = sysConfigMapper.selectByExample(sysConfigExampleShangqiao).get(0);
        }
//      获取百度统计的信息
    	SysConfigExample sysConfigExampleStatistics = new SysConfigExample();
        Criteria csystat= sysConfigExampleStatistics.createCriteria();
        csystat.andKeyNameEqualTo("scinter_home_statistics");
        csystat.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(myBranchCompany) && myBranchCompany.length()>0){
        	csystat.andBranchCompanyEqualTo(myBranchCompany);
  		}else{
  			myBranchCompany = "bjxz";
  			csystat.andBranchCompanyEqualTo(myBranchCompany);
  		}
        SysConfig statistics= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleStatistics).size()> 0){
        	
        	statistics = sysConfigMapper.selectByExample(sysConfigExampleStatistics).get(0);
        }
        /*获取SEO 的配置信息*/
        
        // SEO 标题信息
        SysConfigExample sysConfigExampleScinterHomeSeoTitle = new SysConfigExample();
        Criteria criteriaScinterHomeSeoTitle = sysConfigExampleScinterHomeSeoTitle.createCriteria();
        criteriaScinterHomeSeoTitle.andKeyNameEqualTo("scinter_home_seo_title");
        criteriaScinterHomeSeoTitle.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(myBranchCompany)){
      	  criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(myBranchCompany);
  		}else{
  			myBranchCompany = "bjxz";
  			criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(myBranchCompany);
  		}
        SysConfig statScinterHomeSeoTitle= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).size()> 0){
      	  statScinterHomeSeoTitle = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).get(0);
        }
        
        // SEO 关键字信息
        SysConfigExample sysConfigExampleScinterhomeSeoKeyword = new SysConfigExample();
        Criteria criteriaScinterhomeSeoKeyword = sysConfigExampleScinterhomeSeoKeyword.createCriteria();
        criteriaScinterhomeSeoKeyword.andKeyNameEqualTo("scinter_home_seo_keyword");
        criteriaScinterhomeSeoKeyword.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(myBranchCompany)){
      	  criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(myBranchCompany);
  		}else{
  			myBranchCompany = "bjxz";
  			criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(myBranchCompany);
  		}
        SysConfig statScinterhomeSeoKeyword= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).size()> 0){
        	
      	  statScinterhomeSeoKeyword = sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).get(0);
        }
        
        // SEO 描述信息
        SysConfigExample sysConfigExampleScinterHomeSeoDesc = new SysConfigExample();
        Criteria criteriaScinterHomeSeoDesc = sysConfigExampleScinterHomeSeoDesc.createCriteria();
        criteriaScinterHomeSeoDesc.andKeyNameEqualTo("scinter_home_seo_desc");
        criteriaScinterHomeSeoDesc.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(myBranchCompany)){
      	  criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(myBranchCompany);
  		}else{
  			myBranchCompany = "bjxz";
  			criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(myBranchCompany);
  		}
        SysConfig statScinterHomeSeoDesc= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).size()> 0){
        	
      	  statScinterHomeSeoDesc = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).get(0);
        }
        
        // 热门搜索
      /*  CasesExample ce = new CasesExample();
        com.scinter.www.model.CasesExample.Criteria cc = ce.createCriteria();
        cc.andBranchCompanyEqualTo(myBranchCompany);
        cc.andCaseStatusNotEqualTo(3);
        ce.setOrderByClause("case_read_num desc");
        List<Cases> listKey = casesMapper.selectByExample(ce);*/
        
        // 将信息保存到session中
        // session.setAttribute("listKey", listKey);
        session.setAttribute("statistics", statistics);
        session.setAttribute("shangqiao", shangqiao);
        session.setAttribute("homeLogo",homeLogo );
        session.setAttribute("homePost",homePost );
        session.setAttribute("homeAdress",homeAdress );
        session.setAttribute("homeLk",homeLk );
        session.setAttribute("homeTp",homeTp );
        session.setAttribute("homePort",homePort );
        session.setAttribute("homeTc",homeTc );
        session.setAttribute("statScinterHomeSeoTitle", statScinterHomeSeoTitle);
        session.setAttribute("statScinterhomeSeoKeyword", statScinterhomeSeoKeyword);
        session.setAttribute("statScinterHomeSeoDesc", statScinterHomeSeoDesc);
        session.setAttribute("branchCompany", myBranchCompany);
        session.setAttribute("companyCity", getCompany(myBranchCompany));
        
        
        // model.addObject("listKey", listKey);
        model.addObject("branchCompany", myBranchCompany);
        model.addObject("statScinterHomeSeoTitle", statScinterHomeSeoTitle);
        model.addObject("statScinterhomeSeoKeyword", statScinterhomeSeoKeyword);
        model.addObject("statScinterHomeSeoDesc", statScinterHomeSeoDesc);
        model.addObject("homePort", homePost);
        model.addObject("homePost", homePort);
        model.addObject("homeLogo", homeLogo);
        model.addObject("homeTc", homeTc); 
        model.addObject("homeLk", homeLk);
        model.addObject("homeTp", homeTp);
        model.addObject("homeAdress", homeAdress);
        model.addObject("shangqiao", shangqiao);
        model.addObject("statistics", statistics); 
    }
	
	
	public String getCompany(String myBranchCompany){
		String cityCompany="";
		if(myBranchCompany.equals("bjxz")){
			cityCompany="北京";
	    }
	    if(myBranchCompany.equals("tjxz")){
	    	cityCompany="天津";
	    }
	    if(myBranchCompany.equals("lfxz")){
	    	cityCompany="廊坊";
	    }
	    if(myBranchCompany.equals("sjzxz")){
	    	cityCompany="石家庄";
	    }
	    if(myBranchCompany.equals("tsxz")){
	    	cityCompany="唐山";
	    }
	    if(myBranchCompany.equals("bdxz")){
	    	cityCompany="保定";
	    }
	    if(myBranchCompany.equals("cqxz")){
	    	cityCompany="重庆";
	    }
	    if(myBranchCompany.equals("hfxz")){
	    	cityCompany="合肥";
	    }
	    if(myBranchCompany.equals("jnxz")){
	    	cityCompany="济南";
	    }
	    if(myBranchCompany.equals("tyxz")){
	    	cityCompany="太原";
	    }
	    if(myBranchCompany.equals("zzxz")){
	    	cityCompany="郑州";
	    }
	    if(myBranchCompany.equals("czxz")){
	    	cityCompany="沧州";
	    }
		return cityCompany;
	}
}
