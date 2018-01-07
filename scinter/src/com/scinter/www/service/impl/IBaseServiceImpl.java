package com.scinter.www.service.impl;

import org.springframework.stereotype.Service;

import com.scinter.www.service.IBaseService;


/**
 * 
 * 基础方法实现类
 * 
 * @author jhone
 * 
 * Create time 2017/10/11 15:05
 */

@Service
public class IBaseServiceImpl implements IBaseService{

	@Override
	public String spileCompanyName(String companyName) {

		String spilCompany = "";
		
		switch (companyName) {
		case "rbwzs1":
			spilCompany = "rbw1";
			break;
		case "rbwzs2":
			spilCompany = "rbw2";
			break;
		case "rrlzs":
			spilCompany = "rrl";
			break;
		default:
			spilCompany = companyName.substring(0, 2);
			break;
		}

		return spilCompany;
	}

}
