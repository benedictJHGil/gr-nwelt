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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  <link rel='shortcut icon' type='image/x-icon' href='https://<%=rootAddress%>/image/favicon.ico'>
  <link rel="icon" type="image/x-icon" href="https://<%=rootAddress%>/image/favicon.ico">
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  </style>
</head>

<script>
$(document).ready(function(){
	$('#searchBar').hide();
});
</script>

<body>

<!-- Navbar -->
<jsp:include page="../inc/top.jsp" />
  <!-- /.navbar -->

<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-12">
      <h2>LOGIN</h2>

<!-- Login Bootstrap -->
<form action="/LoginController" method="post" class="was-validated col-sm-5">
  <div class="form-group">
    <label for="uname">E-mail:</label>
    <input type="text" class="form-control" id="id" placeholder="Enter E-mail" name="id" required>
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  <div class="form-group">
    <label for="pwd">Password:</label>
    <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd" required>
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>

<!--  -->
    </div>
  </div>
</div>

<jsp:include page="../inc/bottom.jsp" />

</body>
</html>
