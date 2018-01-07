package com.scinter.www.dao;

import com.scinter.www.model.TbMobileActivityDto;
import com.scinter.www.model.TbMobileActivityDtoExample;
import java.util.List;

public interface TbMobileActivityDtoMapper {
    long countByExample(TbMobileActivityDtoExample example);

    int deleteByPrimaryKey(String id);

    int insert(TbMobileActivityDto record);

    int insertSelective(TbMobileActivityDto record);

    List<TbMobileActivityDto> selectByExample(TbMobileActivityDtoExample example);

    TbMobileActivityDto selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(TbMobileActivityDto record);

    int updateByPrimaryKey(TbMobileActivityDto record);
}