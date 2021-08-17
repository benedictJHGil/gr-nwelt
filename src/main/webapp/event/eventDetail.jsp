<%@page import="event.controller.EventVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%
	//String sid = null;
//로그인이 되지 않은 상태일 경우 로그인 페이지로 강제 이동 처리
/* 	if(session.getAttribute("sid") == null) {
		out.println("<script>");
		out.println("alert('This service requires a login')");
		out.println("location.href='LoginForm.me'");
		out.println("</script>");
	} else {// 로그인 된 상태일 경우 세션 ID 가져오기
		sid = (String)session.getAttribute("sid");
	} */
// 전달받은 request 객체에서 데이터 가져오기
	EventVO detailedEvent = (EventVO)request.getAttribute("detailedEvent");
	//EventVO detailedEvent2 = (EventVO)request.getAttribute("eventList");

	
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>GRÜNWELT</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/facebookstyle.css">
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <%-- Include this file to obtain server's root address wherever using ajax!! --%>
<%@ include file="/rootAddress.jsp" %>
<%-----------------------------------------------------------------------------%>
   <script type="text/javascript" language="javascript">

<%-- 	var rootAddress = "<%=rootAddress%>";
	var url = "http://" + rootAddress + "/EventDetailController?no="++;
	 --%>
	
 	</script>
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  .last {
float: right;
}
  
  </style>
</head>
<body>

<!-- Navbar -->
<jsp:include page="../inc/top.jsp"></jsp:include>
  <!-- /.navbar -->

<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-12">
      <h2>EVENT</h2>

<form action="">
    <div class="form-group">
  <div class="row">
    <div class="col">
      <input type="text" class="form-control" placeholder="user ID:>" readonly="readonly">
      
    </div>
    <div class="col">
      <input type="text" class="form-control" placeholder="hits number: " readonly="readonly">
    </div>
  </div>
  </div>
  
    <div class="form-group">
  <div class="row">
    <div class="col">
      <input type="text" class="form-control" placeholder="max mem count: <%=detailedEvent.getNumOfMaxMembers()%> & current joined mem: <%=detailedEvent.getNumOfJoiningMembers()%>" readonly="readonly">
    </div>
    <div class="col">
      <input type="text" class="form-control" placeholder="date: <%=detailedEvent.getPublishedDate() %>" readonly="readonly">
    </div>
  </div>
  </div>
  
      <div class="form-group">
  <div class="row">
    <div class="col">
      <input type="text" class="form-control" placeholder="Opne to public or not: <%=detailedEvent.getIsOpened()%>" readonly="readonly">
    </div>
    <div class="col">
      <input type="text" class="form-control" placeholder="password: <%=detailedEvent.getPassword()%>" readonly="readonly">
    </div>
  </div>
  </div>
  
    <div class="form-group">
    <label for="exampleFormControlInput1">Subject</label>
    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Subject : <%=detailedEvent.getContents() %>" readonly="readonly">
  </div>
  
 
  <div class="form-group">
    <label for="exampleFormControlTextarea1">Content</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="11" readonly="readonly"><%=detailedEvent.getContents() %></textarea>
    
  </div>
  
 
<!--
  <div class="custom-control custom-checkbox mb-3">
    <input type="checkbox" class="custom-control-input" id="customControlValidation1" required>
    <label class="custom-control-label" for="customControlValidation1">Check this custom checkbox</label>
    <div class="invalid-feedback">Example invalid feedback text</div>
  </div>

  <div class="custom-control custom-radio">
    <input type="radio" class="custom-control-input" id="customControlValidation2" name="radio-stacked" required>
    <label class="custom-control-label" for="customControlValidation2">Toggle this custom radio</label>
  </div>
  <div class="custom-control custom-radio mb-3">
    <input type="radio" class="custom-control-input" id="customControlValidation3" name="radio-stacked" required>
    <label class="custom-control-label" for="customControlValidation3">Or toggle this other custom radio</label>
    <div class="invalid-feedback">More example invalid feedback text</div>
  </div>
  <div class="mb-3">
    <select class="custom-select" required>
      <option value="">Choose...</option>
      <option value="1">One</option>
      <option value="2">Two</option>
      <option value="3">Three</option>
    </select>
    <div class="invalid-feedback">Example invalid custom select feedback</div>
  </div>
-->
  
  <div class="custom-file mb-3">
    <input type="file" class="custom-file-input" id="validatedCustomFile" required readonly="readonly">
    <label class="custom-file-label" for="validatedCustomFile">Choose file...</label>
    <div class="invalid-feedback">Example invalid custom file feedback</div>
  </div>
  
<!-- meeting date start -->
        <div class="form-group">
  <div class="row">
    <div class="col">
      <input type="text" class="form-control" placeholder="Meeting date" readonly="readonly">
    </div>
  </div>
  </div>
<!-- meeting date end -->

<!-- Comments  start -->
 <div class="timeline-body">
<!--        <div class="timeline-header">
          <span class="userimage"><img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt=""></span>
          <span class="username"><a href="javascript:;">Sean Ngu</a> <small></small></span>
          <span class="pull-right text-muted">18 Views</span>
       </div> -->
