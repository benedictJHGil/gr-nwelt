package usepa.controller;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsepaDAO {

    private Connection con = null;
    private PreparedStatement pstmt = null;
    private DataSource ds = null;
    private ResultSet rs = null;

    public void getCon() {
        try {
            Context initctx = new InitialContext();
            Context envctx = (Context) initctx.lookup("java:comp/env");
            ds = (DataSource) envctx.lookup("jdbc/pool");
            con = ds.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<UsepaVO> getAllList() {

        List<UsepaVO> list = new ArrayList<>();

        getCon();

        try {
            String query = "select * from articleusepa";
            pstmt = con.prepareStatement(query);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                UsepaVO uvo = new UsepaVO();
                uvo.setTopic(rs.getString("topic"));
                uvo.setTitle(rs.getString("title"));
                uvo.setLink(rs.getString("link"));
                list.add(uvo);
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
