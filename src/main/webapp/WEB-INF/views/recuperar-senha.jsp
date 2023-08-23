<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recupera��o de conta de usu�rio</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css"/>
<style>
label.error {
	color: #d9534f;
}

input.error {
	border: 2px solid #d9534f;
}
</style>
</head>
<body>
	<div class="row mt-5">
		<div class="col-md-4 offset-4">
		<div class="card p-2">
			<div class="card-body">
				<h5 class="text-center">Esqueci minha senha</h5>
				<p class="text-center">Digite seu e-mail para recuperar sua senha:</p>
				
				<form id="formRecuperarSenha" action="recuperar-senha-post" method="post">

						<div class="mb-3">
						<label for="email" class="form-label">E-mail de acesso:</label> <input
							type="email" class="form-control" id="email" name="email"
							placeholder="Digite seu e-mail">
					</div>

					<div class="d-grid">
						<button type="submit" class="btn btn-primary">Recuperar minha senha</button>
					</div>

					<div class="d-grid mt-2"></div>
					<a href="/java_contasapp/" class="btn btn-light">J� possui uma conta? Acesse aqui!</a>

				</form>
			</div>
		</div>
	</div>
</div>

	<!-- Arquivos JavaScript -->
	<script src="resources/js/bootstrap.bundle.min.js"></script>
	<script src="resources/js/jquery-3.7.0.min.js"></script>
	<script src="resources/js/jquery.validate.min.js"></script>
	<script src="resources/js/additional-methods.min.js"></script>
	<script src="resources/js/messages_pt_BR.min.js"></script>

	<script>
		//quando a p�gina abrir, fa�a...
		$(document).ready(function(){
			//valida��o do formul�rio
			$("#formRecuperarSenha").validate({
				rules: {
					"email": {
						required: true,
						email : true
					}
				messages: {
	 				"email": {
						required: "O campo e-mail n�o pode ficar vazio.",
						email: "Digite um e-mail v�lido."
	 					}
	 				}
	 			}
			});
		})
	</script>

</body>
</html>