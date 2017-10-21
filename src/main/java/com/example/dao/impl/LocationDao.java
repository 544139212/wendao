/**
 * 
 */
package com.example.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.example.dao.IDAO;
import com.example.model.LocationModel;

/**
 * @author Administrator
 *
 */
@Service("locationDao")
public class LocationDao implements IDAO<LocationModel> {
	@Resource
	private JdbcTemplate jdbcTemplate;
	
	/* (non-Javadoc)
	 * @see com.kitty.dao.IDAO#add(java.lang.Object)
	 */
	public void add(LocationModel model) {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder();
		
		sql.append("insert into t_location");
		sql.append("(longitude, latitude, "
				+ "addressLine1, addressLine2, addressLine3, "
				+ "addressLine4, addressLine5, addressLine6, "
				+ "addressLine7, addressLine8, addressLine9, "
				+ "addressLine10, createBy, createTime)");
		sql.append("values");
		sql.append("(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		
		Object[] args = new Object[] {
				model.getLongitude(), model.getLatitude(),
				model.getAddressLine1(), model.getAddressLine2(), model.getAddressLine3(), 
				model.getAddressLine4(), model.getAddressLine5(), model.getAddressLine6(), 
				model.getAddressLine7(), model.getAddressLine8(), model.getAddressLine9(),
				model.getAddressLine10(), model.getCreateBy(), model.getCreateTime()
		};
		
		jdbcTemplate.update(sql.toString(), args);
	}
	
	public List<LocationModel> getByCreateBy(String createBy) {
		StringBuilder sql = new StringBuilder();
		sql.append("select id, longitude, latitude, "
				+ "addressLine1, addressLine2, addressLine3, "
				+ "addressLine4, addressLine5, addressLine6, "
				+ "addressLine7, addressLine8, addressLine9, "
				+ "addressLine10, createBy, createTime");
		sql.append(" from t_location");
		sql.append(" where createBy = ?");
		sql.append(" order by createTime desc");
//		sql.append(" limit 10");
		
//		return jdbcTemplate.query(sql.toString(), LocationModel.class, createBy);
		return jdbcTemplate.query(sql.toString(), new LocationModel(), createBy);
	}

}
