package com.scinter.www.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scinter.www.dao.CasesMapper;
import com.scinter.www.dao.DesignerMapper;
import com.scinter.www.model.Cases;
import com.scinter.www.model.CasesExample;
import com.scinter.www.model.Designer;
import com.scinter.www.model.CasesExample.Criteria;
import com.scinter.www.service.CasesService;
import com.scinter.www.util.Page;

/**
 * 
 * 案例实现类
 * 
 * @author jhone
 *
 *         create Time 2017/10/11 10:31
 */
@Service
public class CasesServiceImpl implements CasesService {

	@Autowired
	private CasesMapper casesMapper;
	@Autowired
	private DesignerMapper designerMapper;
	@Autowired
	private IBaseServiceImpl iBaseService;
	
	
	@Override
	public List<Cases> queryCaseList(int pageCount, int rows, String controlledCompany,String branchCompany,int caseStatus, String roleName) {

		List<Cases> caseListNew = new ArrayList<Cases>();

		CasesExample rx = new CasesExample();
		Criteria criteria = rx.createCriteria();
		if (!"超级管理员".equals(roleName)) {
			criteria.andBranchCompanyEqualTo(branchCompany);
		} else {
			criteria.andBranchCompanyLike("%" + iBaseService.spileCompanyName(controlledCompany) + "%");
		}
		criteria.andCaseStatusEqualTo(caseStatus);
		Page page = new Page((pageCount - 1) * rows, rows);
		page.setTotalRecords(this.queryCaseCount(roleName,branchCompany,controlledCompany, iBaseService.spileCompanyName(controlledCompany), 1));
		rx.setPage(page);
		rx.setOrderByClause("create_time desc");// 排序

		List<Cases> caseList4Page = casesMapper.selectByExample(rx);

		for (Cases cs : caseList4Page) {
			Designer ds = designerMapper.selectByPrimaryKey(cs.getDesignerId());
			if (null != ds) {
				cs.setCaseDesigner(ds.getDesignerName());
				caseListNew.add(cs);
			}
		}

		return caseListNew;
	}

	@Override
	public int queryCaseCount(String roleName, String branchCompany,String controlledCompany,String spilCompany, int caseStatus) {

		CasesExample rx = new CasesExample();
		Criteria criteria = rx.createCriteria();
		if (!"超级管理员".equals(roleName)) {
			criteria.andBranchCompanyEqualTo(branchCompany);
		} else {
			criteria.andBranchCompanyLike("%" + iBaseService.spileCompanyName(controlledCompany) + "%");
		}

		criteria.andCaseStatusEqualTo(caseStatus);

		return casesMapper.countByExample(rx);
	}

	

}
