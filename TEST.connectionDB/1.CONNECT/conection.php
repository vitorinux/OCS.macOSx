<?php
function conection(){
    global $conection;
$conection = mysqli_connect('172.20.30.105','vmtest','madrid','dbtesting');

	if(mysqli_connect_errno()){
		echo "La conexión no pudo realizarse con exito:%S\n",  mysqli_connect_error();
		exit();
	}
echo "CONNECTED SUCCESSFULLY";
}
?>

