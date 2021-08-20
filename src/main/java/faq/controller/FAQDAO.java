package faq.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class FAQDAO {
	
	private DataSource dataFactory;
	private Connection conn;
	private PreparedStatement pstmt;
	
	public FAQDAO()
	{
		try
		{
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/pool");
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public List<FAQVO> listFaq()
	{
		List<FAQVO> faqsList = new ArrayList<FAQVO>();
		
		try
		{
			conn = dataFactory.getConnection();
			String query = "select * from faqs";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				int no = rs.getInt("no");
				String first = rs.getString("first");
				String last = rs.getString("last");
				String handle = rs.getString("handle");
				FAQVO faqVO = new FAQVO(no, first, last, handle);
				faqsList.add(faqVO);
			}
			rs.close();
			pstmt.close();
			conn.close();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		
		return faqsList;
	}
}
