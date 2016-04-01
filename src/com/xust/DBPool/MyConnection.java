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
		System.out.println("���������ͷ������ӳ��У���ʱ�� " + pools.size() + "�����е�����");
	}
	@Override
	public Statement createStatement() throws SQLException {
		// TODO Auto-generated method stub
		return conn.createStatement();
	}
	
	
	
}
