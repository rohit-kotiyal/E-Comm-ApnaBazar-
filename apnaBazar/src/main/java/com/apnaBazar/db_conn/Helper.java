package com.apnaBazar.db_conn;

public class Helper {
	public static String get10words(String description) {
		
		String[] strArray = description.split(" ");
		
		if(strArray.length > 30) {
			String words = "";
			for(int i=0; i<30; i++) {
				words += strArray[i] + " ";
			}
			return (words+"... <a href='#'>More</a>");
		}else {
			return (description+".");
		}
	}
}
