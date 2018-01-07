package com.scinter.www.dao;

import com.scinter.www.model.OfferArtifact;
import com.scinter.www.model.OfferArtifactExample;
import java.util.List;

public interface OfferArtifactMapper {
    int countByExample(OfferArtifactExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(OfferArtifact record);

    int insertSelective(OfferArtifact record);

    List<OfferArtifact> selectByExample(OfferArtifactExample example);

    OfferArtifact selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OfferArtifact record);

    int updateByPrimaryKey(OfferArtifact record);
}