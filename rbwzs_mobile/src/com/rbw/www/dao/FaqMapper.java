package com.rbw.www.dao;

import com.rbw.www.model.Faq;
import com.rbw.www.model.FaqExample;
import java.util.List;

public interface FaqMapper {
    int countByExample(FaqExample example);

    int deleteByPrimaryKey(Integer faqId);

    int insert(Faq record);

    int insertSelective(Faq record);

    List<Faq> selectByExample(FaqExample example);

    Faq selectByPrimaryKey(Integer faqId);

    int updateByPrimaryKeySelective(Faq record);

    int updateByPrimaryKey(Faq record);
}