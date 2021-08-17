package faq.controller;

public class FAQVO {
	
	private int no;
	private String first, last, handle; 
	
	public FAQVO (int no, String first, String last, String handle)
	{
		this.no = no;
		this.first = first;
		this.last = last;
		this.handle = handle;
	}
	
	public int getNo()
	{
		return no;
	}
	
	public void setNo(int no)
	{
		this.no = no;
	}
	
	public String getFirst()
	{
		return first;
	}

	public void setFirst(String first)
	{
		this.first = first;
	}
	
	public String getLast()
	{
		return last;
	}
	
	public void setLast(String last)
	{
		this.last = last;
	}
	
	public String getHandle()
	{
		return handle;
	}
	
	public void setHandle(String handle)
	{
		this.handle = handle;
	}
}
