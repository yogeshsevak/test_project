<!DOCTYPE html>
<html>
<title>Test</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
.error{color:red;}
</style>
<body>
<div class="container">	
	<h1 class="text-center">Upload Data</h1>	
	<form name="uploadForm" action="upload.php" method="post" enctype="multipart/form-data">
		<div class="row">
		  <div class="form-group"><input type="file" class="form-control-file required" placeholder="Upload csv here.." name="datafile" id="datafile" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel"></div>
		  <div class="form-group"><input type="text" name="token" id="token" placeholder="Token" class="form-control required"></div>
		  <div class="form-group text-center"><input type="submit" value="Upload" name="submit" class="btn btn-primary"></div>	
		</div>
	</form>	
</div>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/additional-methods.min.js"></script>
<script>
$("form[name='uploadForm']").validate({
	errorClass: "error",
	errorElement: 'span',	
});
</script>
</body>
</html>