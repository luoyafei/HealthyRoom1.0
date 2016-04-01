package com.xust.DBPool;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

public class MyConnection extends ConnectionAdapter {


	private Connection conn;
	private List<Connection> pools;
	
	public MyConnection(Connection conn, List<Connection> pools) {
		super(conn);
		this.conn = conn;
		this.pools = pools;
		// TODO Auto-generated constructor stub
	}
	@Override
	public void close() throws SQLException {
		// TODO Auto-generated method stub
		pools.add(conn);
		System.out.println("将此连接释放如连接池中，此时有 " + pools.size() + "个空闲的连接");
	}
	@Override
	public Statement createStatement() throws SQLException {
		// TODO Auto-generated method stub
		return conn.createStatement();
	}
	
	
	
}
