package com.scinter.sczs.service;

import java.util.List;

import com.scinter.www.model.TbMobileActivityDto;

public interface IMScActivityService {

	/**
	 * 
	 * 查询三创手机活动列表信息
	 * 
	 * @param branchCompany 所属公司
	 * @param page 页码
	 * @param row 页容量
	 * @param status 状态
	 * @return 
	 */
	public List<TbMobileActivityDto> queryMobileActivities(String branchCompany,int page,int row,int status);
	
	
	public int countMobileActivities(String branchCompany,int status);
	
	public void addMobileActivity(TbMobileActivityDto tbMobileActivityDto);
	
	public void updateMobileActivity(TbMobileActivityDto tbMobileActivityDto);
	
	public TbMobileActivityDto queryMobileActivityById(String id);
	
	public void updateMobileActivityByIds(String ids,String userId);
}
