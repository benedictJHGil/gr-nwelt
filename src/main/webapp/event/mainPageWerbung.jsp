<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Include this file to obtain server's root address wherever using ajax!! --%>
<%@ include file="../rootAddress.jsp" %>
<%-----------------------------------------------------------------------------%>
<script defer type="text/javascript" language="javascript">

	var rootAddress = "<%=rootAddress%>";
	var url = "https://" + rootAddress + "/EventListForMainController";

    $(document).ready(function(){
    	
        $.ajax({
            type : "GET", //전송방식을 지정한다 (POST,GET)
            url : url,//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
            dataType : "json",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
            error : function(){
                console.log("connection down!!!!");
            },
            success : function(data){
                console.log(data);
                var length = data.length > 4 ? 4 : data.length;
                for(i=0; i<length; i++){
                    var datetime = data[i].publishedDate.split(" ");
                    var date = datetime[0].split("-");
                    var month = "";
                    switch(Number(date[1])){
                    	case 1: month = 'Jan';
                    		break;
                    	case 2: month = 'Feb';
                			break;
                    	case 3: month = 'Mar';
            				break;
                    	case 4: month = 'Apr';
            				break;
                    	case 5: month = 'May';
        					break;
                    	case 6: month = 'Jun';
        					break;
                    	case 7: month = 'Jul';
        					break;
                    	case 8: month = 'Aug';
        					break;
                    	case 9: month = 'Sep';
        					break;
                    	case 10: month = 'Oct';
        					break;
                    	case 11: month = 'Nov';
        					break;
                    	case 12: month = 'Dec';
        					break;
                    }                	
    				html = '<div class="card">';
				  		html += '<div class="card-body">';
				  			html += '<div class="row">';
				  				html += '<div class="col-sm-6">';
			   						html += '<a href="/EventDetailController?no=' + data[i].no + '" class="stretched-link"><h4 class="card-title">'+ data[i].title +'</h4></a>';
			   					html += '</div>';
			   					html += '<div class="col-sm-3">';
			   						html += '<p class="card-text">'+ data[i].writer +'</p>';
				   				html += '</div>';
				   				html += '<div class="col-sm-2">';
				   					html += '<p class="card-text">'+ date[2] + '. ' + month +'</p>';
			   					html += '</div>';
			   					if(data[i].isLocked){
			   						html += '<div class="col-sm-1">';
			   							html += '<i class="text-warning fas fa-lock"></i>';
			   						html += '</div>';
			   					}
				   			html += '</div>';
				   			html += '<div class="row">';
				   				html += '<div class="col-sm-6">';
				   					html += '<h5>';
			   						for(j=0; j<data[i].numOfJoiningMembers; j++)
		   								html += '<i class="text-success fas fa-smile"></i>&nbsp;';
		   							for(; j<data[i].numOfMaxMembers; j++)
		   								html += '<i class="text-success far fa-smile"></i>&nbsp;';
				   					html += '</h5>';
			   					html += '</div>';
			   					html += '<div class="col-sm-2">';
			   						html += '<i class="far fa-comment-alt"></i>&nbsp;&nbsp;' + data[i].numOfComment;
				   				html += '</div>';
				   				html += '<div class="col-sm-2">';
				   					html += '<i class="far fa-thumbs-up"></i>&nbsp;&nbsp;' + data[i].numOfLikes;
			   					html += '</div>';
			   					html += '<div class="col-sm-2">';
			   						html += '<i class="far fa-eye"></i>&nbsp;&nbsp;' + data[i].numOfViews;
			   					html += '</div>';
				   			html += '</div>';
				 		html += '</div>';
					html += '</div>';
	        		html += '<br>';
	        		
	                $("#eventList").append(html);
                }
            }  
        });

    });
</script>

<!-- Event Werbung start -->
  
<div class="row" id="event">
	<div class="col-sm-8">
		<h2 style="padding-bottom:42.5px;">EVENTS</h2>
	</div>
	<div class="col-sm-4">
		<section id="writeButton"> <a href="/EventListController"><button type="submit" class="btn btn-outline-info">more...</button></a> </section><br>
	</div>
</div>
<div id="eventList"></div>
<!-- 
<div>
		<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  			<div class="carousel-inner">
   				<div class="carousel-item active">
   					<img src="../img/fakeimage.png" class="d-block w-100" alt="...">
    			</div>

 			 </div>

		</div>
</div>
<br>
-->
<!-- Event Werbung end -->