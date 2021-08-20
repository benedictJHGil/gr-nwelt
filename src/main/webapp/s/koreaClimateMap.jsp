<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Include this file to obtain server's root address wherever using ajax!! --%>
<%@ include file="../rootAddress.jsp" %>
<%-----------------------------------------------------------------------------%>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=h6x7kaphse&callback=initMap"></script>
<%--<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=2um8xr8ytg&callback=initMap"></script>--%>
<script type="text/javascript" src="../s/greenCompanies.json"></script>
<script type="text/javascript">
	var map = null;
	var lat;
	var lng;

    $(document).ready(function(){
   	
    	navigator.geolocation.getCurrentPosition(function(pos) {
		    lat = pos.coords.latitude;
		    lng = pos.coords.longitude;
		    xmlData = $('#chargeCenterXml').children();
	    	initNaverMap(xmlData, lat, lng, 12, chargeCenterMarkerSeter, chargeCenterClickHandler, 'ChargeCenterTab');            			    
		});
    	
    	$('#navTab .nav-item').click(function(){
    		var tab = $(this).children().attr('id');
    		$('#navTab a.active').attr('class', 'nav-link');
    		$(this).children().attr('class', 'nav-link active');
    		
    		if(tab == 'GreenCompaniesTab'){
    	    	map.destroy();
    	    	initNaverMap(jsonData, 37.5666805, 126.9784147, 9, greenCompanieeMarkerSeter, greenCompanieesClickHandler, tab);
    		}
    		else if(tab == 'ChargeCenterTab'){
    			navigator.geolocation.getCurrentPosition(function(pos) {
    			    lat = pos.coords.latitude;
    			    lng = pos.coords.longitude;
    			    xmlData = $('#chargeCenterXml').children();
        	    	map.destroy();
        	    	initNaverMap(xmlData, lat, lng, 12, chargeCenterMarkerSeter, chargeCenterClickHandler, tab);            			    
    			});
    		}            		
		});    
    });
    
    function greenCompanieeMarkerSeter(data, markers, infoWindows, infoModals){    	
    	for (i=0; i< data.length; i++) {
        	
    	    var position = new naver.maps.LatLng(parseFloat(data[i].REFINE_WGS84_LAT), parseFloat(data[i].REFINE_WGS84_LOGT));
    	
     	    var marker = new naver.maps.Marker({
    	        map: map,
    	        position: position,
    	        zIndex: 100
    	    });
    	
    	    var infoWindow = new naver.maps.InfoWindow({
    	        content: '<div style="width:150px;text-align:center;padding:10px;font-size:80%;">'+ data[i].ENTRPS_NM +'</b></div>'
    	    });
    	
    	    markers.push(marker);
    	    infoWindows.push(infoWindow);    	    
    	}
    }
    
    function chargeCenterMarkerSeter(data, markers, infoWindows, infoModals, southWest, northEast){
    	
    	var i = 0;
     	$(data).find('item').each(function(){
     		var lat = $(this).find('lat').text();
     		var lng = $(this).find('lng').text();
     		
     		if((northEast.lat() > lat && lat > southWest.lat()) && (northEast.lng() > lng && lng > southWest.lng())){
     			
     			if( i == 0 ){
     				infoRegister($(this), lat, lng, markers, infoWindows, infoModals);
		    	    i++;
     			}
     			else {
     				if( infoModals[i-1].statId != $(this).find('statId').text() ){
     					infoRegister($(this), lat, lng, markers, infoWindows, infoModals);
    		    	    i++;
     				}
     				else {
     					infoModals[i-1].chgerId.push($(this).find('chgerId').text());
     				}
     			}
     		}
    	});
    }
    
    function infoRegister(this_, lat, lng, markers, infoWindows, infoModals){
    	var position = new naver.maps.LatLng(parseFloat(lat), parseFloat(lng));
    	
 	    var marker = new naver.maps.Marker({
	        map: map,
	        position: position,
	        zIndex: 100
	    });
	
	    var infoWindow = new naver.maps.InfoWindow({
	        content: '<div style="width:150px;text-align:center;padding:10px;font-size:80%;">'+ this_.find('statNm').text() +'</b></div>'
	    });
	    
	    var infoModal = new Object();
	    infoModal['statId'] = this_.find('statId').text();
	    infoModal['statNm'] = this_.find('statNm').text();
	    infoModal['chgerType'] = this_.find('chgerType').text();
	    infoModal['stat'] = this_.find('stat').text();
	    infoModal['addrDoro'] = this_.find('addrDoro').text();
	    infoModal['useTime'] = this_.find('useTime').text();
	    
	    infoModal['chgerId'] = [];
	    infoModal['chgerId'].push(this_.find('chgerId').text());
	    
	    markers.push(marker);
	    infoWindows.push(infoWindow);
	    infoModals.push(infoModal);
    }
	
    var move = false;
    
    function initNaverMap(data, centerLat, centerLog, zoomLevel, markerSeter, clickHandler, tab) {
        map = new naver.maps.Map('map', {
            center: new naver.maps.LatLng(centerLat, centerLog),
            zoom: zoomLevel
        });
        
        var bounds = map.getBounds(),
        southWest = bounds.getSW(),
        northEast = bounds.getNE(),
        lngSpan = northEast.lng() - southWest.lng(),
        latSpan = northEast.lat() - southWest.lat();

    	var markers = [],
    	infoWindows = [];
    	infoModals = [];
   
     	markerSeter(data, markers, infoWindows, infoModals, southWest, northEast);
    	
     	naver.maps.Event.addListener(map, 'idle', function() {
    	    updateMarkers(map, markers);
    	});
    	
    	function updateMarkers(map, markers) {
    	
    	    var mapBounds = map.getBounds();
    	    var marker, position;
    	
    	    for (var i = 0; i < markers.length; i++) {
    	
    	        marker = markers[i]
    	        position = marker.getPosition();
    	
    	        if (mapBounds.hasLatLng(position)) {
    	            showMarker(map, marker);
    	        } else {
    	            hideMarker(map, marker);
    	        }
    	    }
    	}
    	
    	function showMarker(map, marker) {
    	
    	    if (marker.setMap()) return;
    	    marker.setMap(map);
    	}
    	
    	function hideMarker(map, marker) {
    	
    	    if (!marker.setMap()) return;
    	    marker.setMap(null);
    	}
    	    	
    	for (var i=0, ii=markers.length; i<ii; i++) {
    	    naver.maps.Event.addListener(markers[i], 'click', clickHandler(data, markers, infoWindows, infoModals, i));
    	}
    	
		naver.maps.Event.addListener(map, 'zoom_changed', function(zoom) {
			lat = map.getCenter()._lat;
			lng = map.getCenter()._lng;
			newZoom = zoom;
			if(tab == 'ChargeCenterTab'){
				map.destroy();
	    		initNaverMap(data, lat, lng, newZoom, chargeCenterMarkerSeter, chargeCenterClickHandler, tab);
			}
	    });

	    naver.maps.Event.addListener(map, 'mousemove', function(bounds) {
	    	move = true;
	    });
	    
	    naver.maps.Event.addListener(map, 'mouseup', function(bounds) {
	    	lat = map.getCenter()._lat;
			lng = map.getCenter()._lng;
			zoom = map.getZoom();
			if(tab == 'ChargeCenterTab' && move){
				move = false;
				map.destroy();
	    		initNaverMap(data, lat, lng, zoom, chargeCenterMarkerSeter, chargeCenterClickHandler, tab);
			}
	    }); 
    }
    
	function greenCompanieesClickHandler(data, markers, infoWindows, infoModals, seq) {
	    return function(e) {
	        var marker = markers[seq],
	        infoWindow = infoWindows[seq];
	
	        if (infoWindow.getMap()) {
	            infoWindow.close();
	        } else {
	            infoWindow.open(map, marker);
	            $("#ENTRPS_NM").text(data[seq].ENTRPS_NM);
	            $("#CONTCT_NO").text(data[seq].CONTCT_NO);
	            $("#REPRSNTV_NM").text('대표자 : '+data[seq].REPRSNTV_NM);
	            $("#INDUTYPE_NM").text('분야 : '+data[seq].INDUTYPE_NM);
	            $("#REFINE_ROADNM_ADDR").text(data[seq].REFINE_ROADNM_ADDR);
	            $("#GreenCompanyModal").modal();
	        }
	    }
	}
	
	function chargeCenterClickHandler(data, markers, infoWindows, infoModals, seq) {
	    return function(e) {
	        var marker = markers[seq],
	        infoWindow = infoWindows[seq];
	        var chType;
	        var status;
	        
	        switch(infoModals[seq].chgerType)
	        {
	        	case '01' : chType = 'DC 차데모';
	        		break;
	        	case '03' : chType = 'DC 차데모 + AC 3상';
	        		break;
	        	case '06' : chType = 'DC 차데모 + AC 3상 + DC 콤보';
        			break;
	        }
	        
	        switch(infoModals[seq].stat)
	        {
	        	case '1' : status = '통신이상';
	        		break;
	        	case '2' : status = '충전대기';
	        		break;
	        	case '3' : status = '충전중';
        			break;
	        	case '4' : status = '운영중지';
    				break;
	        	case '5' : status = '점검중';
					break;
	        }
	
	        if (infoWindow.getMap()) {
	            infoWindow.close();
	        } else {
	            infoWindow.open(map, marker);
	            $("#statNm").text(infoModals[seq].statNm);
	            $("#addrDoro").text(infoModals[seq].addrDoro);
	            $("#chgerType").text('충전타입 : '+ chType);
	            $("#chgerId").text('충전기 수 : '+infoModals[seq].chgerId.length);
	            $("#useTime").text('이용시간 : '+infoModals[seq].useTime);
	            $("#stat").text('현재상태 : '+ status);
	            $("#ChargeCenterModal").modal();
	        }
	    }
	}

