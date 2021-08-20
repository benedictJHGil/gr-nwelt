<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Include this file to obtain server's root address wherever using ajax!! --%>
<%@ include file="../rootAddress.jsp" %>
<%-----------------------------------------------------------------------------%>   

<!DOCTYPE html>
<html lang="en">
<head>
  <title>GRÜNWELT</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">   <!-- DataTable CDN -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>       <!-- DataTable CDN -->
  <link rel='shortcut icon' type='image/x-icon' href='https://<%=rootAddress%>/image/favicon.ico'>
  <link rel="icon" type="image/x-icon" href="https://<%=rootAddress%>/image/favicon.ico">
  
  <script type="text/javascript">
    $(document).ready( function () {        
    	if(user_no == 'null'){
    		$("#toEventWrite").hide();
    	}
    	
        $("#toEventWrite").click(function(){
      	  window.location.href="/EventWriteController";
        });
        
        history.replaceState({}, null, location.pathname);
    });
  </script>
  <!-- End of DataTable Initialising -->
  <script type="text/javascript" language="javascript">
	var rootAddress = "<%=rootAddress%>";
	var url = "https://" + rootAddress + "/EventListForMainController";
 	
    $(document).ready(function(){
    	
    	$('#searchBar').hide();
    	
    	ajaxExecute();
    	
    	function ajaxExecute(){
        $.ajax({
            type : "GET", //전송방식을 지정한다 (POST,GET)
            url : url,//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
            dataType : "json",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
            error : function(){
                console.log("connection down!!!!");
            },
            
            
            success : function(data){
                console.log(data);
                   
	            	for(i=0; i < data.length; i++){ //article가져온 수만큼 돌리기
	            		temp = data[i].publishedDate.split(' '); //시간부분이 조금 길어서 T를 중심으로 나눠주기
	            		data[i].publishedDate = temp[0]; // 나눈것 콘솔 확인해보면 인덱스 번호가 매겨져있고 T를 중심으로 나눠진것을 볼수있는데 거기에서 필요한 날짜부분은 0가져온것임
	            	}
                    //DataTable Initialising 
                    $('#eventlistTable').DataTable({
                    	data: data, // 웹에서 개발자들어가면 data에서자료를 들고오는데 처음에 0으로 바로시작함 그래서 따로 데이터담는곳 지정하지않았고 data로 바로 들고오니 출력됨
                    	"aaSorting": [], //최신글 순서가 젤 위로오게하여 정렬기능 
                    	columns: [ 
                    		{ data: 'no'}, //페이지 넘겨주기위해서 no불러옴 (빈에 생성하고 게시글에도 추가함 > 마우스가져다대면 해당 글 번호의 정보를 가져옴)
                    		{ data: 'title' }, 
                    		{ data: 'writer' },
                    		{ "width": "15%", data: 'publishedDate' },
                    		{ "width": "5%", data: 'numOfViews' }

                    	]
                    });
                    
                    $('tr').click(function(){
                    	//console.log($(this).children().eq(0).text());
                    	//console.log("/testForKmove/EventDetailController?no="+$(this).children().eq(0).text());
                    	location.href="/EventDetailController?no="+$(this).children().eq(0).text(); // 해당 글 클릭시 해당 글 불러올수있도록 글번호주소지정함
                    }); //this의 tr을 클릭하면 그 밑의 자식중에서 0번째 즉 no의 text를 가져오기
            }  
        });
 	   }
    });
</script>
  
<style>
.fakeimg {
    height: 200px;
    background: #aaa;
}
.last {
float: left;
}
</style>
</head>
<body>

<!-- Navbar -->
<jsp:include page="/inc/top.jsp" />
  <!-- /.navbar -->
 
<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-12">
    <div> <!-- 버튼 나란히 하기 --><!-- style="border: 1px solid #212529;" --> 
	  <div class="col-sm-11 last">
      <h2>COMMUNITIES</h2>
      </div>
	  <div class="col-sm-1 last">
      <section id="writeButton"><button type="submit" class="btn btn-primary" id="toEventWrite">Post</button></section><br>
	</div>
	</div> <!-- 버튼 나란히 하기 -->
    <!-- <table class="table">  -->  
<table class="table" id="eventlistTable">    <!-- Datatable id mapping -->
  <thead>
    <tr>

 	  <th scope="col" id="no">#</th>

      <th scope="col">Title</th>
<!-- 	  <th scope="col">Locked</th> -->
      <th scope="col">Organizer</th>
      <th scope="col">Date</th>
      <th scope="col">RC</th>
      
    </tr>
  </thead>
  <tbody id="eventAllList">
    <!-- <tr>
      <th scope="row">1</th>
      <td><a href="eventDetail.jsp">Environment meeting</a></td>
      <td>2020.11.12</td>
      <td>2/10</td>
    </tr> -->
    
  </tbody>
</table>
    </div>
  </div>
</div>

<jsp:include page="/inc/bottom.jsp" />

</body>
</html>