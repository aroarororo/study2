package com.study.servlet;

import java.sql.DriverManager;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

public class DriverLoader extends HttpServlet{

	@Override
	public void init() throws ServletException {
		loadDriver();
		initConnectionPool();
	}
	
	public void loadDriver(){
		try {
			String driver ="oracle.jdbc.driver.OracleDriver"; 
			Class.forName(driver);
			System.out.println("오라클드라이버로드");
			
		}catch(ClassNotFoundException ex){
			throw new RuntimeException("fail to load JDBC driver",ex);
		}
		
	}
	
	
	private void initConnectionPool() {
		try {

		ConnectionFactory connFactory = new DriverManagerConnectionFactory("jdbc:oracle:thin:@127.0.0.1:1521:xe", "java", "oracle");
		PoolableConnectionFactory poolableConnFactory = new PoolableConnectionFactory(connFactory, null);
		poolableConnFactory.setValidationQuery("select 1 from dual ");
		
		GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
		poolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 1L);
		poolConfig.setTestWhileIdle(true);
		poolConfig.setMinIdle(4);
		poolConfig.setMaxTotal(50);
		
		GenericObjectPool<PoolableConnection> connectionPool = new GenericObjectPool<>(poolableConnFactory,poolConfig);
		poolableConnFactory.setPool(connectionPool);
		
		Class.forName("org.apache.commons.dbcp2.PoolingDriver");

		PoolingDriver driver = (PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:");
		driver.registerPool("study", connectionPool);
		System.out.println("DBCP study 등록 성공");
		
		
		}catch(Exception e) {
			throw new RuntimeException(e);
		}
	}
}
