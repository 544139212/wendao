/**
 * 
 */
package com.example.data;

import java.util.List;

/**
 * @author Administrator
 *
 */
public class SearchPageData<T> {
	private int pageStep = 4;
	
	private int pageNo;
	
	private int pageSize;
	
	private int totalRecords;
	
	private List<T> results;

	/**
	 * @return the pageNo
	 */
	public int getPageNo() {
		return pageNo;
	}

	/**
	 * @param pageNo the pageNo to set
	 */
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	/**
	 * @return the pageSize
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * @param pageSize the pageSize to set
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * @return the totalRecords
	 */
	public int getTotalRecords() {
		return totalRecords;
	}

	/**
	 * @param totalRecords the totalRecords to set
	 */
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	/**
	 * @return the results
	 */
	public List<T> getResults() {
		return results;
	}

	/**
	 * @param results the results to set
	 */
	public void setResults(List<T> results) {
		this.results = results;
	}
	
	public int getFirstPageNo() {
		return 1;
	}
	
	public int getPreviousPageNo() {
		if (pageNo <= 1) {
			return 1;
		}
		return pageNo -1;
	}
	
	public int getNextPageNo() {
		if (pageNo >= getTotalPages()) {
			return getTotalPages() == 0 ? 1 : getTotalPages();
		}
		return pageNo + 1;
	}
	
	public int getLastPageNo() {
		return getTotalPages() == 0 ? 1 : getTotalPages();
	}
	
	/* getDisableFirst() also is ok */
	public boolean isDisableFirst() {
		return pageNo == getFirstPageNo();
	}
	
	/* getDisableLast() also is ok */
	public boolean isDisableLast() {
		return pageNo == getLastPageNo();
	}
	
	/* getEllipsisBefore() also is ok */
	public boolean isEllipsisBefore() {
		return getBegin() != getFirstPageNo();
	}
	
	/* getEllipsisAfter() also is ok */
	public boolean isEllipsisAfter() {
		return getEnd() != getLastPageNo();
	}
	
	public int getTotalPages() {
		return totalRecords == 0 ? 1 : (totalRecords + pageSize - 1) / pageSize;
	}
	
	public int getBegin() {
		if (pageNo > pageStep + 1 && getTotalPages() > 2 * pageStep + 1) {
			return pageNo - pageStep;
		}
		return getFirstPageNo();
	}
	
	public int getEnd() {
		if (getTotalPages() > 2 * pageStep + 1) {
			if (pageNo > getTotalPages() - pageStep && pageNo <= getTotalPages()) {
//				return getLastPageNo();
			} else if (pageNo > pageStep + 1 && pageNo <= getTotalPages() - pageStep) {
				return pageNo + pageStep;
			} else {
				return 2 * pageStep + 1;
			}
		} 
		return getLastPageNo();
	}
	
}
