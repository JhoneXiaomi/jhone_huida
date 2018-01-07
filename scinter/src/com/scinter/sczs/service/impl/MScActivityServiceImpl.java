package com.scinter.sczs.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scinter.sczs.service.IMScActivityService;
import com.scinter.www.dao.TbMobileActivityDtoMapper;
import com.scinter.www.model.News;
import com.scinter.www.model.SysLog;
import com.scinter.www.model.TbMobileActivityDto;
import com.scinter.www.model.TbMobileActivityDtoExample;
import com.scinter.www.model.TbMobileActivityDtoExample.Criteria;
import com.scinter.www.util.Page;
import com.scinter.www.util.SysLogUtil;
import com.scinter.www.util.TableName;

@Service
public class MScActivityServiceImpl implements IMScActivityService{

	@Autowired
	private TbMobileActivityDtoMapper tbMobileActivityDtoMapper;
	
	TbMobileActivityDtoExample me = new TbMobileActivityDtoExample();
	Criteria c = me.createCriteria();
	
	@Override
	public List<TbMobileActivityDto> queryMobileActivities(String branchCompany, int page, int row,int status) {
		
		if (StringUtils.isNotBlank(branchCompany)) {
			c.andBranchCompanyEqualTo(branchCompany);
		}
		c.andStatusEqualTo(status);
		Page p = new Page((page - 1) * row, row);
		p.setTotalRecords((int) tbMobileActivityDtoMapper.countByExample(me));
		me.setPage(p);
		me.setOrderByClause("create_time desc");
		
		return  tbMobileActivityDtoMapper.selectByExample(me);
	}

	@Override
	public int countMobileActivities(String branchCompany, int status) {
		
		c.andStatusEqualTo(status);
		
		return (int)tbMobileActivityDtoMapper.countByExample(me);
	}

	@Override
	public void addMobileActivity(TbMobileActivityDto tbMobileActivityDto) {
		tbMobileActivityDtoMapper.insert(tbMobileActivityDto);
	}

	@Override
	public void updateMobileActivity(TbMobileActivityDto tbMobileActivityDto) {
		tbMobileActivityDtoMapper.updateByPrimaryKey(tbMobileActivityDto);
	}

	@Override
	public TbMobileActivityDto queryMobileActivityById(String id) {
		
		return tbMobileActivityDtoMapper.selectByPrimaryKey(id);
	}

	@Override
	public void updateMobileActivityByIds(String ids,String userId) {
		String[] newsIdsArr = ids.split(",");
		for(int i=0;i<newsIdsArr.length;i++){
			TbMobileActivityDto u = tbMobileActivityDtoMapper.selectByPrimaryKey(newsIdsArr[i]);
			u.setStatus(3);//1正常  3已删除 
			u.setUpdateTime(new Date());
			u.setUpdateId(userId);
			tbMobileActivityDtoMapper.updateByPrimaryKeySelective(u);
			
			
		}
	}

	
}
