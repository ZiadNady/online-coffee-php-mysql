<?php
session_start();
error_reporting(0);
include('includes/connection.php');

if (isset($_POST['change'])) {
  $email = $_POST['email'];
  $mobileno = $_POST['mobileno'];
  $newpassword = md5($_POST['newpassword']);
  $confirmpassword = md5($_POST['confirmpassword']);

  // Server-side validation
  if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $error = "Invalid email format";
  } elseif (strlen($mobileno) != 10 || !is_numeric($mobileno)) {
    $error = "Invalid mobile number format";
  } elseif ($newpassword !== $confirmpassword) {
    $error = "New password and Confirm new password do not match";
  } else {
    // Sanitize the input
    $email = htmlspecialchars($email);
    $mobileno = htmlspecialchars($mobileno);

    // Check if email and mobile number exist in the database
    $sql = "SELECT EmailId FROM member WHERE EmailId=:email AND MobileNumber=:mobileno";
    $query = $dbh->prepare($sql);
    $query->bindParam(':email', $email, PDO::PARAM_STR);
    $query->bindParam(':mobileno', $mobileno, PDO::PARAM_STR);
    $query->execute();

    if ($query->rowCount() > 0) {
      // Update the password
      $updateSql = "UPDATE member SET Password=:newpassword WHERE EmailId=:email AND MobileNumber=:mobileno";
      $updateQuery = $dbh->prepare($updateSql);
      $updateQuery->bindParam(':newpassword', $newpassword, PDO::PARAM_STR);
      $updateQuery->bindParam(':email', $email, PDO::PARAM_STR);
      $updateQuery->bindParam(':mobileno', $mobileno, PDO::PARAM_STR);
      $updateQuery->execute();

      $_SESSION['pwccorrect'] = "Your password has been successfully changed";
      header('location: loginmember.php');
      exit();
    } else {
      $error = "Email or Mobile number is incorrect";
    }
  }
}
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <?php
  $sql = "SELECT * from  shop ";
  $query = $dbh->prepare($sql);
  $query->execute();
  $results = $query->fetchAll(PDO::FETCH_OBJ);
  $cnt = 1;
  if ($query->rowCount() > 0) {
    foreach ($results as $result) {               ?>
      <title><?php echo htmlentities($result->ShopName); ?></title>
  <?php }
  } ?>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <link href="assets/css/bootstrap.css" rel="stylesheet" />
  <link href="assets/bs4/css/all.css" rel="stylesheet">
  <link href="assets/bs4/css/style.css" rel="stylesheet">
  <link href="assets/css/style.css" rel="stylesheet" />
  <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Abel&family=Barlow:wght@200;400&family=Bebas+Neue&family=Fjalla+One&family=Fredoka+One&family=Josefin+Sans&family=Open+Sans:wght@300&family=Staatliches&display=swap" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Orelega+One&display=swap" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Asap:wght@400&display=swap" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@900&display=swap" rel="stylesheet">
  <script type="text/javascript">
    function valid() {
      if (document.change.newpassword.value != document.change.confirmpassword.value) {
        alert("New password and Confirm new password do not match");
        document.change.confirmpassword.focus();
        return false;
      }
      return true;
    }
  </script>
  <script>
    function checkEmailRegAvailability() {
      $("#loaderIcon").show();
      jQuery.ajax({
        url: "check_availability.php",
        data: 'emailreg=' + $("#emailreg").val(),
        type: "POST",
        success: function(data) {
          $("#emailreg-availability-status").html(data);
          $("#loaderIcon").hide();
        },
        error: function() {}
      });
    }
  </script>
</head>

<body>
  <?php include('includes/header.php'); ?>
  <form action="" method="post" enctype="multipart/form-data" onSubmit="return valid();" name="change">
    <div class="container">
      <div class="row pad-botm">
        <div class="col-md-12">
          <h4 class="header-new" style="text-align:center; font-family: 'Noto Sans JP', sans-serif; font-size: 22px;">Forget password</h4>
        </div>
      </div>
      <div class="card">
        <div class="panel-body" style="margin:50px">
          <div class="form-group">
            <label>Your register email</label>
            <input class="form-control" type="text" name="email" id="emailreg" onBlur="checkEmailRegAvailability()" autocomplete="off" required />
            <span id="emailreg-availability-status" style="font-size:12px;"></span>
          </div>
          <div class="form-group">
            <label>Your register mobile number</label>
            <input class="form-control" type="text" name="mobileno" autocomplete="off" required />
          </div>
          <div class="form-group">
            <label>New password</label>
            <input class="form-control" type="password" name="newpassword" required autocomplete="off" />
          </div>
          <div class="form-group">
            <label>Confirm new password</label>
            <input class="form-control" type="password" name="confirmpassword" required autocomplete="off" />
          </div>
          <div class="form-group">
            <?php if ($error) { ?>
              <div class="alert alert-danger" role="alert">
                <?php echo htmlentities($error); ?>
                <?php echo htmlentities($error = ""); ?>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
            <?php } ?>
          </div>
          <div class="col-md-6" style="margin-left:280px;margin-top:10px;">
            <button type="submit" name="change" class="create-account" id="submit"> Submit to change </button>
          </div>
        </div>
      </div>
    </div>
  </form>
  <?php include('includes/footer.php'); ?>
  <script src="assets/js/jquery-1.10.2.js"></script>
  <script src="assets/js/bootstrap.js"></script>
  <script src="assets/js/custom.js"></script>
</body>

</html>