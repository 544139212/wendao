package com.example.dao;

import com.example.model.UserModel;
import org.springframework.stereotype.Repository;

@Repository
public interface UserModelMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserModel record);

    int insertSelective(UserModel record);

    UserModel selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserModel record);

    int updateByPrimaryKey(UserModel record);
    
    UserModel selectByCode(String code);
}