package com.scinter.www.util;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.model.SysConfig;
import com.scinter.www.model.SysConfigExample;
import com.scinter.www.model.SysConfigExample.Criteria;

public class HomeUtil {

	@Autowired
	private static SysConfigMapper sysConfigMapper;
	
	public static List<SysConfig> getHomeMessage(String keyName) {
		SysConfigExample sysConfigExample = new SysConfigExample();
        Criteria csysLogo = sysConfigExample.createCriteria();
        csysLogo.andKeyNameEqualTo(keyName);
		List<SysConfig> sysconfigList = sysConfigMapper.selectByExample(sysConfigExample);
        
        return sysconfigList;
	}

}
