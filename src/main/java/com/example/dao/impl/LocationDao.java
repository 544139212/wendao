/**
 * 
 */
package com.example.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.example.model.LocationModel;

/**
 * @author Administrator
 *
 */
@Service("locationDao")
public class LocationDao {
	@Resource
	private JdbcTemplate jdbcTemplate;
	
	public void add(LocationModel model) {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder();
		
		sql.append("insert into t_location");
		sql.append("(longitude, latitude, "
				+ "createBy, createTime)");
		sql.append("values");
		sql.append("(?,?,?,?)");
		
		Object[] args = new Object[] {
				model.getLongitude(), model.getLatitude(),
				model.getCreateBy(), model.getCreateTime()
		};
		
		jdbcTemplate.update(sql.toString(), args);
	}
	
	public List<LocationModel> getByCreateBy(String createBy) {
		StringBuilder sql = new StringBuilder();
		sql.append("select id, longitude, latitude, "
				+ "createBy, createTime");
		sql.append(" from t_location");
		sql.append(" where createBy = ?");
		sql.append(" order by createTime desc");
//		sql.append(" limit 10");
		
//		return jdbcTemplate.query(sql.toString(), LocationModel.class, createBy);
		return jdbcTemplate.query(sql.toString(), new LocationModel(), createBy);
	}

}
