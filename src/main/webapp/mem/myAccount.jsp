<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  </style>
</head>
<body>

<!-- Navbar -->
<jsp:include page="../inc/top.jsp" />
  <!-- /.navbar -->

<div class="container" style="margin-top:30px">
  <div class="row">
   <!-- account side start -->
    <jsp:include page="../inc/mySide.jsp" />
 <!-- account side end -->
    <div class="col-sm-8">
      <h2>Account Info</h2>


<form>
  <div class="form-row">
    <div class="col-md-6 mb-3">
      <label for="validationServer01">First name</label>
      <input type="text" class="form-control is-valid" id="validationServer01" value="Mark" required>
      <div class="valid-feedback">
        Looks good!
      </div>
    </div>
    <div class="col-md-6 mb-3">
      <label for="validationServer02">Last name</label>
      <input type="text" class="form-control is-valid" id="validationServer02" value="Otto" required>
      <div class="valid-feedback">
        Looks good!
      </div>
    </div>
  </div>
  
    <div class="form-row">
    <div class="col-md-6 mb-3">
      <label for="validationServer01">E-Mail</label>
      <input type="text" class="form-control is-valid" id="validationServer01" value="Mark@mark.com" required>
      <div class="valid-feedback">
        Looks good!
      </div>
    </div>
    <div class="col-md-6 mb-3">
      <label for="validationServer02">password</label>
      <input type="text" class="form-control is-valid" id="validationServer02" value="******" required>
      <div class="valid-feedback">
        Looks good!
      </div>
    </div>
  </div>
  
  <div class="form-row">
    <div class="col-md-12">
      <label for="validationServer01">Address</label>
      <input type="text" class="form-control is-valid" id="validationServer01" value="1234 Main St" required>
      <div class="valid-feedback">
        Looks good!
      </div>
    </div>
 
  </div>
  
    <div class="form-row">
    <div class="col-md-12">
      <label for="validationServer01">Address2</label>
      <input type="text" class="form-control is-valid" id="validationServer01" value="Apartment, studio, or floor" required>
      <div class="valid-feedback">
        Looks good!
      </div>
    </div>
 
  </div>

  
  <div class="form-row">
    <div class="col-md-6 mb-3">
      <label for="validationServer03">City</label>
      <input type="text" class="form-control is-invalid" id="validationServer03" aria-describedby="validationServer03Feedback" required>
      <div id="validationServer03Feedback" class="invalid-feedback">
        Please provide a valid city.
      </div>
    </div>
    <div class="col-md-3 mb-3">
      <label for="validationServer04">State</label>
      <select class="custom-select is-invalid" id="validationServer04" aria-describedby="validationServer04Feedback" required>
        <option selected disabled value="">Choose...</option>
        <option>...</option>
      </select>
      <div id="validationServer04Feedback" class="invalid-feedback">
        Please select a valid state.
      </div>
    </div>
    <div class="col-md-3 mb-3">
      <label for="validationServer05">Zip</label>
      <input type="text" class="form-control is-invalid" id="validationServer05" aria-describedby="validationServer05Feedback" required>
      <div id="validationServer05Feedback" class="invalid-feedback">
        Please provide a valid zip.
      </div>
    </div>
  </div>

  <button class="btn btn-primary" type="submit">Modify</button>
</form>


    </div>
  </div>
</div>

<jsp:include page="../inc/bottom.jsp" />

</body>
</html>
