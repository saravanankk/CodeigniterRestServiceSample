<html>
<head>
<title>Registartion Form</title>
</head>
<style>
.row {
	margin-top: 10px;
	margin-bottom:10px
}
</style>
<body>

	<h2>Registration form</h2>

<?php echo validation_errors(); ?>

<?php echo form_open_multipart('api/donor/register'); ?>

<div class="row">
		<label>Username</label> <input type="text" name="name" value=""
			size="50" />
	</div>

	<div class="row">
		<label>Password</label> <input type="text" name="password" value=""
			size="10" />
	</div>

	<div class="row">
		<label>Confirm Password</label> <input type="text" name="passwordcnf"
			value="" size="10" />
	</div>

	<div class="row">
		<label>Email</label> <input type="text" name="email" value=""
			size="50" />
	</div>

	<div class="row">
		<label>Date of birth</label>
		<!--  date picker -->
		<input type="text" name="date_of_birth" value="1988-06-29" size="50" />
	</div>

	<div class="row">
		<label>Mobile Number</label> <input type="text" name="mobile_no"
			value="" size="15" />
	</div>

	<div class="row">
		<label>Landline Number</label> <input type="text" name="land_line_no"
			value="" size="10" />
	</div>

	<div class="row">
		<label>Gender</label> Male<input type="radio" name="gender" value="M">
		FeMale<input type="radio" name="gender" value="F">
	</div>

	<div class="row">
		<label>Blood Group</label> 
		<select name="blood_group_id">
		<option value="1">1</option>
		<option value="2">2</option>
		</select>
	</div>

	<div class="row">
		<label>Weight</label> <input type="text" name="weight" value=""
			size="5" />
	</div>


	<div class="row">
		<label>Address</label>
		<textarea rows="3" cols="10" name="address"></textarea>
	</div>

	<div class="row">
		<label>State</label> <input type="text" name="state" value="30"
			size="10" />
	</div>

	<div class="row">
		<label>district</label> <input type="text" name=district value="9"
			size="10" />
	</div>

	<div class="row">
		<label>Area</label>
		<!--  Auto suggest box -->
		<input type="text" name="area" value="" size="10" />
	</div>

	<div class="row">
		<label>Pincode</label>
		<!--  Auto suggest box -->
		<input type="text" name="pincode" value="" size="10" />
	</div>

	<div class="row">
		<label>Avilable to donate</label> <input type="checkbox"
			name="avilable_to_donate" />
	</div>

	<input type="file" name="profilephoto"  />
	
	<input type="hidden" name="geo_location" value="" />

	<input type="submit" value="submit" />

<?php echo form_close(); ?>
</body>
</html>