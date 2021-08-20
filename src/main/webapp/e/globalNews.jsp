<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Include this file to obtain server's root address wherever using ajax!! --%>
<%@ include file="../rootAddress.jsp" %>
<%-----------------------------------------------------------------------------%>    

<style>
.btn-outline-info {
    color: #17a2b8;
    border-color: #17a2b8;
}
.last {
float: left;
} 
</style> 
<script type="text/javascript" language="javascript">

	$(document).ready(function(){
		
		var rootAddress = "<%=rootAddress%>";
    	var keyword = 'global warming'; //API 기본 키워 지정한
    	// var newsApi = 'https://newsapi.org/v2/everything?q="'+ keyword +'"&apiKey=7f7ce0c864644f5bb96923e8e0272104'; //키워드뽑아서 기사가져올수있게할수있는 URL
    	var newsApi = 'https://newsapi.org/v2/everything?q=global%20warming&apiKey=7f7ce0c864644f5bb96923e8e0272104'; //키워드뽑아서 기사가져올수있게할수있는 URL
    	$('#linkToArticleController').attr("href", "https://" + rootAddress + "/ArticleBoardController"); //ArticleBoardController로 키워드와 함께 보낼수있도록하기위한 주소지
    	ajaxExecute(); // 
    	
    	// 뉴스 상단에 검색할수있는 기능구현 (클릭으로)
    	$("#newsSearch").click(function(){
    		  keyword = $('#searchInput').val(); //키워드에 검색한 input에 적은 값 넣기 
    		  console.log(keyword); // 키워드 출력해보기
    		  // newsApi = 'https://newsapi.org/v2/everything?q="'+ keyword +'"&apiKey=7f7ce0c864644f5bb96923e8e0272104'; //뉴스 API 주소 가져오기
    		  newsApi = 'https://newsapi.org/v2/everything?q=global%20warming&apiKey=7f7ce0c864644f5bb96923e8e0272104'; //뉴스 API 주소 가져오기
    		  console.log(newsApi);
    		  $('#newsIndicators').empty(); // 창 다른거볼수있게 창 넘어가는 수 초기화 (검색시 조회되는 글의 수가 1개면 1개남고 2개면 2개만 보일수있도록하기위함)
    		  $("#newsList").empty(); //검색하면 메인페이지에서 글 수가 바뀌는데 이전에 초기기본으로 지정해준 글 3개를 비워주어야함
    		  $('#loading_news').show();
    		  ajaxExecute(); // ajaxExecute() 실행시키기 
    		  var newUrl = "https://" + rootAddress + "/ArticleBoardController"; // 더보기를 클릭시 3개뿐아닌 나머지도 불러오기위한 컨트롤러 처리 주소
    		  newUrl += '?keyword="' + keyword + '"'; //검색한 키워드를 같이 받아서 가져가기위한 키워드 전달
    		  console.log(newUrl); //주소가 전달이 잘되었는지 확인위해 출력해보기
    		  $('#linkToArticleController').attr("href", newUrl); // 컨트롤러에 키워드 검색하여 얻은 자료를 넘겨주기위한 URL 연결
    	});
    	
    	// 뉴스 상단에 검색할수있는 기능구현 (엔터키보드로)
    	/* $("#newsSearchKey").keydown(function(){
    		  keyword = $('#searchInput').val(); //키워드에 검색한 input에 적은 값 넣기 
    		  console.log(keyword); // 키워드 출력해보기
    		  newsApi = 'https://newsapi.org/v2/everything?q="'+ keyword +'"&apiKey=7f7ce0c864644f5bb96923e8e0272104'; //뉴스 API 주소 가져오기
    		  $('#newsIndicators').empty(); // 창 다른거볼수있게 창 넘어가는 수 초기화 (검색시 조회되는 글의 수가 1개면 1개남고 2개면 2개만 보일수있도록하기위함)
    		  $("#newsList").empty(); //검색하면 메인페이지에서 글 수가 바뀌는데 이전에 초기기본으로 지정해준 글 3개를 비워주어야함 
    		  ajaxExecute(); // ajaxExecute() 실행시키기 
	   		  var newUrl = "http://" + rootAddress + "/ArticleBoardController"; // 더보기를 클릭시 3개뿐아닌 나머지도 불러오기위한 컨트롤러 처리 주소
    		  newUrl += '?keyword="' + keyword + '"'; //검색한 키워드를 같이 받아서 가져가기위한 키워드 전달
    		  console.log(newUrl); //주소가 전달이 잘되었는지 확인위해 출력해보기
    		  $('#linkToArticleController').attr("href", newUrl); // 컨트롤러에 키워드 검색하여 얻은 자료를 넘겨주기위한 URL 연결
    	}); */
    	
    	
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
	                	console.log(data);
	                	$('#loading_news').hide();
	                	var articles = data.articles;
	                	var length = articles.length > 3 ? 3 : articles.length; //총보여줄 페이지 수
	                    for(i=0; i<length; i++){
	                        
	                    	/* if(i == 0){
	    			  		html = '<a href ="'+ articles[i].url +'" target=”_blank” ><div class="carousel-item active">';
	                    	}
	                    	else{
	                    		html = '<a href ="'+ articles[i].url +'" target=”_blank” ><div class="carousel-item">';	
	                    	} */
	                    	if(i == 0){ //처음 시작해줘야하는거같은데 ..active를 통해서 처음시작해주기위해 첫 값 0일때는 active실행시키기
	        			  		html = '<div class="carousel-item active">';
	                        }
	                       	else{ //0이아닌 그다음 값은 active없이 실행시킬수있게하기 (이렇게 active를 지정해줘야 그림이 함께 로드됨)
	                       		html = '<div class="carousel-item">';	
	                       	}	// 아티클의 주소와 그림주소 불러오기 (스타일: 그림클릭시 기사 새창뜨게하기, 크기 400조절하기, 원본사진 상하좌우비율 변경않게하기)
	    			  			html += '<div style="height: 400px;"><a href ="'+ articles[i].url +'" target=”_blank” ><img src="'+ articles[i].urlToImage +'" class="d-block w-100" alt="..." style="background: url('+ articles[i].url +') center no-repeat; background-size: cover; width: 100%;"></a></div>';
	    			  				html += '<div class="carousel-caption d-none d-md-block">'; 
	    		   						html += '<h5>'+ articles[i].title +'</h5>'; //기사 제목가져오기
	    		   						html += '<p>'+ articles[i].source.name + ' | ' + articles[i].author + ' | ' + articles[i].publishedAt + '</p>'; //기사 이름,글쓴이,날짜가져오기
	    	   						html += '</div>';
	    					html += '</div>';
	    					        		
	            		//console.log(html);
	    					if(i == 0){ //뉴스 페이지쪽수 총 3페이지인데 처음시작시 class="active" 주어야함으로 if문생성하여  0일때 활성시키고 아닐때 비활성시키게하기
	    						$('#newsIndicators').append('<li data-target="#carouselExampleCaptions" data-slide-to="' + i + '" class="active"></li>');
	                        }
	                       	else{
	                       		$('#newsIndicators').append('<li data-target="#carouselExampleCaptions" data-slide-to="' + i + '"></li>');	
	                       	}
	            		
	                    $("#newsList").append(html); //HTML문으로 출력하기	
	    	            }
	        	    }  
	        	});
    		//}
    	}

    });
