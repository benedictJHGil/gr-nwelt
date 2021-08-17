package log.controller;

import java.sql.Date;

public class LoginMemberVO {
	
	private int userNo;
	private String id, name;
	private int pwd;
	private Date joinDate;

	public LoginMemberVO()
	{
		System.out.println("MemberVO ������ ȣ��");
	}
	
	public LoginMemberVO(String id, int pwd, String name, String email, Date joinDate)
	{
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.joinDate = joinDate;
	}

	public int getUserNo() {
		return userNo;
	}
	
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public int getPwd() {
		return pwd;
	}
	
	public void setPwd(int pwd) {
		this.pwd = pwd;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
		
	public Date getJoinDate() {
		return joinDate;
	}
	
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
}
