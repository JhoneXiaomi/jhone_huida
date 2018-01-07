package com.rbw.www.dao;

import com.rbw.www.model.OrderInfo;
import com.rbw.www.model.OrderInfoExample;
import java.util.List;

public interface OrderInfoMapper {
    int countByExample(OrderInfoExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(OrderInfo record);

    int insertSelective(OrderInfo record);

    List<OrderInfo> selectByExample(OrderInfoExample example);

    OrderInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrderInfo record);

    int updateByPrimaryKey(OrderInfo record);
}