package com.example.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
	
	static final String PATTERN = "yyyy-MM-dd HH:mm:ss";
	
	public static String getDateString() {
		SimpleDateFormat sdf = new SimpleDateFormat(PATTERN);
		return sdf.format(new Date());
	}
	
	public static long getTimeInMillis(String date) {
		SimpleDateFormat sdf = new SimpleDateFormat(PATTERN);
		try {
			return sdf.parse(date).getTime();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0L;
	}
	
	/**
	 * 
	 * @param diff
	 * @return The outcome is not very accurate when use 30 as a month days
	 */
	public static String getDateDescription(long diff) {
		if (diff < 10*60) {
			return "刚刚";
		} else if (diff >= 10*60 && diff < 1*60*60) {
			return diff/60 + " 分钟以前";
		} else if (diff >= 1*60*60 && diff < 24*60*60) {
			return diff/60/60 + " 小时以前";
		} else if (diff >= 24*60*60 && diff < 7*24*60*60) {
			return diff/24/60/60 + " 天以前";
		} else if (diff >= 7*24*60*60 && diff < 30*24*60*60) {
			return diff/7/24/60/60 + " 周以前";
		} else if (diff >= 30*24*60*60 && diff < 12*30*24*60*60) {
			return diff/30/24/60/60 + " 个月以前";
		} else/* if (diff >= 12*30*24*60*60)*/ {
			return diff/12/30/24/60/60 + " 年以前";
		}
	}
}
