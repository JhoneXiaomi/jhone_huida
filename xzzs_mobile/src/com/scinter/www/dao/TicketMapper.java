package com.scinter.www.dao;

import com.scinter.www.model.Ticket;
import com.scinter.www.model.TicketExample;
import java.util.List;

public interface TicketMapper {
    int countByExample(TicketExample example);

    int deleteByPrimaryKey(String tid);

    int insert(Ticket record);

    int insertSelective(Ticket record);

    List<Ticket> selectByExample(TicketExample example);

    Ticket selectByPrimaryKey(String tid);

    int updateByPrimaryKeySelective(Ticket record);

    int updateByPrimaryKey(Ticket record);
}