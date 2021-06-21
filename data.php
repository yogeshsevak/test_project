<?php 
$conn = new mysqli("localhost", "", "", "");
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
$selectQ = "SELECT (SELECT part_number FROM product WHERE id = product_prices.product_id) as part_number, product_price, (SELECT category FROM company_category WHERE id = (SELECT company_name FROM users WHERE id = product_prices.user_id)) as category FROM product_prices";
$founData = $conn->query($selectQ);
?>
<!DOCTYPE html>
<html>
<title>Test</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap5.min.css" />
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.7.0/css/buttons.bootstrap5.min.css" />
<style>
.error{color:red;}
</style>
<body>
<div class="container">	
	<h1 class="text-center">Data</h1>
	<?php if ($founData->num_rows > 0){ ?>
	<div id="datalist_wrapper"><a href="index.php" class="btn btn-secondary">Back to Main Page</a></div>
	<table id="datalist" class="table table-striped" style="width:100%">
	<thead class="thead-dark">
		<tr>
		<th scope="col">No.</th>
		<th scope="col">Part Number</th>
		<th scope="col">Prices</th>
		<th scope="col">Category</th>
		</tr>
	</thead>
	<tbody>
		<?php $i=1; while($rowData = $founData->fetch_assoc()){ ?>
		<tr>
			<th scope="row"><?php echo $i; ?></th>
			<td><?php echo $rowData['part_number']; ?></td>
			<td><?php echo $rowData['product_price']; ?></td>
			<td><?php echo $rowData['category']; ?></td>
		</tr>
		<?php $i++; } ?>
	</tbody>
	</table>
<?php } ?>
</div>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.7.0/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.bootstrap5.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.print.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.colVis.min.js"></script>
<script>
	$(document).ready(function() {
		var table = $('#datalist').DataTable( {
			lengthChange: false,
			buttons: [ 'copy', 'excel', 'pdf', 'colvis' ]
		} );
	 
		table.buttons().container()
			.appendTo( '#datalist_wrapper' );
	} );
	</script>
</script>
</body>
</html>