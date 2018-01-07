package com.rbw.www.dao;

import com.rbw.www.model.HouseTypeReview;
import com.rbw.www.model.HouseTypeReviewExample;
import java.util.List;

public interface HouseTypeReviewMapper {
    int countByExample(HouseTypeReviewExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(HouseTypeReview record);

    int insertSelective(HouseTypeReview record);

    List<HouseTypeReview> selectByExample(HouseTypeReviewExample example);

    HouseTypeReview selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(HouseTypeReview record);

    int updateByPrimaryKey(HouseTypeReview record);
}