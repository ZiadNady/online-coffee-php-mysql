<?php
session_start();
include('includes/connection.php');
error_reporting(0);
if (strlen($_SESSION['login']) == 0) {
    header('location:loginmember.php');
} else {
    if (isset($_POST['add'])) {
        $username = $_SESSION['username'];
        $address = $_POST['address'];
        $amphure = $_POST['amphure'];
        $district = $_POST['district'];
        $province = $_POST['province'];
        $postalcode = $_POST['postalcode'];

        // Perform validation
        $errors = [];

        if (empty($address)) {
            $errors[] = "Address is required.";
        }

        if ($province == 0) {
            $errors[] = "Please select a province.";
        }

        if ($amphure == 0) {
            $errors[] = "Please select an amphure.";
        }

        if ($district == 0) {
            $errors[] = "Please select a district.";
        }

        if (empty($postalcode)) {
            $errors[] = "Postal code is required.";
        } elseif (!preg_match('/^\d{5}$/', $postalcode)) {
            $errors[] = "Postal code should be a 5-digit number.";
        }

        if (empty($errors)) {
            // Insert data into the database
            $sql = "INSERT INTO address (Address, ProvinceId, AmphureId, DistrictId, PostalCode, Username) VALUES (:address, :province, :amphure, :district, :postalcode, :username)";
            $query = $dbh->prepare($sql);
            $query->bindParam(':username', $username, PDO::PARAM_STR);
            $query->bindParam(':address', $address, PDO::PARAM_STR);
            $query->bindParam(':amphure', $amphure, PDO::PARAM_STR);
            $query->bindParam(':district', $district, PDO::PARAM_STR);
            $query->bindParam(':province', $province, PDO::PARAM_STR);
            $query->bindParam(':postalcode', $postalcode, PDO::PARAM_STR);
            $query->execute();

            $addresscom = "Your address has been added completely";
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

    <body>
        <?php include('includes/header.php'); ?>
        <div class="content-wrapper">
            <div class="container">
                <div class="row pad-botm">
                    <div class="col-md-12">
                        <h4 class="header-line">Add address</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-9 col-md-offset-1">
                        <div class="card">
                            <div class="panel-body" style="margin:20px">
                                <form name="update" method="post">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Address</label>&nbsp;<label for="" style="font-family: 'Oswald', sans-serif; color: red;">* </label>
                                            <textarea class="form-control" type="email" name="address" id="" value="" autocomplete="off" required></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Province</label>&nbsp;<label for="" style="font-family: 'Oswald', sans-serif; color: red;">* </label>
                                        <select name="province" id="province_id" class="form-control form-control-lg" onBlur="getAmphure()" required>
                                            <option value='0'> Select province </option>
                                            <?php
                                            $query = $dbh->prepare("SELECT * FROM provinces ORDER BY name_en");
                                            $query->execute();
                                            $provinceList = $query->fetchAll();
                                            foreach ($provinceList as $province) {
                                                echo "<option value='" . $province['id'] . "'>" . $province['name_en'] . "</option>";
                                            }
                                            ?>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Amphure</label>&nbsp;<label for="" style="color: red;">* </label>
                                        <select name="amphure" id="amphure_id" class="form-control form-control-lg">
                                            <option value='0'> Select amphure </option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>District</label>&nbsp;<label for="" style="color: red;">* </label>
                                        <select name="district" id="district_id" class="form-control form-control-lg">
                                            <option value='0'> Select district</option>
                                        </select>
                                    </div>
                                    <script type="text/javascript">
                                        $(document).ready(function() {
                                            $('#province_id').change(function() {
                                                var provinceid = $(this).val();
                                                $('#amphure_id').find('option').not(':first').remove();
                                                $('#district_id').find('option').not(':first').remove();
                                                $('#zipcode_id').find('option').not(':first').remove();
                                                $.ajax({
                                                    url: 'ajaxfile.php',
                                                    type: 'post',
                                                    data: {
                                                        request: 1,
                                                        provinceid: provinceid
                                                    },
                                                    dataType: 'json',
                                                    success: function(response) {
                                                        var len = response.length;
                                                        for (var i = 0; i < len; i++) {
                                                            var id = response[i]['id'];
                                                            var name_en = response[i]['name_en'];
                                                            $("#amphure_id").append("<option value='" + id + "'>" + name_en + "</option>");
                                                        }
                                                    }
                                                });
                                            });
                                            $('#amphure_id').change(function() {
                                                var amphureid = $(this).val();
                                                $('#district_id').find('option').not(':first').remove();
                                                $.ajax({
                                                    url: 'ajaxfile.php',
                                                    type: 'post',
                                                    data: {
                                                        request: 2,
                                                        amphureid: amphureid
                                                    },
                                                    dataType: 'json',
                                                    success: function(response) {
                                                        var len = response.length;
                                                        for (var i = 0; i < len; i++) {
                                                            var id = response[i]['id'];
                                                            var name_en = response[i]['name_en'];
                                                            $("#district_id").append("<option value='" + id + "'>" + name_en + "</option>");
                                                        }
                                                    }
                                                });
                                            });
                                        });
                                    </script>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Zip/Postal Code</label>&nbsp;<label for="" style="font-family: 'Oswald', sans-serif; color: red;">* </label>
                                            <input class="form-control" type="text" name="postalcode" id="zipcode" maxlength="5" autocomplete="off" required />
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <?php if ($addresscom) { ?>
                                            <div class="alert alert-success" role="alert">
                                                <?php echo htmlentities($addresscom); ?>
                                                <?php echo htmlentities($addresscom = ""); ?>
                                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <script>
                                                function emptyCart() {
                                                    <?php
                                                    $username = $_SESSION['username'];
                                                    $addressstatus = 2;
                                                    $sql = "UPDATE member SET AddressStatus=:addressstatus WHERE Username=:username";
                                                    $query = $dbh->prepare($sql);
                                                    $query->bindParam(':username', $username, PDO::PARAM_STR);
                                                    $query->bindParam(':addressstatus', $addressstatus, PDO::PARAM_STR);
                                                    $query->execute(); ?>
                                                }
                                            </script>
                                        <?php } ?>
                                    </div>
                                    <div class="col-md-12">
                                        <button type="submit" name="add" class="create-account"> Submit </button>&nbsp&nbsp&nbsp<a href="account.php" style="color: black;">Your current address here</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="assets/js/jquery-1.10.2.js"></script>
        <script src="assets/js/bootstrap.js"></script>
        <script src="assets/js/custom.js"></script>
    <?php } ?>
    </body>

    </html>