package com.example.utils;

import java.util.Random;

public class VerifyCodeUtils {
	public static String getGenerateVerifyCode() {
		int maxNum = 36;
		char[] chars = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',  
			    'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w',  
			    'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };  
		
		int count = 0;
		int i;
		String str = "";
		Random r = new Random();  
		while (count < 6) { // default 6 length
			i = Math.abs(r.nextInt(maxNum));
			
			if (i >= 0 && i < chars.length) {
				str += chars[i];
				count++;
			}
		}
		
		return str.toUpperCase();
	}
}
