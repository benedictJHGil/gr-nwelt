<%@page import="event.controller.EventVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Include this file to obtain server's root address wherever using ajax!! --%>
<%@ include file="../rootAddress.jsp" %>
<%-----------------------------------------------------------------------------%>    
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
  <!-- datetimepicker -->
<script type="text/javascript" src="//code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
<script src="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/src/js/bootstrap-datetimepicker.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css" rel="stylesheet">
  <link rel='shortcut icon' type='image/x-icon' href='http://<%=rootAddress%>/image/favicon.ico'>
  <link rel="icon" type="image/x-icon" href="http://<%=rootAddress%>/image/favicon.ico">
  <!-- datetimepicker -->
    <!-- for open event -->
<!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
 -->  <!-- for open event -->

  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
 /* for open event */ 
  #radioBtn .notActive{
    color: #3276b1;
    background-color: #fff;
}
  </style> 
</head>

<script>
$(document).ready(function(){
	$('#writer').attr("placeholder", user_name);
	$('#searchBar').hide();
});

</script>
<body>

<!-- Navbar --> 
<jsp:include page="../inc/top.jsp"></jsp:include>
  <!-- /.navbar -->

<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-8">

<form action="/<%=projectName%>/EventWriteController" method="get" enctype="multipart/form-data" name="">
    <!-- datetimepicker : 
    real demo: https://www.jquery-az.com/boots/demo.php?ex=20.0_1 
    ref site :https://www.jquery-az.com/bootstrap-datetimepicker-managing-with-date-and-time-in-bootstrap/-->
		  <div class="form-group">
		    <label for="dtpickerdemo" class="control-label last"><h5>Select Start date/time:</h5></label>
		    <div class='col-sm-4 input-group date' id='dtpickerdemoStart'>
		         <input type='text' class="form-control" name="startTime" id="startTime"/>
		         <span class="input-group-addon">
		             <span class="glyphicon glyphicon-calendar"></span>
		         </span>
		     </div>
		     
		      <label for="dtpickerdemo" class="control-label last"><h5>Select End date/time:</h5></label>
		    <div class='col-sm-4 input-group date' id='dtpickerdemoEnd'>
		         <input type='text' class="form-control" name="endTime" id="endTime"/>
		         <span class="input-group-addon">
		             <span class="glyphicon glyphicon-calendar"></span>
		         </span>
		     </div>
		  </div>    
        <script type="text/javascript"><!-- datetimepicker start -->

            $(function () {
                $('#dtpickerdemoStart').datetimepicker();
            });
            $(function () {
                $('#dtpickerdemoEnd').datetimepicker();
            });
        </script><!-- datetimepicker end -->
        

		     <!-- open or private -->
   <div class="form-group">
  <div class="row">
    <div class="col">
      <label for="exampleFormControlInput1"><h5>Open As &nbsp; &nbsp;</h5></label>
    <!--  <label class="radio-inline">
      <input type="radio" name="isOpened" id="isOpened" checked>Public Event
    </label>
     <label class="radio-inline">
      <input type="radio" name="optradio">Private Event &nbsp; &nbsp; 
    </label> -->
    
   <label class="radio-inline"><input type="radio" name="isOpened" value="Opened" checked>Public Event</label>
   <label class="radio-inline"><input type="radio" name="isOpened">Private Event</label>
    
    </div>
    <div class="col">
      <div class="col-sm-6">
      	<label for="exampleFormControlInput1"><h5>num Of Max Members</h5></label>
      </div>
      <div class="col-sm-6">
      	<input type="text" class="form-control col-sm-4" name="numOfMaxMembers" id="numOfMaxMembers">
      </div>
    </div>
  </div>
  </div>
		     <!-- open or private -->

    <!-- datetimepicker end -->
  
<!--   <div class="form-group">
        <label for="happy" class="col-sm-4 col-md-4 control-label text-right">Will you open this event to everyone ?</label>
        <div class="col-sm-7 col-md-7">
          <div class="input-group">
            <div id="radioBtn" class="btn-group">
              <a class="btn btn-primary btn-sm active" data-toggle="happy" data-title="Y">YES</a>
              <a class="btn btn-primary btn-sm notActive" data-toggle="happy" data-title="N">NO</a>
            </div>
            <input type="hidden" name="happy" id="happy">
          </div>
</div>
  </div> -->
       <!-- for open event start -->
<!-- 	  <script type="text/javascript">
		$('#radioBtn a').on('click', function(){
		    var sel = $(this).data('title');
		    var tog = $(this).data('toggle');
		    $('#'+tog).prop('value', sel);
		     
		    $('a[data-toggle="'+tog+'"]').not('[data-title="'+sel+'"]').removeClass('active').addClass('notActive');
		    $('a[data-toggle="'+tog+'"][data-title="'+sel+'"]').removeClass('notActive').addClass('active');
		})
	  </script> -->
       <!-- for open event end -->
    
    <div class="form-group">
  <div class="row">
    <div class="col">
      <label for="exampleFormControlInput1"><h5>User ID</h5></label>
      <input type="text" class="form-control" placeholder="userID" name="writer" id="writer" readonly="readonly">
    </div>
    <div class="col">
      <label for="exampleFormControlInput1"><h5>password</h5></label>
      <input type="password" class="form-control" name="password" id="password" placeholder="password">
    </div>
  </div>
  </div>
  
    <div class="form-group">
    <label for="exampleFormControlInput1"><h5>your event location</h5></label>
    <input type="text" class="form-control" id="exampleFormControlInput1 eventPlace" name="eventPlace" placeholder="your event location">
  </div>
   
      <div class="form-group">
    <label for="exampleFormControlInput1"><h5>your event title</h5></label>
    <input type="text" class="form-control" id="exampleFormControlInput1 title" name="title" placeholder="your event name">
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlTextarea1">
    <div class="chunk flush--all _descriptionStep-module_body__3o5uS">
    <h5>describe what your event will be about</h5>
		<p class="text--body">
		<span>
		People will see this when we promote your group, but you’ll be able to add to it later, too.</span>
		</p>
		<ul class="_descriptionStep-module_descriptionConsiderations__34Nb4">
		<li>
		<span>
		What's the purpose of the group?</span>
		</li>
		<li>
		<span>
		Who should join?</span>
		</li>
		<li>
		<span>
		What will you do at your events?</span>
		</li>
		</ul>
	</div>
    </label>
    <textarea class="form-control" name="contents" id="exampleFormControlTextarea1 contents" rows="11" placeholder="describe what your group will be about"></textarea>
  </div>
  
 <!--  <div class="custom-file mb-3">
    <input type="file" class="custom-file-input" id="validatedCustomFile" required>
    <label class="custom-file-label" for="validatedCustomFile">Choose file...</label>
    <div class="invalid-feedback">Example invalid custom file feedback</div>
  </div> -->
 
<!-- <input type="hidden" name="numOfAttachLinks" value=""> -->
 
   <div class="form-group row">
   <div class="row">
	    <div class="col-sm-6">
	      <button type="submit" class="btn btn-primary">Register</button>
	    </div>
	    
	    <div class="col-sm-6">
	      <a href="/<%=projectName%>/EventListController"><button type="button" class="btn btn-light" id="toEventList">List</button></a>
	    </div>
    </div>
    
  </div>
  
</form>

    </div>
  </div>
</div>

<jsp:include page="../inc/bottom.jsp"></jsp:include>

</body>
</html>
