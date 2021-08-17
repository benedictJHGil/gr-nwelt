package event.controller;

import java.sql.Date;

public class EventVO {
	private int no;
	private	String title;
	private	String writer;
	private	int writerNo;
	private	String publishedDate;
	private	int isOpened;
	private	int isLocked;
	private	int password;
	private	int numOfMaxMembers;
	private	int numOfJoiningMembers;
	private	int numOfComment;
	private	int numOfViews;
	private	int numOfLikes;

	private int numOfAttachLinks;
	private String contents;
	 
	private	String startTime;
	private	String endTime;
	private	String eventPlace;
	
	public EventVO(int no, String title, int writerNo, String publishedDate, int isOpened, int password,
			int numOfMaxMembers, int numOfJoiningMembers, int numOfComment, int numOfViews, int numOfLikes,
			String contents, String startTime, String endTime, String eventPlace) {
		super();
		this.no = no;
		this.title = title;
		this.writerNo = writerNo;
		this.publishedDate = publishedDate;
		this.isOpened = isOpened;
		this.password = password;
		this.numOfMaxMembers = numOfMaxMembers;
		this.numOfJoiningMembers = numOfJoiningMembers;
		this.numOfComment = numOfComment;
		this.numOfViews = numOfViews;
		this.numOfLikes = numOfLikes;
		this.contents = contents;
		this.startTime = startTime;
		this.endTime = endTime;
		this.eventPlace = eventPlace;
	}

	
	public EventVO(int no, String title, String writer, String publishedDate, int isOpened, int isLocked, int numOfMaxMembers, int numOfJoiningMembers, int numOfComment, int numOfViews, int numOfLikes) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.publishedDate = publishedDate;
		this.isOpened = isOpened;
		this.isLocked = isLocked;
		this.numOfMaxMembers = numOfMaxMembers;
		this.numOfJoiningMembers = numOfJoiningMembers;
		this.numOfComment = numOfComment;
		this.numOfViews = numOfViews;
		this.numOfLikes = numOfLikes;
	}
	
	
	public EventVO() {
		// TODO Auto-generated constructor stub
	}

	
	public String getStartTime() {
		return startTime;
	}


	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}


	public String getEndTime() {
		return endTime;
	}


	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}


	public String getEventPlace() {
		return eventPlace;
	}


	public void setEventPlace(String eventPlace) {
		this.eventPlace = eventPlace;
	}
	
	public int getNumOfAttachLinks() {
		return numOfAttachLinks;
	}

	public void setNumOfAttachLinks(int numOfAttachLinks) {
		this.numOfAttachLinks = numOfAttachLinks;
	}
	
	public String getContents() {
	return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public void setWriterNo(int writerNo) {
		this.writerNo = writerNo;
	}

	public void setPublishedDate(String publishedDate) {
		this.publishedDate = publishedDate;
	}

	public void setIsOpened(int isOpened) {
		this.isOpened = isOpened;
	}

	public void setIsLocked(int isLocked) {
		this.isLocked = isLocked;
	}

	public void setPassword(int password) {
		this.password = password;
	}

	public void setNumOfMaxMembers(int numOfMaxMembers) {
		this.numOfMaxMembers = numOfMaxMembers;
	}

	public void setNumOfJoiningMembers(int numOfJoiningMembers) {
		this.numOfJoiningMembers = numOfJoiningMembers;
	}

	public void setNumOfComment(int numOfComment) {
		this.numOfComment = numOfComment;
	}

	public void setNumOfViews(int numOfViews) {
		this.numOfViews = numOfViews;
	}

	public void setNumOfLikes(int numOfLikes) {
		this.numOfLikes = numOfLikes;
	}	

	public int getNo() {
		return no;
	}

	public String getTitle() {
		return title;
	}

	public String getWriter() {
		return writer;
	}
	
	public int getWriterNo() {
		return writerNo;
	}

	public String getPublishedDate() {
		return publishedDate;
	}

	public int getIsOpened() {
		return isOpened;
	}

	public int getIsLocked() {
		return isLocked;
	}

	public int getPassword() {
		return password;
	}

	public int getNumOfMaxMembers() {
		return numOfMaxMembers;
	}

	public int getNumOfJoiningMembers() {
		return numOfJoiningMembers;
	}

	public int getNumOfComment() {
		return numOfComment;
	}

	public int getNumOfViews() {
		return numOfViews;
	}

	public int getNumOfLikes() {
		return numOfLikes;
	}

}