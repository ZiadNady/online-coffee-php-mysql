<?php
session_start();
error_reporting(0);
include('includes/connection.php');

if ($_SESSION['alogin'] != '') {
  $_SESSION['alogin'] = '';
}

if (isset($_POST['login'])) {
  $username = $_POST['username'];
  $password = md5($_POST['password']);

  // Validate the form input
  if (empty($username) || empty($password)) {
    $msg_error = "Username or Password is empty!";
  } else {
    // Prepare the SQL statement with placeholders
    $sql = "SELECT UserName, Password, Status FROM employee WHERE UserName = :username AND Password = :password";
    $query = $dbh->prepare($sql);

    // Bind the values to the placeholders
    $query->bindParam(':username', $username, PDO::PARAM_STR);
    $query->bindParam(':password', $password, PDO::PARAM_STR);

    // Execute the prepared statement
    $query->execute();

    // Fetch the results
    $results = $query->fetchAll(PDO::FETCH_OBJ);

    if ($query->rowCount() > 0) {
      foreach ($results as $result) {
        $_SESSION['username'] = $result->UserName;
        if ($result->Status == 1) {
          $_SESSION['alogin'] = $_POST['username'];
          echo "<script type='text/javascript'> document.location ='admin/manage-order.php'; </script>";
        } else {
          $error = "Your Account Has been blocked";
        }
      }
    } else {
      $msg_error = "Username or Password is incorrect!";
    }
  }
}
?>
<html lang="en">

<head>
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
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
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
</head>

<body>
  <?php include('includes/header.php'); ?>
  <form action="" method="post" role="form" enctype="multipart/form-data">
    <div class="container">
      <div class="row pad-botm">
        <div class="col-md-12">
          <h4 class="header-new" style="text-align:center; font-family: 'Noto Sans JP', sans-serif; font-size: 22px;">Staff sign in to shop management</h4>
        </div>
      </div>
      <div class="card">
        <div class="panel-body" style="margin:50px">
          <div class="form-group">
            <?php if ($_SESSION['msg'] != "") { ?>
              <div class="alert alert-success" role="alert">
                <?php echo htmlentities($_SESSION['msg']); ?>
                <?php echo htmlentities($_SESSION['msg'] = ""); ?>
                &nbsp<a href="" class="alert-link">Please check your email</a>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
            <?php } ?>
            <?php if ($_SESSION['pwccorrect'] != "") { ?>
              <div class="alert alert-success" role="alert">
                <?php echo htmlentities($_SESSION['pwccorrect']); ?>
                <?php echo htmlentities($_SESSION['pwccorrect'] = ""); ?>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
            <?php } ?>
            <?php if ($error) { ?>
              <div class="alert alert-warning" role="alert">
                <?php echo htmlentities($error); ?>
                <?php echo htmlentities($error = ""); ?>
                &nbsp<a href="contactus.php" class="alert-link">Please contact us</a>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
            <?php } ?>
            <?php if ($msg_error) { ?>
              <div class="alert alert-danger" role="alert">
                <?php echo htmlentities($msg_error); ?>
                <?php echo htmlentities($msg_error = ""); ?>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
            <?php } ?>
          </div>
          <div class="form-group">
            <label>Username</label>
            <input class="form-control" type="text" name="username" autocomplete="off" required />
          </div>
          <div class="form-group">
            <label>Password</label>
            <input class="form-control" type="password" name="password" required autocomplete="off" />
          </div>
          <button type="submit" name="login" class="create-account" style="margin-left:390px;margin-top:10px;"> Login </button>
        </div>
      </div>
    </div>
    </div>
  </form>
  <?php include('includes/footer.php'); ?>
  <script src="assets/js/jquery-1.10.2.js"></script>
  <script src="assets/js/bootstrap.js"></script>
</body>

</html>