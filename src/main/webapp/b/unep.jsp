<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<head>
    <style>
      .ell {
        text-overflow: ellipsis;
        overflow: hidden;
        width: 275px;
        white-space: pre;
      }
    </style>
</head>

<%-- Include this file to obtain server's root address wherever using ajax!! --%>
<%@ include file="../rootAddress.jsp" %>
<%-----------------------------------------------------------------------------%>

<%--<script type="text/javascript" language="javascript">--%>

<%--	var rootAddress = "<%=rootAddress%>";--%>
<%--	var crawlUrl = "http://" + rootAddress + "/CrawlController";--%>
<%--	--%>
<%--	$(document).ready(function(){--%>
<%--    	--%>
<%--        $.ajax({--%>
<%--            type: "GET", //전송방식을 지정한다 (POST,GET)--%>
<%--            url: crawlUrl,//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.--%>
<%--            dataType: "json",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.--%>
<%--            error: function(){--%>
<%--                console.log("connection down!!!!");--%>
<%--            },--%>
<%--            success: function(data){--%>
<%--            	console.log(data);--%>
<%--            	$('#loading').hide();--%>

<%--                var str = "";--%>
<%--                var img = "";--%>
<%--                //--------------------------- Africa start --------------------------------------------------------%>
<%--                var africaMaxDate = new Date(data[0].date).valueOf();--%>
<%--                var africaContinent = "Africa";--%>
<%--                var africaTitle = data[0].title;--%>
<%--            	var africaLink = data[0].link;--%>
<%--            	var africaDateSplit = data[0].date.split("-");--%>
<%--            	var africaDay = africaDateSplit[2];--%>
<%--            	var africaMonth = "";--%>
<%--            	switch(africaDateSplit[1]) {--%>
<%--            		case "1": africaMonth = "JAN";--%>
<%--						break;--%>
<%--					case "2": africaMonth = "FEB";--%>
<%--						break;--%>
<%--					case "3": africaMonth = "MAR";--%>
<%--						break;--%>
<%--					case "4": africaMonth = "APR";--%>
<%--						break;--%>
<%--					case "5": africaMonth = "MAY";--%>
<%--						break;--%>
<%--					case "6": africaMonth = "JUN";--%>
<%--						break;--%>
<%--					case "7": africaMonth = "JUL";--%>
<%--						break;--%>
<%--					case "8": africaMonth = "AUG";--%>
<%--						break;--%>
<%--					case "9": africaMonth = "SEP";--%>
<%--						break;--%>
<%--					case "10": africaMonth = "OCT";--%>
<%--						break;--%>
<%--					case "11": africaMonth = "NOV";--%>
<%--						break;--%>
<%--					case "12": africaMonth = "DEC";--%>
<%--						break;--%>
<%--            	}--%>
<%--            	var africaYear = africaDateSplit[0];--%>
<%--            	var africaDate = africaDay + " " + africaMonth + " " + africaYear;--%>
<%--            	var africaType = data[0].type;--%>
<%--            	var africaImage = data[0].image;--%>
<%--            	//--------------------------- Asia start --------------------------------------------------------%>
<%--            	var asiaMaxDate = new Date(data[10].date).valueOf();--%>
<%--            	var asiaContinent = "Asia";--%>
<%--                var asiaTitle = data[10].title;--%>
<%--            	var asiaLink = data[10].link;--%>
<%--            	var asiaDateSplit = data[10].date.split("-");--%>
<%--            	var asiaDay = asiaDateSplit[2];--%>
<%--            	var asiaMonth = "";--%>
<%--            	switch(asiaDateSplit[1]) {--%>
<%--            		case "1": asiaMonth = "JAN";--%>
<%--						break;--%>
<%--					case "2": asiaMonth = "FEB";--%>
<%--						break;--%>
<%--					case "3": asiaMonth = "MAR";--%>
<%--						break;--%>
<%--					case "4": asiaMonth = "APR";--%>
<%--						break;--%>
<%--					case "5": asiaMonth = "MAY";--%>
<%--						break;--%>
<%--					case "6": asiaMonth = "JUN";--%>
<%--						break;--%>
<%--					case "7": asiaMonth = "JUL";--%>
<%--						break;--%>
<%--					case "8": asiaMonth = "AUG";--%>
<%--						break;--%>
<%--					case "9": asiaMonth = "SEP";--%>
<%--						break;--%>
<%--					case "10": asiaMonth = "OCT";--%>
<%--						break;--%>
<%--					case "11": asiaMonth = "NOV";--%>
<%--						break;--%>
<%--					case "12": asiaMonth = "DEC";--%>
<%--						break;--%>
<%--            	}--%>
<%--            	var asiaYear = asiaDateSplit[0];--%>
<%--            	var asiaDate = asiaDay + " " + asiaMonth + " " + asiaYear;--%>
<%--            	var asiaType = data[10].type;--%>
<%--            	var asiaImage = data[10].image;--%>
<%--            	//--------------------------- Europe start --------------------------------------------------------%>
<%--                var europeMaxDate = new Date(data[20].date).valueOf();--%>
<%--                var europeContinent = "Europe";--%>
<%--                var europeTitle = data[20].title;--%>
<%--            	var europeLink = data[20].link;--%>
<%--            	var europeDateSplit = data[20].date.split("-");--%>
<%--            	var europeDay = europeDateSplit[2];--%>
<%--            	var europeMonth = "";--%>
<%--            	switch(europeDateSplit[1]) {--%>
<%--            		case "1": europeMonth = "JAN";--%>
<%--						break;--%>
<%--					case "2": europeMonth = "FEB";--%>
<%--						break;--%>
<%--					case "3": europeMonth = "MAR";--%>
<%--						break;--%>
<%--					case "4": europeMonth = "APR";--%>
<%--						break;--%>
<%--					case "5": europeMonth = "MAY";--%>
<%--						break;--%>
<%--					case "6": europeMonth = "JUN";--%>
<%--						break;--%>
<%--					case "7": europeMonth = "JUL";--%>
<%--						break;--%>
<%--					case "8": europeMonth = "AUG";--%>
<%--						break;--%>
<%--					case "9": europeMonth = "SEP";--%>
<%--						break;--%>
<%--					case "10": europeMonth = "OCT";--%>
<%--						break;--%>
<%--					case "11": europeMonth = "NOV";--%>
<%--						break;--%>
<%--					case "12": europeMonth = "DEC";--%>
<%--						break;--%>
<%--            	}--%>
<%--            	var europeYear = europeDateSplit[0];--%>
<%--            	var europeDate = europeDay + " " + europeMonth + " " + europeYear;--%>
<%--            	var europeType = data[20].type;--%>
<%--            	var europeImage = data[20].image;--%>
<%--            	//--------------------------- america start --------------------------------------------------------%>
<%--            	var americaMaxDate = new Date(data[30].date).valueOf();--%>
<%--            	var americaContinent = "America";--%>
<%--                var americaTitle = data[30].title;--%>
<%--            	var americaLink = data[30].link;--%>
<%--            	var americaDateSplit = data[30].date.split("-");--%>
<%--            	var americaDay = americaDateSplit[2];--%>
<%--            	var americaMonth = "";--%>
<%--            	switch(americaDateSplit[1]) {--%>
<%--            		case "1": americaMonth = "JAN";--%>
<%--						break;--%>
<%--					case "2": americaMonth = "FEB";--%>
<%--						break;--%>
<%--					case "3": americaMonth = "MAR";--%>
<%--						break;--%>
<%--					case "4": americaMonth = "APR";--%>
<%--						break;--%>
<%--					case "5": americaMonth = "MAY";--%>
<%--						break;--%>
<%--					case "6": americaMonth = "JUN";--%>
<%--						break;--%>
<%--					case "7": americaMonth = "JUL";--%>
<%--						break;--%>
<%--					case "8": americaMonth = "AUG";--%>
<%--						break;--%>
<%--					case "9": americaMonth = "SEP";--%>
<%--						break;--%>
<%--					case "10": americaMonth = "OCT";--%>
<%--						break;--%>
<%--					case "11": americaMonth = "NOV";--%>
<%--						break;--%>
<%--					case "12": americaMonth = "DEC";--%>
<%--						break;--%>
<%--            	}--%>
<%--            	var americaYear = americaDateSplit[0];--%>
<%--            	var americaDate = americaDay + " " + americaMonth + " " + americaYear;--%>
<%--            	var americaType = data[30].type;--%>
<%--            	var americaImage = data[30].image;--%>
<%--            	--%>
<%--                for(var i = 0; i < data.length; i++) {--%>
<%--                	//--------------------------- Africa start --------------------------------------------------------%>
<%--                	if (data[i].continent == "africa") {--%>
<%--            			if (africaMaxDate == new Date(data[i].date).valueOf()) {--%>
<%--            				continue;--%>
<%--            			}--%>
<%--            			else if (africaMaxDate < new Date(data[i].date).valueOf()) {--%>
<%--            				africaMaxDate = new Date(data[i].date).valueOf();--%>
<%--            				africaTitle = data[i].title;--%>
<%--            				africaLink = data[i].link;--%>
<%--            				africaDateSplit = data[i].date.split("-");--%>
<%--                        	africaDay = africaDateSplit[2];--%>
<%--                        	africaMonth = "";--%>
<%--                        	switch(africaDateSplit[1]) {--%>
<%--                        		case "1": africaMonth = "JAN";--%>
<%--            						break;--%>
<%--            					case "2": africaMonth = "FEB";--%>
<%--            						break;--%>
<%--            					case "3": africaMonth = "MAR";--%>
<%--            						break;--%>
<%--            					case "4": africaMonth = "APR";--%>
<%--            						break;--%>
<%--            					case "5": africaMonth = "MAY";--%>
<%--            						break;--%>
<%--            					case "6": africaMonth = "JUN";--%>
<%--            						break;--%>
<%--            					case "7": africaMonth = "JUL";--%>
<%--           							break;--%>
<%--           						case "8": africaMonth = "AUG";--%>
<%--            						break;--%>
<%--            					case "9": africaMonth = "SEP";--%>
<%--            						break;--%>
<%--            					case "10": africaMonth = "OCT";--%>
<%--           							break;--%>
<%--           						case "11": africaMonth = "NOV";--%>
<%--           							break;--%>
<%--           						case "12": africaMonth = "DEC";--%>
<%--           							break;--%>
<%--                       		}--%>
<%--                        	africaYear = africaDateSplit[0];--%>
<%--            				africaDate = africaDay + " " + africaMonth + " " + africaYear;--%>
<%--            				africaType = data[i].type;--%>
<%--            				africaImage = data[i].image;--%>
<%--            			}--%>
<%--           				else if (africaMaxDate > new Date(data[i].date).valueOf()) {--%>
<%--           					continue;--%>
<%--           				}--%>
<%--                	}--%>
<%--                	//--------------------------- Asia start --------------------------------------------------------%>
<%--            		else if (data[i].continent == "asia") {--%>
<%--            			if (asiaMaxDate == new Date(data[i].date).valueOf()) {--%>
<%--            				continue;--%>
<%--            			}--%>
<%--            			else if (asiaMaxDate < new Date(data[i].date).valueOf()) {--%>
<%--            				asiaMaxDate = new Date(data[i].date).valueOf();--%>
<%--            				asiaTitle = data[i].title;--%>
<%--            				asiaLink = data[i].link;--%>
<%--            				asiaDateSplit = data[i].date.split("-");--%>
<%--            				asiaDay = asiaDateSplit[2];--%>
<%--            				asiaMonth = "";--%>
<%--                        	switch(asiaDateSplit[1]) {--%>
<%--                        		case "1": asiaMonth = "JAN";--%>
<%--            						break;--%>
<%--            					case "2": asiaMonth = "FEB";--%>
<%--            						break;--%>
<%--            					case "3": asiaMonth = "MAR";--%>
<%--            						break;--%>
<%--            					case "4": asiaMonth = "APR";--%>
<%--            						break;--%>
<%--            					case "5": asiaMonth = "MAY";--%>
<%--            						break;--%>
<%--            					case "6": asiaMonth = "JUN";--%>
<%--            						break;--%>
<%--            					case "7": asiaMonth = "JUL";--%>
<%--           							break;--%>
<%--           						case "8": asiaMonth = "AUG";--%>
<%--            						break;--%>
<%--            					case "9": asiaMonth = "SEP";--%>
<%--            						break;--%>
<%--            					case "10": asiaMonth = "OCT";--%>
<%--           							break;--%>
<%--           						case "11": asiaMonth = "NOV";--%>
<%--           							break;--%>
<%--           						case "12": asiaMonth = "DEC";--%>
<%--           							break;--%>
<%--                       		}--%>
<%--                        	asiaYear = asiaDateSplit[0];--%>
<%--                        	asiaDate = asiaDay + " " + asiaMonth + " " + asiaYear;--%>
<%--                        	asiaType = data[i].type;--%>
<%--                        	asiaImage = data[i].image;--%>
<%--            			}--%>
<%--           				else if (asiaMaxDate > new Date(data[i].date).valueOf()) {--%>
<%--           					continue;--%>
<%--           				}--%>
<%--            		}--%>
<%--                	//--------------------------- Europe start --------------------------------------------------------%>
<%--            		else if (data[i].continent == "europe") {--%>
<%--            			if (europeMaxDate == new Date(data[i].date).valueOf()) {--%>
<%--            				continue;--%>
<%--            			}--%>
<%--            			else if (europeMaxDate < new Date(data[i].date).valueOf()) {--%>
<%--            				europeMaxDate = new Date(data[i].date).valueOf();--%>
<%--            				europeTitle = data[i].title;--%>
<%--            				europeLink = data[i].link;--%>
<%--            				europeDateSplit = data[i].date.split("-");--%>
<%--            				europeDay = europeDateSplit[2];--%>
<%--            				europeMonth = "";--%>
<%--                        	switch(europeDateSplit[1]) {--%>
<%--                        		case "1": europeMonth = "JAN";--%>
<%--            						break;--%>
<%--            					case "2": europeMonth = "FEB";--%>
<%--            						break;--%>
<%--            					case "3": europeMonth = "MAR";--%>
<%--            						break;--%>
<%--            					case "4": europeMonth = "APR";--%>
<%--            						break;--%>
<%--            					case "5": europeMonth = "MAY";--%>
<%--            						break;--%>
<%--            					case "6": europeMonth = "JUN";--%>
<%--            						break;--%>
<%--            					case "7": europeMonth = "JUL";--%>
<%--           							break;--%>
<%--           						case "8": europeMonth = "AUG";--%>
<%--            						break;--%>
<%--            					case "9": europeMonth = "SEP";--%>
<%--            						break;--%>
<%--            					case "10": europeMonth = "OCT";--%>
<%--           							break;--%>
<%--           						case "11": europeMonth = "NOV";--%>
<%--           							break;--%>
<%--           						case "12": europeMonth = "DEC";--%>
<%--           							break;--%>
<%--                       		}--%>
<%--                        	europeYear = europeDateSplit[0];--%>
<%--                        	europeDate = europeDay + " " + europeMonth + " " + europeYear;--%>
<%--                        	europeType = data[i].type;--%>
<%--                        	europeImage = data[i].image;--%>
<%--            			}--%>
<%--           				else if (asiaMaxDate > new Date(data[i].date).valueOf()) {--%>
<%--           					continue;--%>
<%--           				}--%>
<%--            		}--%>
<%--                	//--------------------------- America start --------------------------------------------------------%>
<%--            		else if (data[i].continent == "america") {--%>
<%--            			if (americaMaxDate == new Date(data[i].date).valueOf()) {--%>
<%--            				continue;--%>
<%--            			}--%>
<%--            			else if (americaMaxDate < new Date(data[i].date).valueOf()) {--%>
<%--            				americaMaxDate = new Date(data[i].date).valueOf();--%>
<%--            				americaTitle = data[i].title;--%>
<%--            				americaLink = data[i].link;--%>
<%--            				americaDateSplit = data[i].date.split("-");--%>
<%--            				americaDay = americaDateSplit[2];--%>
<%--            				americaMonth = "";--%>
<%--                        	switch(americaDateSplit[1]) {--%>
<%--                        		case "1": americaMonth = "JAN";--%>
<%--            						break;--%>
<%--            					case "2": americaMonth = "FEB";--%>
<%--            						break;--%>
<%--            					case "3": americaMonth = "MAR";--%>
<%--            						break;--%>
<%--            					case "4": americaMonth = "APR";--%>
<%--            						break;--%>
<%--            					case "5": americaMonth = "MAY";--%>
<%--            						break;--%>
<%--            					case "6": americaMonth = "JUN";--%>
<%--            						break;--%>
<%--            					case "7": americaMonth = "JUL";--%>
<%--           							break;--%>
<%--           						case "8": americaMonth = "AUG";--%>
<%--            						break;--%>
<%--            					case "9": americaMonth = "SEP";--%>
<%--            						break;--%>
<%--            					case "10": americaMonth = "OCT";--%>
<%--           							break;--%>
<%--           						case "11": americaMonth = "NOV";--%>
<%--           							break;--%>
<%--           						case "12": americaMonth = "DEC";--%>
<%--           							break;--%>
<%--                       		}--%>
<%--                        	americaYear = americaDateSplit[0];--%>
<%--                        	americaDate = americaDay + " " + americaMonth + " " + americaYear;--%>
<%--                        	americaType = data[i].type;--%>
<%--                        	americaImage = data[i].image;--%>
<%--            			}--%>
<%--           				else if (asiaMaxDate > new Date(data[i].date).valueOf()) {--%>
<%--           					continue;--%>
<%--           				}--%>
<%--            		}--%>
<%--                }--%>
<%--                --%>
<%--              	//--------------------------- Africa start --------------------------------------------------------%>
<%--                str += "<li><b>" + africaContinent + "</b></li>";--%>
<%--                str += africaDate + " | " + africaType.toUpperCase() + "</br>";--%>
<%--                str += "<div class = \"ell\"><a href = \"" + africaLink + "\" target=\"_blank\" title=\"" + africaTitle + "\">";--%>
<%--                str += africaTitle + "</a></div>";--%>
<%--              	//--------------------------- Asia start --------------------------------------------------------%>
<%--                str += "<li><b>" + asiaContinent + "</b></li>";--%>
<%--                str += asiaDate + " | " + asiaType.toUpperCase() + "</br>";--%>
<%--                str += "<div class = \"ell\"><a href = \"" + asiaLink + "\" target=\"_blank\" title=\"" + asiaTitle + "\">";--%>
<%--                str += asiaTitle + "</a></div>";--%>
<%--              	//--------------------------- Europe start --------------------------------------------------------%>
<%--                str += "<li><b>" + europeContinent + "</b></li>";--%>
<%--                str += europeDate + " | " + europeType.toUpperCase() + "</br>";--%>
<%--                str += "<div class = \"ell\"><a href = \"" + europeLink + "\" target=\"_blank\" title=\"" + europeTitle + "\">";--%>
<%--                str += europeTitle + "</a></div>";--%>
<%--              	//--------------------------- America start --------------------------------------------------------%>
<%--                str += "<li><b>" + americaContinent + "</b></li>";--%>
<%--                str += americaDate + " | " + americaType.toUpperCase() + "</br>";--%>
<%--                str += "<div class = \"ell\"><a href = \"" + americaLink + "\" target=\"_blank\" title=\"" + americaTitle + "\">";--%>
<%--                str += americaTitle + "</a></div>";--%>
<%--       --%>
<%--              	//--------------------------- Image change start --------------------------------------------------------%>
<%--              	var imgNum = Math.round(Math.random()*4);--%>
<%--              	--%>
<%--              	if (imgNum == 0) {--%>
<%--              		img +="<a href=\"https://www.unep.org/\">";--%>
<%--              		img += "<img alt=\"UNEP site\" title=\"UN Environment Programme\"\height=\"153\" width=\"280\" class=\"media-element file-full\"";--%>
<%--              		img += "src=\"img/logo_unep.png\"></a>";--%>
<%--              	}--%>
<%--              	else if (imgNum == 1) {--%>
<%--              		if (africaImage != "") {--%>
<%--              			img += "<a href=\"" + africaLink + "\">";--%>
<%--                  		img += "<img alt=\"UNEP site\" title=\"" + africaTitle + "\"\height=\"153\" width=\"280\" class=\"media-element file-full\"";--%>
<%--              			img += "src=\"" + africaImage + "\"></a>";--%>
<%--              		}--%>
<%--              		else {--%>
<%--              			img += "<a href=\"" + africaLink + "\">";--%>
<%--                  		img += "<img alt=\"UNEP site\" title=\"" + africaTitle + "\"\height=\"153\" width=\"280\" class=\"media-element file-full\"";--%>
<%--                  		img += "src=\"img/logo_unep.png\"></a>";--%>
<%--              		}--%>
<%--              	}--%>
<%--              	else if (imgNum == 2) {--%>
<%--              		if (asiaImage != "") {--%>
<%--              			img += "<a href=\"" + asiaLink + "\">";--%>
<%--              			img += "<img alt=\"UNEP site\" title=\"" + asiaTitle + "\"\height=\"153\" width=\"280\" class=\"media-element file-full\""; --%>
<%--              			img += "src=\"" + asiaImage + "\"></a>";--%>
<%--              		}--%>
<%--              		else {--%>
<%--              			img += "<a href=\"" + asiaLink + "\">";--%>
<%--              			img += "<img alt=\"UNEP site\" title=\"" + asiaTitle + "\"\height=\"153\" width=\"280\" class=\"media-element file-full\"";--%>
<%--                  		img += "src=\"img/logo_unep.png\"></a>";--%>
<%--              		}--%>
<%--              	}--%>
<%--              	else if (imgNum == 3) {--%>
<%--              		if (europeImage != "") {--%>
<%--              			img += "<a href=\"" + europeLink + "\">";--%>
<%--              			img += "<img alt=\"UNEP site\" title=\"" + europeTitle + "\"\height=\"153\" width=\"280\" class=\"media-element file-full\"";--%>
<%--              			img += "src=\"" + europeImage + "\"></a>";--%>
<%--              		}--%>
<%--              		else {--%>
<%--              			img += "<a href=\"" + europeLink + "\">";--%>
<%--              			img += "<img alt=\"UNEP site\" title=\"" + europeTitle + "\"\height=\"153\" width=\"280\" class=\"media-element file-full\"";--%>
<%--                  		img += "src=\"img/logo_unep.png\"></a>";--%>
<%--              		}--%>
<%--              	}--%>
<%--              	else if (imgNum == 4) {--%>
<%--              		if (americaImage != "") {--%>
<%--              			img += "<a href=\"" + americaLink + "\">";--%>
<%--              			img += "<img alt=\"UNEP site\" title=\"" + americaTitle + "\"\height=\"153\" width=\"280\" class=\"media-element file-full\"";--%>
<%--              			img += "src=\"" + americaImage + "\"></a>";--%>
<%--              		}--%>
<%--              		else {--%>
<%--              			img += "<a href=\"" + americaLink + "\">";--%>
<%--              			img += "<img alt=\"UNEP site\" title=\"" + americaTitle + "\"\height=\"153\" width=\"280\" class=\"media-element file-full\"";--%>
<%--                  		img += "src=\"img/logo_unep.png\"></a>";--%>
<%--              		}--%>
<%--              	}--%>
<%--              	--%>
<%--                $("#resultUnepList").append(str);--%>
<%--                --%>
<%--                $("#resultUnepImage").append(img);--%>
<%--            }--%>
<%--        });--%>
<%--        --%>
<%--    });--%>

<%--</script>--%>

<!-- UNEP start -->

<div class="pane-content">
    <h2>UN Environment <br> Programme</h2>
    <div class="figure image mode-full" style="height: 150px; overflow: hidden">
        <a href="https://www.unep.org/"><img src="/img/unep.png" alt="unep" style="width: 280px;"></a>
    </div>
    <%--<ul class="article3">--%>
    <%--<div id="resultUnepList">--%>
    <%--	<div class="spinner-border" id="loading"></div>--%>
    <%--</div>--%>
    <c:forEach var="uvo" items="${list}">
        <div style="position: relative; width: 280px; height: 45px;">
            <div style="position: absolute; top: 0; left: 0; text-transform: capitalize; font-weight: bold;">${uvo.continent}</div>
            <div style="position: absolute; top: 0; right: 0; font-size: 14px;">${uvo.date}</div>
            <div style="position: absolute; bottom: 5px; width: 100%; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                <a href="${uvo.link}" style="text-decoration: none">${uvo.title}</a>
            </div>
        </div>
    </c:forEach>
    <%--</ul>--%>
</div>

<!-- UNEP end -->
 