<!doctype html>
<html lang="en">
<head>
  <title>Login | Lemonyx</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
 
  <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
	<div class="seccio">

	

 		
		<div> <!-- Contenidor -->
			
			<div class="row full-height justify-content-center">  <!-- Cemtrar el div general i ficarlo en columna -->

				<div class="col-12 text-center align-self-center py-5"> <!-- Centrar el texte i aliniarlo al centre-->

					<div class="section pb-5 pt-5 pt-sm-2 text-center"> <!-- Centrar texte i afegir separadors i espais -->

						<h6 class="mb-0 pb-3"><span>Iniciar sessió </span><span>Registre</span></h6>

						<!-- Icona fletxa giratoria -->
			          	<input class="checkbox" type="checkbox" id="reg-log" name="reg-log"/>
			          	<label for="reg-log"></label>

							
						<div class="card-3d-wrap mx-auto">
							<div class="card-3d-wrapper">
								<div class="cara">
									<div class="center-wrap">
										<div class="section text-center">
											<h4 class="mb-4 pb-3">Iniciar sessió</h4>
											<form action="login.php" method="post">

											<div class="form-group">
												<input type="text" class="form-style" name="usuari" id="usuari" placeholder="Usuari">
												<i class="input-icon uil uil-user"></i>
											</div>	
											<div class="form-group mt-2">
												<input type="password" class="form-style" name="psswdL" id="psswdL" placeholder="Contrasenya">
												<i class="input-icon uil uil-lock-alt"></i>
											</div>
											
											<input  class="btn mt-4" type="submit" value="Iniciar Sessio" id="Iniciar Sessio">
											<?php 
												

												if(isset($_GET["error"]) and $_GET["error"]=="true"){

													echo "<p style='font-size: 1.5rem; text-align: center; color: white;'>Credencials incorrectes</p>";

												}

												if(isset($_GET["error"]) and $_GET["error"]=="1"){

													echo "<p style='font-size: 1.5rem; text-align: center; color: white;'>Aquest usuari ja existeix.</p>";

												}

												if(isset($_GET["error"]) and $_GET["error"]=="2"){

													echo "<p style='font-size: 1.5rem; text-align: center; color: white;'>Contrasenya incorrecta.</p>";

												}

												if(isset($_GET["registre"]) and $_GET["registre"]=="true"){

													echo "<p style='font-size: 1.5rem; text-align: center; color: white;'>Datos insertados correctamente</p>";

												}
												
											?>

											<div id="error"></div>

												
											</form>
				      					</div>
			      					</div>
			      				</div>
								<div class="card-back">
									<div class="center-wrap">
										<div class="section text-center">
											<h4 class="mb-3 pb-3">Registre</h4>
											<form action="register.php" method="post">
											<div class="form-group">
												<input type="text" class="form-style" name="nom" id="nom" placeholder="Nom complet">
												<i class="input-icon uil uil-user"></i>
											</div>
											
											<div class="form-group">
												<input type="text" class="form-style" name="usuari" id="usuari" placeholder="Usuari">
												<i class="input-icon uil uil-user"></i>
											</div>	
                                            
                                            <div class="form-group mt-2">
												<input type="text" class="form-style" name="dni" id="dni" placeholder="DNI">
												<i class="input-icon fa fa-address-card-o"></i>
											</div>	

                                            <div class="form-group mt-2">
												<input type="text" class="form-style" name="edat" id="edat" placeholder="Edat naixement (any/mes/dia)">
                                                <i class="input-icon fa fa-calendar"></i>
											</div>	


                                            <div class="form-group mt-2">
                                            <input type="email" class="form-style" name="adreça" id="adreça" placeholder="Adreça electrònica">
                                            <i class="input-icon uil uil-at"></i>
                                            </div>

											<div class="form-group mt-2">
												<input type="tel" class="form-style" name="tel" id="tel" placeholder="Telèfon">
												<i class="input-icon uil uil-phone"></i>
											</div>
                                            
                                            <div class="form-group mt-2">
												<input type="tel" class="form-style" name="tarjeta" id="tarjeta" placeholder="Nùmero tarjeta">
												<i class="input-icon fa fa-credit-card"></i>
											</div>                                           
										
											<div class="form-group mt-2">
												<input type="password" class="form-style" name="psswd" id="psswd" placeholder="Contrasenya">
												<i class="input-icon uil uil-lock-alt"></i>
											</div>

											<div class="form-group mt-2">
												<input type="password" class="form-style" name="confirm_psswd" id="confirm_psswd" placeholder="Confirma la contrasenya">
												<i class="input-icon uil uil-lock-alt"></i>
												<span id="password_error" class="error"></span>
											</div>
											
											<input  class="btn mt-4" type="submit" value="enviar" id="enviar">


										</form>

										
				      					</div>
									
			      					</div>
			      				</div>
			      			</div>
			      		</div>
			      	</div>
		      	</div>
	      	</div>
	    </div>
	</div>
</body>



</html>
