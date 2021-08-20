package eea.controller;

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

public class EeaDAO {

	private DataSource ds = null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public void getCon() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:comp/env");
			ds = (DataSource) envContext.lookup("jdbc/pool");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<EeaVO> getAllList() {

		List<EeaVO> list = new ArrayList();

		getCon();

		try {
			String query = "select * from articleeea";
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				EeaVO evo = new EeaVO();
				evo.setTopic(rs.getString("topic"));
				evo.setTitle(rs.getString("title"));
				evo.setLink(rs.getString("link"));
				list.add(evo);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// public void addArticle(EeaVO m) {
	// 	try {
	// 		conn = dataFactory.getConnection();
	// 		String source = m.getSource();
	// 		String category = m.getCategory();
	// 		String title = m.getTitle();
	// 		String link = m.getLink();
	// 		String query = "INSERT INTO articles(source, category, title, link)" + " VALUES(?, ? ,? ,?)";
	// 		pstmt = conn.prepareStatement(query);
	// 		pstmt.setString(1, source);
	// 		pstmt.setString(2, category);
	// 		pstmt.setString(3, title);
	// 		pstmt.setString(4, link);
	// 		pstmt.executeUpdate();
	// 		pstmt.close();
	// 		conn.close();
	// 	} catch (SQLException e) {
	// 		e.printStackTrace();
	// 	}
	// }
	//
	// public boolean isArticleInTable(String source, String category, String link) {
	//
	// 	boolean result = false;
	//
	// 	try {
	// 		conn = dataFactory.getConnection();
	// 		String query = "select * from  articles where source='" + source + "' and category='" + category + "' and link='" + link + "'";
	// 		pstmt = conn.prepareStatement(query); // PrepareStatement ��ü�� �����ϸ鼭 SQL���� ���ڷ� ����
	// 		ResultSet rs = pstmt.executeQuery();
	// 		if (rs != null)
	// 		{
	// 		  rs.last();    // moves cursor to the last row
	// 		  if(rs.getRow() > 0) {
	// 			  //System.out.println(query + "\n select success");
	// 			  result = true;
	// 		  }
	// 		  else {
	// 			  //System.out.println(query + "\n select failed");
	// 			  result = false;
	// 		  }
	// 		}
	// 		rs.close();
	// 		pstmt.close();
	// 		conn.close();
	// 	} catch (SQLException e) {
	// 		e.printStackTrace();
	// 	}
	// 	return result;
	// }
	
}
