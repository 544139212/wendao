/**
 * 
 */
package com.example.populator;

/**
 * @author Administrator
 *
 */
public interface Populator<T, S> {
	void polulate(T target, S source);
}
