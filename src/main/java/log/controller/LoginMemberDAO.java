package log.controller;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LoginMemberDAO {
	
	private DataSource dataFactory;
	private Connection conn;
	private PreparedStatement pstmt;
	
	public LoginMemberDAO()
	{
		try
		{
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/pool");
		}
		
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	/*
	public int isExisted(LoginMemberVO logmemVO)
	{
		int result = 0;
		String id = logmemVO.getId();
		int pwd = logmemVO.getPwd();
		
		try
		{
			conn = dataFactory.getConnection();
			String query = "select * from members where id='" + id + "' and pwd=" + pwd;
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			if (rs != null) 
			{
			  rs.last();    // moves cursor to the last row
			  if(rs.getRow() > 0) {
				  result = rs.getInt("no");
			  }
			}
			rs.close();
			pstmt.close();
			conn.close();
		}
		
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		
		System.out.println(result);
		return result;
	}
	*/
	
	public LoginMemberVO isExisted(LoginMemberVO logmemVO)
	{
		LoginMemberVO result = new LoginMemberVO();
		String id = logmemVO.getId();
		int pwd = logmemVO.getPwd();
		
		int userNo = 0;
		String userName = "";
		
		try
		{
			conn = dataFactory.getConnection();
			String query = "select * from members where id='" + id + "' and pwd=" + pwd;
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			if (rs != null) 
			{
			  rs.last();    // moves cursor to the last row
			  if(rs.getRow() > 0) {
				  userNo = rs.getInt("no");
				  userName = rs.getString("name");
			  }
			}
			rs.close();
			pstmt.close();
			conn.close();
		}
		
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		result.setUserNo(userNo);
		result.setName(userName);
		return result;
	}
	
	public String getUserName(int userNo)
	{
		String userName = "";
		
		try
		{
			conn = dataFactory.getConnection();
			String query = "select name from members where no=" + userNo;
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			System.out.println(rs);
			//userName = rs.getString("name");
			System.out.println("name: " + userName);
			rs.close();
			pstmt.close();
			conn.close();
		}
		
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		
		return userName;
	}
}
