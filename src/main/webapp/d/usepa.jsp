<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!-- dambi start -->

<div class="pane-content">
    <h2>US Environmental <br> Protection Agency</h2>
    <div class="figure image mode-full" style="height: 150px; overflow: hidden">
        <a href="https://www.epa.gov/"><img alt="usepa" src="/img/usepa.png" style="width: 280px;"></a>
    </div>
    <c:forEach var="uvo" items="${list}">
        <div style="position: relative; width: 280px; height: 45px;">
            <div style="position: absolute; top: 0; left: 0; text-transform: capitalize; font-weight: bold;">${uvo.topic}</div>
            <div style="position: absolute; bottom: 5px; width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                <a href="${uvo.link}" style="text-decoration: none">${uvo.title}</a>
            </div>
        </div>
    </c:forEach>
</div>

<!-- dambi end -->
