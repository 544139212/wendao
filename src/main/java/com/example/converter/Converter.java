/**
 * 
 */
package com.example.converter;

import java.util.List;

/**
 * @author Administrator
 *
 */
public interface Converter<T,S> {
	T convert(S source);
	
	List<T> convert(List<S> source);
}