</script>
   
  
<!-- emilia start -->
<div class="row"> <!-- 버튼 나란히 하기 --><!-- style="border: 1px solid #212529;" --> 
  <div class="col-sm-11 last">
  	<h2>INTERNATIONAL ENVIRONMENT NEWS</h2>
  </div>
   <div class="col-sm-1 last">
    <section id="writeButton"><a href="" id="linkToArticleController"><button type="submit" class="btn btn-outline-info">more...</button></a> </section><br>
  </div>
</div> <!-- 버튼 나란히 하기 -->
<div class="spinner-border" id="loading_news"></div>
<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators" id="newsIndicators">
    <!-- <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li> -->
  </ol>

  <div class="carousel-inner" id="newsList">
    <!-- <div class="carousel-item active">
      <img src="../img/fakeimage.png" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>First slide label</h5>
        <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="../img/fakeimage.png" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Second slide label</h5>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="../img/fakeimage.png" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Third slide label</h5>
        <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
      </div>
    </div> -->
	<!-- <div class="carousel-item active"><img src="https://static01.nyt.com/images/2020/11/03/climate/00CLI-LEGACY1/00CLI-LEGACY1-facebookJumbo.jpg" class="d-block w-100" alt="..."><div class="carousel-caption d-none d-md-block"><h5>Trump's Climate Policies Accelerated Global Warming</h5><p>New York Times | Coral Davenport|2020-11-09T18:33:36Z</p></div></div>
	<div class="carousel-item"><img src="https://static01.nyt.com/images/2020/11/10/climate/10CLI-HURRICANES1/10CLI-HURRICANES1-facebookJumbo.jpg" class="d-block w-100" alt="..."><div class="carousel-caption d-none d-md-block"><h5>5 Things We Know About Climate Change and Hurricanes</h5><p>New York Times | Veronica Penney|2020-11-10T15:18:00Z</p></div></div>
	<div class="carousel-item"><img src="https://static01.nyt.com/images/2020/11/06/climate/00CLI-METHANE1/00CLI-METHANE1-facebookJumbo.jpg" class="d-block w-100" alt="..."><div class="carousel-caption d-none d-md-block"><h5>New Technology Claims to Pinpoint Even Small Methane Leaks From Space</h5><p>New York Times | Paul Tullis|2020-11-11T19:10:13Z</p></div></div> -->    
    
  </div>
  
  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div> 
<br>

<!-- emilia end -->
