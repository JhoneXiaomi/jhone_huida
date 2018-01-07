package com.rbw.www.dao;

import com.rbw.www.model.Repair;
import com.rbw.www.model.RepairExample;
import java.util.List;

public interface RepairMapper {
    int countByExample(RepairExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Repair record);

    int insertSelective(Repair record);

    List<Repair> selectByExample(RepairExample example);

    Repair selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Repair record);

    int updateByPrimaryKey(Repair record);
}