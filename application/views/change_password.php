<html>
<head>
<title>Change Password Form</title>
</head>
<style>
.row {
	margin-top: 10px;
	margin-bottom:10px
}
</style>
<body>

	<h2>Login form</h2>

<?php echo validation_errors(); ?>

<?php echo form_open_multipart('api/donor/changePassword'); ?>

	<div class="row">
		<label>password</label> <input type="text" name="password"
			value="" size="15" />
	</div>


	<div class="row">
		<label>Confirm Password</label> <input type="text" name="confirm_password" value=""
			size="10" />
	</div>

	<input type="submit" value="submit" />

<?php echo form_close(); ?>
</body>
</html>