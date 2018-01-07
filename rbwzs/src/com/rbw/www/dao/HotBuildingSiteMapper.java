package com.rbw.www.dao;

import com.rbw.www.model.HotBuildingSite;
import com.rbw.www.model.HotBuildingSiteExample;
import java.util.List;

public interface HotBuildingSiteMapper {
    int countByExample(HotBuildingSiteExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(HotBuildingSite record);

    int insertSelective(HotBuildingSite record);

    List<HotBuildingSite> selectByExample(HotBuildingSiteExample example);

    HotBuildingSite selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(HotBuildingSite record);

    int updateByPrimaryKey(HotBuildingSite record);
}