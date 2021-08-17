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
  <link rel='shortcut icon' type='image/x-icon' href='http://<%=rootAddress%>/image/favicon.ico'>
  <link rel="icon" type="image/x-icon" href="http://<%=rootAddress%>/image/favicon.ico">  
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  
  </style>
</head>
<body>

<!-- Navbar -->
<jsp:include page="../inc/top.jsp"></jsp:include>
  <!-- /.navbar -->

<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-12">
      <h2>EVENT</h2>
      <h5>Title description, Dec 7, 2017</h5>

<form>
    <div class="form-group">
  <div class="row">
    <div class="col">
      <input type="text" class="form-control" placeholder="User info" readonly="readonly">
    </div>
    <div class="col">
      <input type="text" class="form-control" placeholder="hits number" readonly="readonly">
    </div>
  </div>
  </div>
  
    <div class="form-group">
  <div class="row">
    <div class="col">
      <input type="text" class="form-control" placeholder="max mem countt & current joined mem">
    </div>
    <div class="col">
      <input type="text" class="form-control" placeholder="date" readonly="readonly">
    </div>
  </div>
  </div>
  
      <div class="form-group">
  <div class="row">
    <div class="col">
      <input type="text" class="form-control" placeholder="Opne to public or not">
    </div>
    <div class="col">
      <input type="text" class="form-control" placeholder="password">
    </div>
  </div>
  </div>
  
    <div class="form-group">
    <label for="exampleFormControlInput1">Subject</label>
    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Subject">
  </div>
  
 
  <div class="form-group">
    <label for="exampleFormControlTextarea1">Content</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="11"></textarea>
    
  </div>
  
 
<!--
  <div class="custom-control custom-checkbox mb-3">
    <input type="checkbox" class="custom-control-input" id="customControlValidation1" required>
    <label class="custom-control-label" for="customControlValidation1">Check this custom checkbox</label>
    <div class="invalid-feedback">Example invalid feedback text</div>
  </div>

  <div class="custom-control custom-radio">
    <input type="radio" class="custom-control-input" id="customControlValidation2" name="radio-stacked" required>
    <label class="custom-control-label" for="customControlValidation2">Toggle this custom radio</label>
  </div>
  <div class="custom-control custom-radio mb-3">
    <input type="radio" class="custom-control-input" id="customControlValidation3" name="radio-stacked" required>
    <label class="custom-control-label" for="customControlValidation3">Or toggle this other custom radio</label>
    <div class="invalid-feedback">More example invalid feedback text</div>
  </div>
  <div class="mb-3">
    <select class="custom-select" required>
      <option value="">Choose...</option>
      <option value="1">One</option>
      <option value="2">Two</option>
      <option value="3">Three</option>
    </select>
    <div class="invalid-feedback">Example invalid custom select feedback</div>
  </div>
-->

  
      <div class="form-group">
  <div class="row">
    <div class="col">
      <input type="text" class="form-control" placeholder="Meeting date">
    </div>
    <div class="col">
      <input type="button" class="form-control" value="❤" readonly="readonly">
    </div>
  </div>
  </div>
  
  
  <div class="custom-file mb-3">
    <input type="file" class="custom-file-input" id="validatedCustomFile" required>
    <label class="custom-file-label" for="validatedCustomFile">Choose file...</label>
    <div class="invalid-feedback">Example invalid custom file feedback</div>
  </div>
  
<!--
  <div class="mb-3">
    <div class="input-group is-invalid">
      <div class="input-group-prepend">
        <span class="input-group-text" id="validatedInputGroupPrepend">@</span>
      </div>
      <input type="text" class="form-control is-invalid" aria-describedby="validatedInputGroupPrepend" required>
    </div>
    <div class="invalid-feedback">
      Example invalid input group feedback
    </div>
  </div>

  <div class="mb-3">
    <div class="input-group is-invalid">
      <div class="input-group-prepend">
        <label class="input-group-text" for="validatedInputGroupSelect">Options</label>
      </div>
      <select class="custom-select" id="validatedInputGroupSelect" required>
        <option value="">Choose...</option>
        <option value="1">One</option>
        <option value="2">Two</option>
        <option value="3">Three</option>
      </select>
    </div>
    <div class="invalid-feedback">
      Example invalid input group feedback
    </div>
  </div>

  <div class="input-group is-invalid">
    <div class="custom-file">
      <input type="file" class="custom-file-input" id="validatedInputGroupCustomFile" required>
      <label class="custom-file-label" for="validatedInputGroupCustomFile">Choose file...</label>
    </div>
    <div class="input-group-append">
       <button class="btn btn-outline-secondary" type="button">Button</button>
    </div>
  </div>
  <div class="invalid-feedback">
    Example invalid input group feedback
  </div>
 -->
 
   <div class="form-group row">
    <div class="col-sm-1">
      <button type="submit" class="btn btn-primary">Register</button>
    </div>
    
        <div class="col-sm-1">
      <button type="submit" class="btn btn-primary">List</button>
    </div>
    
  </div>
  
</form>



    </div>
  </div>
</div>

<jsp:include page="../inc/bottom.jsp"></jsp:include>

</body>
</html>
