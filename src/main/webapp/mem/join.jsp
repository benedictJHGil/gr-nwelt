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
<jsp:include page="../inc/top.jsp"/>
  <!-- /.navbar -->

<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-12">
      <h2>JOIN</h2>
<div class="container">
<form>
  <div class="form-row">
    <div class="col-md-4 mb-2">
      <label for="validationServer01">E-mail</label>
      <input type="text" class="form-control is-valid" id="email" required>
      <div class="valid-feedback">
        Looks good!
      </div>
    </div>
    <div class="col-md-4 mb-2">
      <label for="validationServer02">Name</label>
      <input type="text" class="form-control is-valid" id="name" required>
      <div class="valid-feedback">
        Looks good!
      </div>
    </div>
  </div>
  
    <div class="form-row">
    <div class="col-md-4 mb-2">
      <label for="validationServer01">password</label>
      <input type="text" class="form-control is-valid" id="password" required>
      <div class="valid-feedback">
        Looks good!
      </div>
    </div>
    <div class="col-md-4 mb-2">
      <label for="validationServer02">password confirm</label>
      <input type="text" class="form-control is-valid" id="passwordconfirm" required>
      <div class="valid-feedback">
        Looks good!
      </div>
    </div>
  </div>
  
  <div class="form-group">
    <div class="form-check">
      <input class="form-check-input is-invalid" type="checkbox" value="" id="invalidCheck3" aria-describedby="invalidCheck3Feedback" required>
      <label class="form-check-label" for="invalidCheck3">
         &nbsp;  &nbsp; Agree to terms and conditions
      </label>
      <div  id="invalidCheck3Feedback" class="invalid-feedback">
        You must agree before submitting.
      </div>
    </div>
  </div>
  <button class="btn btn-primary" type="submit">Submit form</button>
</form>
</div>
    </div>
  </div>
</div>

<jsp:include page="../inc/bottom.jsp"/>

</body>
</html>
