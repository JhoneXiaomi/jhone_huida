package com.rbw.www.util;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.rbw.www.dao.SysConfigMapper;
import com.rbw.www.model.SysConfig;
import com.rbw.www.model.SysConfigExample;
import com.rbw.www.model.SysConfigExample.Criteria;

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
