package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.model.BlogModel;

public interface BlogModelMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BlogModel record);

    int insertSelective(BlogModel record);

    BlogModel selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BlogModel record);

    int updateByPrimaryKey(BlogModel record);
    
    List<BlogModel> selectPageable(@Param("createBy") String createBy, @Param("offset") int offset, @Param("rows") int rows);
    
    int selectPageableCount(@Param("createBy") String createBy);
}