<?php
session_start();
include('includes/connection.php');
error_reporting(0);
if (strlen($_SESSION['alogin']) == 0) {
    header('location:../loginadmin.php');
} else {
    if (isset($_POST['update'])) {
        $sid = intval($_GET['sid']);
        $size = $_POST['sizename'];
        $ounce = $_POST['ounce'];

        $err = []; // Initialize an empty array to store errors

        // Perform form validation
        if (empty($size)) {
            $err[] = "size is required.";
        }
        if (empty($ounce)) {
            $err[] = "ounce is required.";
        }

        if (empty($err)) {

            $sql = "update size set SizeName=:size,Ounce=:ounce  where id=:sid";
            $query = $dbh->prepare($sql);
            $query->bindParam(':sid', $sid, PDO::PARAM_STR);
            $query->bindParam(':size', $size, PDO::PARAM_STR);
            $query->bindParam(':ounce', $ounce, PDO::PARAM_STR);
            $query->execute();

            $_SESSION['msg'] = "Update $size successfully";
            header('location:manage-size.php');
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
        <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
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

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <!-- BOOTSTRAP CORE STYLE  -->
        <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <!-- FONT AWESOME STYLE  -->
        <link href="assets/bs4/css/all.css" rel="stylesheet"> <!--load all styles -->

        <link href="assets/bs4/css/style.css" rel="stylesheet"> <!--load all styles -->

        <!-- CUSTOM STYLE  -->
        <link href="assets/css/style.css" rel="stylesheet" />
        <!-- GOOGLE FONT -->
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
        <!------MENU SECTION START-->
        <?php include('includes/header.php'); ?>
        <!-- MENU SECTION END-->
        <?php

        $sid = intval($_GET['sid']);
        $sql = "SELECT size.SizeName,size.Ounce,size.id as sid from size where size.id=:sid";

        $query = $dbh->prepare($sql);
        $query->bindParam(':sid', $sid, PDO::PARAM_STR);
        $query->execute();
        $results = $query->fetchAll(PDO::FETCH_OBJ);
        $cnt = 1;
        if ($query->rowCount() > 0) {
            foreach ($results as $result) {               ?>

                <form name="update" method="post">
                    <div class="content-wrapper">
                        <div class="container">
                            <div class="row pad-botm">
                                <div class="col-md-12">
                                    <h4 class="header-line" style="text-align:none; font-family: 'Noto Sans JP', sans-serif; font-size: 22px;"><?php echo htmlentities($result->SizeName); ?></h4>
                                </div>
                            </div>
                            <div class="card">
                                <div class="panel-body">

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Glass Size : </label>
                                            <?php echo htmlentities($result->SizeName); ?>
                                        </div>
                                    </div>

                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label>Enter Glass Size</label>
                                            <input class="form-control" type="text" name="sizename" id="" value="<?php echo htmlentities($result->SizeName); ?>" autocomplete="off" required />
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Enter Ounce</label>
                                            <input class="form-control" type="text" name="ounce" id="" value="<?php echo htmlentities($result->Ounce); ?>" autocomplete="off" required />
                                        </div>
                                    </div>

                            <?php }
                    } ?>
                            <div class="col-md-8">
                                <?php if ($error) { ?><div class="errorWrap"> <?php echo htmlentities($error); ?> </div><?php } else if ($msg) { ?><div class="alert alert-success" role="alert"> <?php echo htmlentities($msg); ?><button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button> </div><?php } ?>
                            </div>

                            <div class="col-md-12">
                                <button type="submit" name="update" class="create-account" style="margin-bottom:20px"> Update food </button>
                            </div>
                </form>
                </div>
                </div>
                </div>
                </div>
                </div>
                </div>

                <script src="assets/js/jquery-1.10.2.js"></script>
                <!-- BOOTSTRAP SCRIPTS  -->
                <script src="assets/js/bootstrap.js"></script>
                <!-- CUSTOM SCRIPTS  -->
                <script src="assets/js/custom.js"></script>
    </body>

    </html>
<?php } ?>