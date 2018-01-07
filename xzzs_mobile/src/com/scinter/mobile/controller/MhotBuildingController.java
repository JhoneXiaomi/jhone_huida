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

import com.scinter.mBase.controller.MbaseController;
import com.scinter.www.dao.HotBuildingMapper;
import com.scinter.www.dao.HouseTypeReviewMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.dao.SysLogMapper;
import com.scinter.www.model.HotBuilding;
import com.scinter.www.model.HotBuildingExample;
import com.scinter.www.model.HouseTypeReviewExample;
import com.scinter.www.model.HouseTypeReviewExample.Criteria;
import com.scinter.www.util.JsonPrintUtil;
import com.scinter.www.util.Page;


@Controller
public class MhotBuildingController extends MbaseController{

	private Logger logger = Logger.getLogger(MhotBuildingController.class);
	@Autowired
	private HotBuildingMapper hotBuildingMapper;
	@Autowired
	private SysLogMapper sysLogMapper;
	@Autowired 
	private HouseTypeReviewMapper houseTypeReviewMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	/**
	 * 获取手机站楼盘的信息
	 * @param page  				页码
	 * @param rows					页容量
	 * @param response				返回处理结果的响应的内容
	 */
	@RequestMapping("MlistHotBuilding")
	@ResponseBody
	// 页面参数：当前页 page 每页显示条数rows
	public void MlistHotBuilding(
			@RequestParam("page") int page,@RequestParam("rows") int rows,
			HttpSession session,HttpServletResponse response,HttpServletRequest request) {

		super.getPublicMes(request, session);
//		获取session 中的 BranchCompany
		String MyBranchCompany	= (String) session.getAttribute("branchCompany");
		if(MyBranchCompany ==""){
			MyBranchCompany= "bjsc";
		}
//		分页条件查询
		HotBuildingExample hotBuildingExample = new HotBuildingExample();
		com.scinter.www.model.HotBuildingExample.Criteria criteria = hotBuildingExample.createCriteria();
//		非删除状态
		criteria.andStatusNotEqualTo(3);
//		分公司查询
	    if(null != MyBranchCompany && MyBranchCompany.length()>0){
			criteria.andBranchCompanyEqualTo(MyBranchCompany);
		}else{
			criteria.andBranchCompanyEqualTo(MyBranchCompany);
		}
		int totalNums = hotBuildingMapper.countByExample(hotBuildingExample);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		hotBuildingExample.setPage(p);
		hotBuildingExample.setOrderByClause("create_time desc");//排序
		List<HotBuilding> buildingList4Page = hotBuildingMapper.selectByExample(hotBuildingExample);
		List<HotBuilding> houseList = new ArrayList<HotBuilding>();
		for(HotBuilding building:buildingList4Page){
			
//			获取对应的BulidingId 下的搜有的户型,为的是
			HouseTypeReviewExample houseTypeReviewExample = new HouseTypeReviewExample();
			Criteria criteria2 = houseTypeReviewExample.createCriteria();
//			查询状态非删除状态的户型
			
			criteria2.andBulidingIdEqualTo(building.getBulidingId());
			criteria2.andStatusNotEqualTo(3);
		    building.setHouseTypeNum(houseTypeReviewMapper.countByExample(houseTypeReviewExample));
		    houseList.add(building);
		  
		}
//      将信息保存到session中
		session.setAttribute("branchCompany", MyBranchCompany);
		JsonPrintUtil.printGridData(response, houseList, totalNums,"rows","total");
	}
	
	/**
	 * 展示楼盘的详细信息
	 * @param bulidingId			点击获取的楼盘的额 ID值
	 * @param session		        session作用域，目的是获取获取作用域中的用户的信息
	 * @param response              返回处理结果的响应的内容
	 * @return
	 */
	@RequestMapping("MhouseDetail")
	@ResponseBody
	public ModelAndView showHouse(
			@RequestParam("buildingId") Integer buildingId,HttpSession session,
			HttpServletResponse response,HttpServletRequest request) {
		
		/*获取共有信息*/
		super.getPublicMes(request, session);
		ModelAndView model = new ModelAndView();
		// 获取session 中的 BranchCompany
		String MyBranchCompany	= (String) session.getAttribute("branchCompany");
		HotBuilding building = hotBuildingMapper.selectByPrimaryKey(buildingId);
		session.setAttribute("branchCompany", MyBranchCompany);
		model.addObject("buliding",building);
		model.setViewName("/mobile/houseDetail");
		return model;
	}
	
}
