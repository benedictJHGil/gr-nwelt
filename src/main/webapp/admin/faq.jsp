<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<body>
  <title>Bootstrap 4 Website Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  .last {
float: left;
}
  </style>
  
<%-- Include this file to obtain server's root address wherever using ajax!! --%>
<%@ include file="../rootAddress.jsp" %>
<%-----------------------------------------------------------------------------%>

<script type="text/javascript" language="javascript">

	var rootAddress = "<%=rootAddress%>";
	var faqUrl = "http://" + rootAddress + "/testForKmove/FAQController";
	
	$(document).ready(function(){
    	
        $.ajax({
            type : "GET", //전송방식을 지정한다 (POST,GET)
            url : faqUrl,//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
            dataType : "json",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
            error : function(){
                console.log("connection down!!!!");
            },
            success : function(data){
            	console.log(data)
            	

            	var str = "";
            	str += "<table class=\"table\">";
            	str += "<thead>";
            	str += "<tr>";
            	str += "<th scope=\"col\">#</th>";
            	str += "<th scope=\"col\">First</th>";
            	str += "<th scope=\"col\">Last</th>";
            	str += "<th scope=\"col\">Handle</th>";
            	str += "</tr>";
            	str += "</thead>";
            	str += "<tbody>";
				for(var i = 0; i < data.length; i++) {
					str += "<tr>";
						str += "<th scope=\"row\">" + data[i].no +"</th>";
						str += "<td>" + data[i].first + "</td>";
						str += "<td>" + data[i].last + "</td>" ;
						str += "<td>" + data[i].handle + "</td>";
					str += "</tr>";
				}
				str += "</tbody>";

                $("#resultFaqList").append(str);

            }
        });
    });
</script>

<!-- Navbar -->
<jsp:include page="../inc/top.jsp" />
  <!-- /.navbar -->

<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-12">
    <div> <!-- 버튼 나란히 하기 --><!-- style="border: 1px solid #212529;" --> 
	  <div class="col-sm-11 last">
      <h2>FAQ</h2>
      </div>
	  <div class="col-sm-1 last">
	  		<section id="writeButton"> <a href="#"><button type="submit" class="btn btn-primary">Post</button></a> </section><br>
	</div>
	</div> <!-- 버튼 나란히 하기 -->
	
  	<div id="resultFaqList"></div>

    </div>
  </div> 
</div>

<jsp:include page="../inc/bottom.jsp" />

</body>
</html>

