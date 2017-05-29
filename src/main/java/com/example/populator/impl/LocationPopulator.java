/**
 * 
 */
package com.example.populator.impl;

import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

import com.example.data.LocationData;
import com.example.model.LocationModel;
import com.example.populator.Populator;

/**
 * @author Administrator
 *
 */
@Component
public class LocationPopulator implements
		Populator<LocationData, LocationModel> {

	/* (non-Javadoc)
	 * @see com.kitty.populator.Populator#polulate(java.lang.Object, java.lang.Object)
	 */
	public void polulate(LocationData target, LocationModel source) {
		// TODO Auto-generated method stub
		Assert.notNull(target, "target must be not null");
		Assert.notNull(source, "source must be not null");
		
		target.setId(source.getId());
		target.setLongitude(source.getLongitude());
		target.setLatitude(source.getLatitude());
		target.setAddressLine1(source.getAddressLine1());
		target.setAddressLine2(source.getAddressLine2());
		target.setAddressLine3(source.getAddressLine3());
		target.setAddressLine4(source.getAddressLine4());
		target.setAddressLine5(source.getAddressLine5());
		target.setAddressLine6(source.getAddressLine6());
		target.setAddressLine7(source.getAddressLine7());
		target.setAddressLine8(source.getAddressLine8());
		target.setAddressLine9(source.getAddressLine9());
		target.setAddressLine10(source.getAddressLine10());
		target.setCreateBy(source.getCreateBy());
		target.setCreateTime(source.getCreateTime());
	}
	
}