</script>
<!-- stefan start -->

<h2>MAP DATA</h2>
<ul class="nav nav-tabs" id="navTab">
	<li class="nav-item">
		<a class="nav-link active" href="javascript:void(0)" id="ChargeCenterTab">E-vehicle charge centers</a>
	<li>
	<li class="nav-item">
		<a class="nav-link" href="javascript:void(0)" id="GreenCompaniesTab">Green companies</a>
	</li>
</ul>
<div id="map" style="height: 500px;"></div>
<br>

<!-- The Modal -->
<div class="modal fade" id="GreenCompanyModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title" id="ENTRPS_NM">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <p id="REFINE_ROADNM_ADDR">sample</p>
        <p id="CONTCT_NO">data</p>
        <p id="REPRSNTV_NM"></p>
        <p id="INDUTYPE_NM"></p>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

<div class="modal fade" id="ChargeCenterModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title" id="statNm">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <p id="addrDoro">sample</p>
        <p id="chgerType">data</p>
        <p id="chgerId"></p>
        <p id="useTime"></p>
        <p id="stat"></p>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

<%--<div hidden id="chargeCenterXml">--%>
<%--<c:import url="http://open.ev.or.kr:8080/openapi/services/rest/EvChargerService?serviceKey=Br9ZD1jNUSVEWk2pzmFs4d6YxbkJ87tZQ%2BotT9cHiPf6xGKNwrR94bOypjcYra1PsaMIqaur86JPZkw3uI29Rw%3D%3D&" />--%>
<%--</div>--%>

<!-- stefan end -->