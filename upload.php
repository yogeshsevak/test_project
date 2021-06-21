<?php 
if(isset($_POST['token']) && $_POST['token'] == 'QQFSFSDAWewAWEAW'){
	if($_FILES["datafile"]["error"] == 0){
		$ext = pathinfo($_FILES["datafile"]["name"], PATHINFO_EXTENSION);		
		if($ext == "csv"){
			$conn = new mysqli("localhost", "", "", "");
			if ($conn->connect_error) {
			  die("Connection failed: " . $conn->connect_error);
			}
			$filename = "File-".time().".".$ext;
			move_uploaded_file($_FILES["datafile"]["tmp_name"], $filename);
			$file = fopen($filename,'r');
			$final_array = $header = array();
			$i = 0;
			while (($data = fgetcsv($file, 10000, ",")) !== FALSE) 
			{
				if (empty($header)) {
					$header = $data;
					continue;
				}
				foreach ($data as $key => $value) {
					$kv = str_replace(" ","_",strtolower($header[$key]));
					if(!empty($value)){ $final_array[$i][$kv] = $value; }
				}
				$i++;
			}
			echo '<strong><a href="data.php">Click here for listing page</a></strong><br>';
			foreach($final_array as $f){
				if(isset($f['company_name'])){					
					$selectQ = "SELECT * FROM company_category WHERE company_name = '".trim($f['company_name'])."'";
					$founData = $conn->query($selectQ);
					if ($founData->num_rows > 0){
						while($rowData = $founData->fetch_assoc()) {
							$updatesql = "UPDATE company_category SET company_name='".$f['company_name']."', category='".$f['category']."' WHERE id=".$rowData['id'];
							if ($conn->query($updatesql) === TRUE) {
							  echo "Data updated successfully.<br>";
							} 
						}						
					}else{
						$insertsql = "INSERT INTO company_category(id, company_name, category) VALUES (NULL, '".$f['company_name']."', '".$f['category']."')";
						if ($conn->query($insertsql) === TRUE) {
							  echo "Data inserted successfully.<br>";
						}						
					}					
				}
				if(isset($f['part_number'])){
					$selectQ = "SELECT * FROM product_prices WHERE product_id = (SELECT id FROM product WHERE part_number Like '%".$f['part_number']."') AND user_id = (SELECT id FROM users WHERE company_name = (SELECT id FROM company_category WHERE category = '".$f['category']."'))";
					$founData = $conn->query($selectQ);
					if ($founData->num_rows > 0){
						while($rowData = $founData->fetch_assoc()) {
							$updatesql = "UPDATE product_prices SET product_price = '".$f['price']."' WHERE id = ".$rowData['id'];
							if ($conn->query($updatesql) === TRUE) {
							  echo "Data updated successfully.<br>";
							} 
						}						
					}else{
						$insertsql = "INSERT INTO product_prices(id, product_id, user_id, product_price) VALUES (NULL, (SELECT id FROM product WHERE part_number Like '%".$f['part_number']."'), (SELECT id FROM users WHERE company_name = (SELECT id FROM company_category WHERE category = '".$f['category']."')), '".$f['price']."')";
						if ($conn->query($insertsql) === TRUE) {
							  echo "Data inserted successfully.<br>";
						}						
					}					
				}
			}
			
            exit;
		}else{
			echo "Please upload valid file.";
		}
	}else{
		echo isset($_FILES["datafile"]["error"])?$_FILES["datafile"]["error"]:'Something Wrong.';		
	}	
}else{
	echo "Invalid Token.";
}
exit;
?>