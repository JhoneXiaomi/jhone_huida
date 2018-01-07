package com.rbw.www.dao;

import com.rbw.www.model.News;
import com.rbw.www.model.NewsExample;
import java.util.List;

public interface NewsMapper {
    int countByExample(NewsExample example);

    int deleteByPrimaryKey(Integer newsId);

    int insert(News record);

    int insertSelective(News record);

    List<News> selectByExample(NewsExample example);

    News selectByPrimaryKey(Integer newsId);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKey(News record);
}