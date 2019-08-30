<?php

		require_once "models/conexion.php";
		$pdo = Conexion::conectar();
		//$conecta = new conexion();
		//$conecta->conectar();
		//$usuario=$_REQUEST['usu'];
	    $password=$_REQUEST['pas'];
	    //$password=$_POST['pas'];

	 	
	    //echo $usuario;
			//$link = new PDO("mysql:host=localhost;dbname=casino","root","root");
			$res=$pdo->query("select codemp,nombres,apeldos,codusu from empleados where codusu='$password' and estado=1" );
	    	//$res=$pdo->query("CALL  usuarios ('$password')");
			//$respuesta = DatosAndroid::ingresoUsuarioModel($datosController, "usuarios");

			$datos=array();
			
			foreach ($res as $row => $valor) {

					$datos=$valor;
					
			}
					

			echo json_encode($datos);

					echo 'Cedula';		
					echo $valor['codemp'];	
					echo '<br>';	
					echo 'Debajo y antes del Json';		
					echo '<br>';	
					$cc=$valor['codemp'];
					echo '<br>';	
					echo 'nueva Cedula';	
					echo $cc;

			
			//$pdo->next_result();
			/*$stm=("INSERT INTO registrodiario (codemp,fecha_hora,cant,estado) VALUES ($cc,localtime(),'1','1')");
			$q = $pdo->prepare($stm);
			$q->execute(array($cc,'localtime()','1','1')); */

			$stm=$pdo->query("CALL insert_registro ('$cc')");

			//echo json_encode($stm);

			//$pdo->close();
			

?>