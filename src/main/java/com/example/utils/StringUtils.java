package com.example.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

public class StringUtils {
	public static List<String> tokenizer(String str, String delim) {
		List<String> list = new ArrayList<String>();
		StringTokenizer tokenizer = new StringTokenizer(str, delim);
		while (tokenizer.hasMoreElements()) {
			list.add(tokenizer.nextToken());
		}
		return list;
	}
}
