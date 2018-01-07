package com.rbw.www.dao;

import com.rbw.www.model.User;
import com.rbw.www.model.UserExample;
import java.util.List;

public interface UserMapper {
    int countByExample(UserExample example);

    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}