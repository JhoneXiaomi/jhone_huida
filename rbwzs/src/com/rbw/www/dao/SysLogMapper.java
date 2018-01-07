package com.rbw.www.dao;

import com.rbw.www.model.SysLog;
import com.rbw.www.model.SysLogExample;
import java.util.List;

public interface SysLogMapper {
    int countByExample(SysLogExample example);

    int deleteByPrimaryKey(Integer logId);

    int insert(SysLog record);

    int insertSelective(SysLog record);

    List<SysLog> selectByExample(SysLogExample example);

    SysLog selectByPrimaryKey(Integer logId);

    int updateByPrimaryKeySelective(SysLog record);

    int updateByPrimaryKey(SysLog record);
}