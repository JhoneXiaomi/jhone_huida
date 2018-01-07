package com.scinter.www.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scinter.www.dao.CaseShowImageMapper;
import com.scinter.www.model.CaseShowImage;
import com.scinter.www.model.CaseShowImageExample;
import com.scinter.www.model.CaseShowImageExample.Criteria;
import com.scinter.www.service.ICaseShowImageService;

@Service
public class CaseShowImageServiceImpl implements ICaseShowImageService {

	@Autowired
	private CaseShowImageMapper caseImgMapper;
	
	@Override
	public List<CaseShowImage> queryCaseShowImagesByCaseId(int caseId) {

		CaseShowImageExample ex = new CaseShowImageExample();
		
		Criteria criteria = ex.createCriteria();
		criteria.andCaseIdEqualTo(caseId);
		criteria.andStatusEqualTo("1");
		ex.setOrderByClause("create_time asc");

		return caseImgMapper.selectByExample(ex);
	}

}
