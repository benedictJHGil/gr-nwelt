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
  	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">		<!-- DataTable CDN -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>       <!-- DataTable CDN -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous"> <!-- 돋보기아이콘 -->
    <link rel='shortcut icon' type='image/x-icon' href='https://<%=rootAddress%>/image/favicon.ico'>
  <link rel="icon" type="image/x-icon" href="https://<%=rootAddress%>/image/favicon.ico">

<script type="text/javascript" language="javascript">

	var rootAddress = "<%=rootAddress%>";
 
    $(document).ready(function(){
    
		var keyword = 'global warming'; //API 기본 키워 지정한
		placeholder = $('#searchInput').attr("placeholder"); //검색창에 placeholder가 기본값('Search')가 아닌 경우에만 keyword에 그 값을 대입
		if(placeholder != 'Search') 
			keyword = placeholder;	//placeholder에 기본값('Search')이외의 다른 값이 들어있을경우: 검색창에 입력한 키워드가 넘어온 것이므로 keyword 최신화
		console.log(keyword);
		var newsApi = 'https://newsapi.org/v2/everything?q="'+ keyword +'"&apiKey=7f7ce0c864644f5bb96923e8e0272104'; //키워드뽑아서 기사가져올수있게할수있는 URL
		// var newsApi = 'https://newsapi.org/v2/everything?q=global%20warming&apiKey=7f7ce0c864644f5bb96923e8e0272104'; //키워드뽑아서 기사가져올수있게할수있는 URL
		var articles;
        ajaxExecute(); //
		
		// 뉴스 상단에 검색할수있는 기능구현 (클릭으로)
    	$("#newsSearch").click(function(){
    		  keyword = $('#searchInput').val(); //키워드에 검색한 input에 적은 값 넣기 
    		  console.log(keyword); // 키워드 출력해보기
    		  var newUrl = "https://" + rootAddress + "/ArticleBoardController"; // main page에서 더보기를 클릭시 3개뿐아닌 나머지도 불러오기위한 컨트롤러 처리 주소
    		  newUrl += '?keyword="' + keyword + '"'; //검색한 키워드를 같이 받아서 가져가기위한 키워드 전달
    		  console.log(newUrl); //주소가 전달이 잘되었는지 확인위해 출력해보기
    		  window.location.href=newUrl; //메인에서 article페이지로 more클릭하여 API불러왔을때 키워드를 같이 들고와서 보여주는데 키워드 들고간 페이지에서 다시 검색시 이전값이 존재하므로 새로고침을 해주어 초기화?시키는작업
    	});
    	function ajaxExecute(){
    		console.log('NewsAPI : ' + $('#mainPic').attr('newsApi'));
    		//if($('#mainPic').attr('newsApi') == 'on'){
		    	$.ajax({
		        	type : "GET", //전송방식을 지정한다 (POST,GET)
		        	url : newsApi,//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
		        	dataType : "json",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
		        	error : function(){
		            	console.log("connection down!!!!");
		        	},
		        	success : function(data){
		            	
		            	articles = data.articles; //newsapi에서 가져와진 articles데이터가져오기
		            	console.log(articles); // articles 데이터 콜솔에 출력해보기 (잘가져왔는지확인을위해)
		            	for(i=0; i < articles.length; i++){ //article가져온 수만큼 돌리기
		            		temp = articles[i].publishedAt.split('T'); //시간부분이 조금 길어서 T를 중심으로 나눠주기
		            		articles[i].publishedAt = temp[0]; // 나눈것 콘솔 확인해보면 인덱스 번호가 매겨져있고 T를 중심으로 나눠진것을 볼수있는데 거기에서 필요한 날짜부분은 0가져온것임
		            	}
		            	$('#listTable').DataTable({ // 데이터 테이블 지정한것 (CSS를 저절로 ? 생성해서 실제 HTML은 이곳에서 확인할수는 없다)
		      	    	  data: articles, //API에서 가져온 자료를 데이터 테이블가져온것에 각각의 자리에 해당 자료를 넣어주기 위한 작업
		      	    	  "aaSorting": [], //datatable 기본 정렬옵션 해
		      	    	    columns: [ 
		      	    	        { data: 'title' }, //title부분지정
		      	    	        { data: 'source.name' }, //출처가져오기
		      	    	        { "width": "15%", data: 'publishedAt' } //시간가져오기 (시간표시부분의 간격이 좁아서 시간이 잘려서 길이 조절을 위한 스타일조절해준것추가)
		      	    	    ]
		      	    	});
		            	//테이블에 title부분에 링크주소 달아주는 작업
		            	tr = $('#newsAllList').children(); //newsAllList:135 아이디준곳(테이블전체)tbody의 자식태그인 tr의 모든 다음줄 돌림(for문처럼=each)
		            	tr.each(function(i){ // 기사한개줄당
		            		title = tr.eq(i).children().eq(0).html(); //tr의 i번째의 자식td의 0번째 즉 title일때 HTML을 적용시키는데 들어오는 새로운? 인자값이 없으면 아무처리안함 (새로운 검색을 하지않았을경우를 말하는듯)
		            		//console.log(articles[i].url);
		            		tr.eq(i).children().eq(0).html('<a href ="'+articles[i].url+'" target="_blank">'+title+'</a>'); // 마찬가지로 인자값이 있으면 a태그지정해줌
		            	});
		            	//페이지가 1이상인경우에 a태그를 1페이지에서만 불러온다. 그래서 위는 1페이지에만해당이된다. 총 게시글은 20개만 불러옴으려 2페이지까지 적용시켜주면된다
		        		$('#listTable_next').trigger("click"); // next를 자동으로 클릭하는 트리거 실행 =  페이지를 로드할때 트리거가 발생하여 저절로 next & previous를 실행시켜주어 a태그를 모두 적용시킨다
		        		
		        		tr = $('#newsAllList').children();
		            	tr.each(function(i){
		            		title = tr.eq(i).children().eq(0).html();
		            		//console.log(articles[i].url);
		            		tr.eq(i).children().eq(0).html('<a href ="'+articles[i+10].url+'" target="_blank">'+title+'</a>'); //여기서 아티클에 i+10은 다음페이지에 적용시켜야하기에 +10을 하여 앞의 10개이후의 값 즉 2페이지 부터 적용시키다
		            	});
		            	
		            	$('#listTable_previous').trigger("click"); //previous버튼도 클릭시켜준다( 여기서 listTable_previous,listTable_next는 현제페이지에 없고 데이터테이블에서 저절로 만들기에 웹상에서 개발자보기로가서 참고하여 가져올수있다)
		    	    }  
		    	});
    		//}
		}
    });
</script>
  
  
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  #writeButton { text-align: right; }

  </style>
  
<style>

</style>
</head>
<body>

<!-- Navbar -->
<jsp:include page="/inc/top.jsp" />
  <!-- /.navbar -->

<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-12">
    <div> 
	  <div class="col-sm-11 last">
      	<h2>ARTICLES</h2>
      </div>
	</div> 
	
		<table class="table" id="listTable">
		  <thead>
		    <tr>
		      <!-- <th scope="col">#</th> -->
		      <th scope="col">Title</th>
		      <th scope="col">Fountain</th>
		      <th scope="col">Date</th>
		    </tr>
		  </thead>
		  <tbody id="newsAllList"> 
		  
		   <!--  <tr>
		     <th scope="row">1</th>
		      <td><a href="articleDetail.jsp">Mark</a></td>
		      <td>Otto</td>
		      <td>@mdo</td>
		    </tr> -->
		    
		  </tbody>
		</table>
    </div>
  </div>
</div>

<jsp:include page="/inc/bottom.jsp" />

</body>
</html>