<!--        <div class="timeline-content">
          <p>
             Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc faucibus turpis quis tincidunt luctus.
             Nam sagittis dui in nunc consequat, in imperdiet nunc sagittis.
          </p>
       </div> -->
       <div class="timeline-likes">
          <div class="stats-right">
             <span class="stats-text">259 Shares</span>
             <span class="stats-text">21 Comments</span>
          </div>
          <div class="stats">
             <span class="fa-stack fa-fw stats-icon">
             <i class="fa fa-circle fa-stack-2x text-danger"></i>
             <i class="fa fa-heart fa-stack-1x fa-inverse t-plus-1"></i>
             </span>
             <span class="fa-stack fa-fw stats-icon">
             <i class="fa fa-circle fa-stack-2x text-primary"></i>
             <i class="fa fa-thumbs-up fa-stack-1x fa-inverse"></i>
             </span>
             <span class="stats-total">4.3k</span>
          </div>
       </div>
       <div class="timeline-footer">
          <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-thumbs-up fa-fw fa-lg m-r-3"></i> Like</a>
          <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-comments fa-fw fa-lg m-r-3"></i> Comment</a> 
          <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-share fa-fw fa-lg m-r-3"></i> Share</a>
       </div>
       <div class="timeline-comment-box">
          <div class="user"><img src="https://bootdey.com/img/Content/avatar/avatar3.png"></div>
          <div class="input">
             <form action="">
                <div class="input-group">
                   <!-- <input type="text" class="form-control rounded-corner" placeholder="Write a comment..."> -->
                  <!--  <button class="btn btn-secondary f-s-12 rounded-corner" type="button">Comment</button> -->
                 <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                 <button type="submit" class="btn btn-secondary btn-sm last" style="text-align: right;">comments</button>
                   <span class="input-group-btn p-l-10">
                   </span>
                </div>
             </form>
          </div>
       </div>
    </div>
  <br>
<!-- Comments end -->

  
<!-- previous comments start -->
<!-- 
  <div class="form-group">
    <label for="exampleFormControlTextarea1">Comments</label>   
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
    <button type="submit" class="btn btn-secondary btn-sm last" style="text-align: right;">comments</button>
  </div>
<br> -->
<!-- 
<ul class="list-unstyled">
  <li class="media">
    <img src="../img/comments.png" class="mr-3" alt="...">
    <div class="media-body">
      <h5 class="mt-0 mb-1">List-based media object</h5>
      Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
    </div>
  </li>
  <br>
  
  <li class="media my-4">
    <img src="../img/comments.png" class="mr-3" alt="...">
    <div class="media-body">
      <h5 class="mt-0 mb-1">List-based media object</h5>
      Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
    </div>
  </li>
  <br>
  
  <li class="media">
    <img src="../img/comments.png" class="mr-3" alt="...">
    <div class="media-body">
      <h5 class="mt-0 mb-1">List-based media object</h5>
      Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
    </div>
  </li>
</ul>

<br> -->
<!-- previous comments end -->

         <!-- end timeline-body -->
         <div class="timeline-body">
            <div class="timeline-header">
               <span class="userimage"><img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt=""></span>
               <span class="username">Sean Ngu</span>
               <span class="pull-right text-muted">82 Views</span>
            </div>
            <div class="timeline-content">
               <p>Location: United States</p>
            </div>
           <!--  <div class="timeline-footer">
               <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-thumbs-up fa-fw fa-lg m-r-3"></i> Like</a>
               <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-comments fa-fw fa-lg m-r-3"></i> Comment</a> 
               <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-share fa-fw fa-lg m-r-3"></i> Share</a>
            </div> -->
         </div>
         
         <div class="timeline-body">
            <div class="timeline-header">
               <span class="userimage"><img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt=""></span>
               <span class="username">Sean Ngu</span>
               <span class="pull-right text-muted">82 Views</span>
            </div>
            <div class="timeline-content">
               <p>Location: United States</p>
            </div>
           <!--  <div class="timeline-footer">
               <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-thumbs-up fa-fw fa-lg m-r-3"></i> Like</a>
               <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-comments fa-fw fa-lg m-r-3"></i> Comment</a> 
               <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-share fa-fw fa-lg m-r-3"></i> Share</a>
            </div> -->
         </div>
         
         <div class="timeline-body">
            <div class="timeline-header">
               <span class="userimage"><img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt=""></span>
               <span class="username">Sean Ngu</span>
               <span class="pull-right text-muted">82 Views</span>
            </div>
            <div class="timeline-content">
               <p>Location: United States</p>
            </div>
           <!--  <div class="timeline-footer">
               <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-thumbs-up fa-fw fa-lg m-r-3"></i> Like</a>
               <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-comments fa-fw fa-lg m-r-3"></i> Comment</a> 
               <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-share fa-fw fa-lg m-r-3"></i> Share</a>
            </div> -->
         </div>
         <!-- end timeline-body -->
 <!-- facebook style commend -->
</form>
    </div>
  </div>
</div>
<jsp:include page="../inc/bottom.jsp"></jsp:include>

</body>
</html>
