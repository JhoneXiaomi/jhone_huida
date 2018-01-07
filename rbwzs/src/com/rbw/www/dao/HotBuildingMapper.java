package com.rbw.www.dao;

import com.rbw.www.model.HotBuilding;
import com.rbw.www.model.HotBuildingExample;
import java.util.List;

public interface HotBuildingMapper {
    int countByExample(HotBuildingExample example);

    int deleteByPrimaryKey(Integer bulidingId);

    int insert(HotBuilding record);

    int insertSelective(HotBuilding record);

    List<HotBuilding> selectByExample(HotBuildingExample example);

    HotBuilding selectByPrimaryKey(Integer bulidingId);

    int updateByPrimaryKeySelective(HotBuilding record);

    int updateByPrimaryKey(HotBuilding record);
}