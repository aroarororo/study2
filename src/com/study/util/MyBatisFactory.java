package com.study.util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisFactory {

	public static SqlSessionFactory getSqlSession() {
		String resource = "resource/mybatis-config.xml";
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory SqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			return SqlSessionFactory;
			
		}catch(IOException e){
			e.printStackTrace();
			throw new RuntimeException("myBatis 오류 ",e);
		}
	}
	
}
