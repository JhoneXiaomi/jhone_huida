package com.rbw.www.dao;

import com.rbw.www.model.Comment;
import com.rbw.www.model.CommentExample;
import java.util.List;

public interface CommentMapper {
    int countByExample(CommentExample example);

    int deleteByPrimaryKey(Integer commentId);

    int insert(Comment record);

    int insertSelective(Comment record);

    List<Comment> selectByExample(CommentExample example);

    Comment selectByPrimaryKey(Integer commentId);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);
}