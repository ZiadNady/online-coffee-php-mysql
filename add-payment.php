<?php
session_start();
include('includes/connection.php');
error_reporting(0);
if (strlen($_SESSION['login']) == 0) {
    header('location:loginmember.php');
} else {
    if (isset($_POST['addpayment'])) {
        $username = $_SESSION['username'];
        $cardnumber = $_POST['cardnumber'];
        $expiration = $_POST['expiration'];
        $cvv = $_POST['cvv'];
        $firstname = $_POST['firstname'];
        $lastname = $_POST['lastname'];
        if (strlen($_SESSION['login']) == 0) {
            header('location: loginmember.php');
        } else {
            if (isset($_POST['addpayment'])) {
                $username = $_SESSION['username'];
                $cardnumber = $_POST['cardnumber'];
                $expiration = $_POST['expiration'];
                $cvv = $_POST['cvv'];
                $firstname = $_POST['firstname'];
                $lastname = $_POST['lastname'];

                $errors = [];

                // Validate card number
                if (strlen($cardnumber) < 16) {
                    $errors[] = "Add payment method unsuccessful. Check your credit card number.";
                }

                // Validate expiration
                if (empty($expiration)) {
                    $errors[] = "Expiration is required.";
                }

                // Validate CVV
                if (empty($cvv)) {
                    $errors[] = "CVV is required.";
                }

                // Validate first name
                if (empty($firstname)) {
                    $errors[] = "First name is required.";
                }

                // Validate last name
                if (empty($lastname)) {
                    $errors[] = "Last name is required.";
                }

                if (empty($errors)) {
                    // Insert data into the database
                    $sql = "INSERT INTO credit (CardNumber, Expiration, CVV, FirstName, LastName, Username) VALUES (:cardnumber, :expiration, :cvv, :firstname, :lastname, :username)";
                    $query = $dbh->prepare($sql);
                    $query->bindParam(':username', $username, PDO::PARAM_STR);
                    $query->bindParam(':cardnumber', $cardnumber, PDO::PARAM_STR);
                    $query->bindParam(':expiration', $expiration, PDO::PARAM_STR);
                    $query->bindParam(':cvv', $cvv, PDO::PARAM_STR);
                    $query->bindParam(':firstname', $firstname, PDO::PARAM_STR);
                    $query->bindParam(':lastname', $lastname, PDO::PARAM_STR);
                    $query->execute();

                    $_SESSION['addcard'] = "Add payment method completely";
                    header('location: billing.php');
                }
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
        <script type="text/javascript" src='includes/jquery-3.4.1.min.js'></script>
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
    </head>
    <script>
        function checkCardnumberAvailability() {
            $("#loaderIcon").show();
            jQuery.ajax({
                url: "check_availability.php",
                data: 'cardnumber=' + $("#cardnumber").val(),
                type: "POST",
                success: function(data) {
                    $("#cardnumber-availability-status").html(data);
                    $("#loaderIcon").hide();
                },
                error: function() {}
            });
        }
    </script>

    <body>
        <?php include('includes/header.php'); ?>
        <div class="content-wrapper">
            <div class="container">
                <div class="row pad-botm">
                    <div class="col-md-12">
                        <h4 class="header-line">Credit card &nbsp<i class="far fa-credit-card"></i></h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-9 col-md-offset-1">
                        <div class="card">
                            <div class="panel-body" style="margin:20px">
                                <form action="" method="post" role="form" enctype="multipart/form-data">
                                    <div class="col-md-12">
                                        <?php if ($somethingwrong) { ?>
                                            <div class="alert alert-warning" role="alert">
                                                <?php echo htmlentities($somethingwrong); ?>
                                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                        <?php } ?>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Card number</label>
                                            <input class="form-control" type="text" name="cardnumber" maxlength="16" id="cardnumber" onBlur="checkCardnumberAvailability()" autocomplete="off" required />
                                            <span id="cardnumber-availability-status" style="font-size:12px;"></span>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Expiration</label>
                                            <input class="form-control" type="text" name="expiration" id="" autocomplete="off" required />
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label>CVV</label>
                                            <input class="form-control" type="text" name="cvv" id="" autocomplete="off" required />
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Firstname</label>
                                            <input class="form-control" type="text" name="firstname" id="" autocomplete="off" required />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Lastname</label>
                                            <input class="form-control" type="text" name="lastname" id="" autocomplete="off" required />
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <button type="submit" name="addpayment" class="create-account">Add credit card </button>
                                    </div>
                                </form>
                            <?php } ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <?php include('includes/footer.php'); ?>
        <script src="assets/js/jquery-1.10.2.js"></script>
        <script src="assets/js/bootstrap.js"></script>
        <script src="assets/js/custom.js"></script>
    </body>

    </html>