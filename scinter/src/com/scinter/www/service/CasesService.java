package com.scinter.www.service;

import java.util.List;

import com.scinter.www.model.Cases;

/**
 * 
 * 案例服务类接口
 * 
 * @author jhone
 * 
 * create time 2017/10/11 11:07
 *
 */
public interface CasesService {
	
	
	/**
	 * 
	 * 获取案例列表信息
	 * 
	 * @param pageCount 页码
	 * @param rows 页容量
	 * @param branchCompany 隶属分公司
	 * @param caseStatus  案例状态
	 * @param roleName 角色名称
	 * 
	 * @return 案例列表信息
	 */
	public List<Cases> queryCaseList(int pageCount,int rows,String controlledCompany,String branchCompany,int caseStatus,String roleName);
	
	/**
	 * 
	 * 根据角色名称公司名称及案例状态获取案例数量
	 * 
	 * @param roleName 角色名称
	 * @param branchCompany 公司名称
	 * @param spilCompany 公司简称
	 * @param caseStatus 案例状态
	 * @return 案例数量
	 */
	public int queryCaseCount(String roleName,String branchCompany,String controlledCompany,String spilCompany,int caseStatus);
	
}
