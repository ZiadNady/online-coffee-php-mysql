<?php
session_start();
include('includes/connection.php');
error_reporting(0);

if (strlen($_SESSION['login']) == 0) {
	header('location:loginmember.php');
} else {
	if (isset($_POST['updateadd'])) {
		// Validate and sanitize the input fields
		$username = $_SESSION['username'];
		$address = $_POST['address'];
		$amphure = $_POST['amphure'];
		$district = $_POST['district'];
		$province = $_POST['province'];
		$postalcode = $_POST['postalcode'];

		// Perform validation checks
		if (empty($address) || empty($amphure) || empty($district) || empty($province) || empty($postalcode)) {
			// Handle validation errors
			$error = "Please fill in all the required fields.";
			header("Location: add-address.php?error=" . urlencode($error));
			exit();
		}

		// Additional validation checks for specific fields
		// For example, you can check the format of the postal code

		// Insert the validated data into the SQL database
		$sql = "UPDATE address SET Address=:address, ProvinceId=:province, AmphureId=:amphure, DistrictId=:district, PostalCode=:postalcode WHERE Username=:username";
		$query = $dbh->prepare($sql);
		$query->bindParam(':username', $username, PDO::PARAM_STR);
		$query->bindParam(':address', $address, PDO::PARAM_STR);
		$query->bindParam(':amphure', $amphure, PDO::PARAM_STR);
		$query->bindParam(':district', $district, PDO::PARAM_STR);
		$query->bindParam(':province', $province, PDO::PARAM_STR);
		$query->bindParam(':postalcode', $postalcode, PDO::PARAM_STR);
		$query->execute();

		$comadd = "Your address has been updated";
		header('location: account.php');
	}

?>
	<h4 class="header-line">Your address</h4>
	<?php
	$username = $_SESSION['username'];
	$addressstatus = 1;
	$sql = "SELECT * FROM member WHERE Username=:username AND AddressStatus=:addressstatus";
	$query = $dbh->prepare($sql);
	$query->bindParam(':username', $username, PDO::PARAM_STR);
	$query->bindParam(':addressstatus', $addressstatus, PDO::PARAM_STR);
	$query->execute();
	$results = $query->fetchAll(PDO::FETCH_OBJ);
	$cnt = 1;
	if ($query->rowCount() > 0) {
		foreach ($results as $result) {               ?>
			<?php if ($result->AddressStatus == 1) { ?>
				<div class="alert alert-light" role="alert">
					You are not add your address
					&nbsp&nbsp<a href="add-address.php" style="color: black;">Add your address here</a>
				</div>
			<?php } else { ?>
			<?php } ?>
	<?php }
	} ?>
	<?php
	$username = $_SESSION['username'];
	$sql = "SELECT Address,Username,PostalCode,districts.name_en as Districts,amphures.name_en as Amphures,provinces.name_en as Provinces from  address join districts on address.DistrictId=districts.id join amphures on address.AmphureId=amphures.id join provinces on address.ProvinceId=provinces.id  where Username=:username";
	$query = $dbh->prepare($sql);
	$query->bindParam(':username', $username, PDO::PARAM_STR);
	$query->execute();
	$results = $query->fetchAll(PDO::FETCH_OBJ);
	$cnt = 1;
	if ($query->rowCount() > 0) {
		foreach ($results as $result) {               ?>
			<div class="col-md-5">
				<?php if ($comadd) { ?>
					<div class="alert alert-success" role="alert">
						<?php echo htmlentities($comadd); ?>
						<?php echo htmlentities($comadd = ""); ?>
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
				<?php } ?>
			</div>
			<div class="col-md-12">
				<div class="form-group">
					<i class="fas fa-map-marker-alt"></i>&nbsp <?php echo htmlentities($result->Address); ?>&nbsp <?php echo htmlentities($result->Districts); ?> &nbsp <?php echo htmlentities($result->Amphures); ?> &nbsp <?php echo htmlentities($result->Provinces); ?> &nbsp <?php echo htmlentities($result->PostalCode); ?>
				</div>
			</div>
			<div class="col-md-12">
				<a href="#demo" data-toggle="collapse"><button class="create-account">
						Edit address
					</button></a>
			</div>
	<?php }
	} ?>
	<div id="demo" class="collapse">
		<form action="" method="post" role="form" enctype="multipart/form-data">
			<div class="col-md-12">
				<div class="form-group">
					<label>Address</label>&nbsp;<label for="" style="font-family: 'Oswald', sans-serif; color: red;">* </label>
					<textarea class="form-control" type="text" name="address" id="" value="<?php echo htmlentities($result->Address); ?>" autocomplete="off" required><?php echo htmlentities($result->Address); ?></textarea>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label>District</label>
					<select name="district" id="district_id" class="form-control form-control-lg">
						<option value='0'> Select district</option>
					</select>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label>Amphures</label>
					<select name="amphure" id="amphure_id" class="form-control form-control-lg">
						<option value='0'> Select amphure </option>
					</select>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label>Provine</label>
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
			<div class="col-md-3">
				<div class="form-group">
					<label>Postal code</label>
					<input class="form-control" type="text" name="postalcode" id="" maxlength="5" value="<?php echo htmlentities($result->PostalCode); ?>" autocomplete="off" required />
				</div>
			</div>
			<div class="col-md-12">
				<button type="submit" name="updateadd" class="create-account">Update address </button>
			</div>
		</form>
	</div>
	<script src="assets/js/jquery-1.10.2.js"></script>
	<script src="assets/js/bootstrap.js"></script>
	<script src="assets/js/custom.js"></script>
<?php } ?>