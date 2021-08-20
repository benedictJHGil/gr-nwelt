package unep.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UnepDAO {

	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;
	private ResultSet rs = null;
	
	public void getCon()
	{ 
		try
		{
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			ds = (DataSource) envctx.lookup("jdbc/pool");
			con = ds.getConnection();
		}
		 
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public List<UnepVO> getAllList()
	{
		List<UnepVO> list = new ArrayList<>();

		getCon();
		
		try {
			String query = "select * from articleunep";
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				UnepVO uvo = new UnepVO();
				uvo.setContinent(rs.getString("continent"));
				uvo.setTitle(rs.getString("title"));
				uvo.setLink(rs.getString("link"));
				uvo.setDate(rs.getString("date"));
				list.add(uvo);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	/*
	public void insertUnep(List<UnepVO> titlesAndlinkslist)
	{
		try
		{
			conn = ds.getConnection();
			for (int i = 0; i < titlesAndlinkslist.size(); i++)
			{
				String continent = titlesAndlinkslist.get(i).getContinent();
				String title = titlesAndlinkslist.get(i).getTilte();
				String link = titlesAndlinkslist.get(i).getLink();
				String date = titlesAndlinkslist.get(i).getDate();
				String query = "insert into articleUnep(continent, title, link, date)" + " values(?, ?, ?, ?)";
				System.out.println(query);
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, continent);
				pstmt.setString(2, title);
				pstmt.setString(3, link);
				pstmt.setString(4, date);
				pstmt.executeUpdate();
				pstmt.close();
			}
			conn.close();
		}
		
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}*/
}
