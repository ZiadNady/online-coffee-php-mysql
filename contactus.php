<?php
session_start();
include('includes/connection.php');
error_reporting(0);

if (isset($_POST['submit'])) {
    $fname = $_POST['firstname'];
    $lname = $_POST['lastname'];
    $gemail = $_POST['emailguest'];
    $mobileno = $_POST['mobileno'];
    $comment = $_POST['comment'];

    // Validate required fields
    if (empty($fname) || empty($lname) || empty($gemail) || empty($mobileno) || empty($comment)) {
        $error = "All fields are required.";
    } else {
        // Validate email format
        if (!filter_var($gemail, FILTER_VALIDATE_EMAIL)) {
            $error = "Invalid email format.";
        } else {
            // Perform the database insertion
            $sql = "INSERT INTO guest (FirstName, LastName, EmailGuest, MobileNumber, Comment) VALUES (:fname, :lname, :gemail, :mobileno, :comment)";
            $query = $dbh->prepare($sql);
            $query->bindParam(':fname', $fname, PDO::PARAM_STR);
            $query->bindParam(':lname', $lname, PDO::PARAM_STR);
            $query->bindParam(':gemail', $gemail, PDO::PARAM_STR);
            $query->bindParam(':mobileno', $mobileno, PDO::PARAM_STR);
            $query->bindParam(':comment', $comment, PDO::PARAM_STR);

            if ($query->execute()) {
                $lastInsertId = $dbh->lastInsertId();
                if ($lastInsertId) {
                    $msg = "Send your comment to shop completed";
                } else {
                    $error = "Something went wrong. Please try again.";
                }
            } else {
                $error = "Database error. Please try again.";
            }
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
<style>
    .errorWrap {
        padding: 10px;
        margin: 0 0 20px 0;
        background: #fff;
        border-left: 4px solid #dd3d36;
        -webkit-box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
        box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
    }

    .succWrap {
        padding: 10px;
        margin: 0 0 20px 0;
        background: #fff;
        border-left: 4px solid #5cb85c;
        -webkit-box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
        box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
    }
</style>

<body>
    <?php include('includes/header.php'); ?>
    <form action="" method="post" enctype="multipart/form-data">
        <div class="container">
            <div class="row pad-botm">
                <div class="col-md-12">
                    <h4 class="header-new" style="text-align:center; font-family: 'Noto Sans JP', sans-serif; font-size: 22px;">Contact us or make a complaint</h4>
                </div>
            </div>
            <div class="card">
                <div class="panel-body" style="margin:20px">
                    <div class="panel-body" style="">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Your first name</label>
                                <input class="form-control" type="text" name="firstname" autocomplete="off" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Your last name</label>
                                <input class="form-control" type="text" name="lastname" autocomplete="off" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Your email</label>
                                <input class="form-control" type="email" name="emailguest" autocomplete="off" required />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Your mobile phone</label>
                                <input class="form-control" type="text" name="mobileno" autocomplete="off" required />
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Your comment</label>
                                <textarea class="form-control" type="password" name="comment" autocomplete="off" required></textarea>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <?php if ($error) { ?><div class="alert alert-danger" role="alert"><?php echo htmlentities($error); ?> </div><?php } else if ($msg) { ?><div class="alert alert-success" role="alert"><?php echo htmlentities($msg); ?> &nbsp<a href="register.php" class="alert-link">Do you want to join with us?</a></div><?php } ?>
                        </div>
                        <div class="col-md-12" style="margin-left:380px;margin-top:10px;">
                            <button type="submit" name="submit" class="create-account" id="submit"> Submit </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </form>
    <?php include('includes/footer.php'); ?>
</body>

</html>