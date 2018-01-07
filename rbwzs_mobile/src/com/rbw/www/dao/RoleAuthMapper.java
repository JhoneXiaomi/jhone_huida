package com.rbw.www.dao;

import com.rbw.www.model.RoleAuth;
import com.rbw.www.model.RoleAuthExample;
import java.util.List;

public interface RoleAuthMapper {
    int countByExample(RoleAuthExample example);

    int deleteByPrimaryKey(Integer authId);

    int insert(RoleAuth record);

    int insertSelective(RoleAuth record);

    List<RoleAuth> selectByExample(RoleAuthExample example);

    RoleAuth selectByPrimaryKey(Integer authId);

    int updateByPrimaryKeySelective(RoleAuth record);

    int updateByPrimaryKey(RoleAuth record);
}