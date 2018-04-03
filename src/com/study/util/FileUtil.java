package com.study.util;

import java.text.DecimalFormat;

public class FileUtil {

	//300 "300 Bytes", 1024 bytes - 1kb, 1024Kb - 1Mb 
	
	public static String fancySize(float size) {
		DecimalFormat df = new DecimalFormat("###,###.000");
		if(size < 1024) {
			return size + " Bytes ";
		}else if(size < (1024*1024)) {
			return df.format(size/1024) + " Kb ";
		}else {
			return df.format(size/(1024*1024)) + " Mb ";
			
		}
		
	}


	public static void main(String[] args) {
		System.out.println( 14/5.0);
		System.out.println( FileUtil.fancySize(500));
		System.out.println( FileUtil.fancySize(2500));
		System.out.println( FileUtil.fancySize(12222500));
	}

}
