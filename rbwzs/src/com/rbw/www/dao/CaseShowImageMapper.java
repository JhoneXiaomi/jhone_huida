package com.rbw.www.dao;

import com.rbw.www.model.CaseShowImage;
import com.rbw.www.model.CaseShowImageExample;
import java.util.List;

public interface CaseShowImageMapper {
    int countByExample(CaseShowImageExample example);

    int deleteByPrimaryKey(Integer imageId);

    int insert(CaseShowImage record);

    int insertSelective(CaseShowImage record);

    List<CaseShowImage> selectByExample(CaseShowImageExample example);

    CaseShowImage selectByPrimaryKey(Integer imageId);

    int updateByPrimaryKeySelective(CaseShowImage record);

    int updateByPrimaryKey(CaseShowImage record);
}