package com.scinter.www.service;

import java.util.List;


import com.scinter.www.model.CaseShowImage;


public interface ICaseShowImageService {

	/**
	 * 
	 * 根据案例id获取案例图片的集合
	 * 
	 * @param caseId 案例id
	 * 
	 * @return 案例图片集合
	 */
	public List<CaseShowImage> queryCaseShowImagesByCaseId(int caseId);
}
