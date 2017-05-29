package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.model.LinkModel;

public interface LinkModelMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LinkModel record);

    int insertSelective(LinkModel record);

    LinkModel selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LinkModel record);

    int updateByPrimaryKey(LinkModel record);
    
    List<LinkModel> selectPageable(@Param("createBy") String createBy, @Param("offset") int offset, @Param("rows") int rows);
    
    int selectPageableCount(@Param("createBy") String createBy);
}