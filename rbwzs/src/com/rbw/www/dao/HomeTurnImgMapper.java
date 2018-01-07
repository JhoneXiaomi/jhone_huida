package com.rbw.www.dao;

import com.rbw.www.model.HomeTurnImg;
import com.rbw.www.model.HomeTurnImgExample;
import java.util.List;

public interface HomeTurnImgMapper {
    int countByExample(HomeTurnImgExample example);

    int deleteByPrimaryKey(Integer homeimgId);

    int insert(HomeTurnImg record);

    int insertSelective(HomeTurnImg record);

    List<HomeTurnImg> selectByExample(HomeTurnImgExample example);

    HomeTurnImg selectByPrimaryKey(Integer homeimgId);

    int updateByPrimaryKeySelective(HomeTurnImg record);

    int updateByPrimaryKey(HomeTurnImg record);
}