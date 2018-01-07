package com.rbw.www.dao;

import com.rbw.www.model.HotBuildingSiteImage;
import com.rbw.www.model.HotBuildingSiteImageExample;
import java.util.List;

public interface HotBuildingSiteImageMapper {
    int countByExample(HotBuildingSiteImageExample example);

    int deleteByPrimaryKey(Integer imageId);

    int insert(HotBuildingSiteImage record);

    int insertSelective(HotBuildingSiteImage record);

    List<HotBuildingSiteImage> selectByExample(HotBuildingSiteImageExample example);

    HotBuildingSiteImage selectByPrimaryKey(Integer imageId);

    int updateByPrimaryKeySelective(HotBuildingSiteImage record);

    int updateByPrimaryKey(HotBuildingSiteImage record);
}