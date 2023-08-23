<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Autenticação de usuário</title>
<!-- FOLHAS DE ESTILO CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css"
	type="text/css" />
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
					<h5 class="text-center">Acesso ao Sistema</h5>
					<p class="text-center">Entre com as suas credenciais de acesso.</p>

					<form id="formLogin" action="login-post" method="post">
						<div class="mb-3">
							<label for="email" class="form-label">E-mail de acesso:</label> <input
								type="email" class="form-control" id="email" name="email"
								placeholder="Digite seu e-mail">
						</div>
						<div class="mb-3">
							<label for="password" class="form-label">Senha de acesso:</label>
							<input type="password" class="form-control" id="senha"
								name="senha" placeholder="Digite sua senha">
						</div>

						<div class="mb-3 text-end">
							<a href="/java_contasapp/recuperar-senha">Esqueci minha
								senha!</a>
						</div>

						<div class="d-grid">
							<button type="submit" class="btn btn-primary">Entrar</button>
						</div>

						<div class="d-grid mt-2 "></div>
						<a href="/java_contasapp/criar-usuario" class="btn btn-light">Não
							possui uma conta? Cadastre-se!</a>
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
		//quando a página abrir, faça...
		$(document).ready(function(){
			//validação do formulário
			$("#formLogin").validate({
				rules: {
					"email": {
						required: true,
						email : true
					},
					"senha": {
						required: true,
						pattern: /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/
					}
				},
				messages: {
	 				"senha": {
						required: "O campo senha não pode ficar vazio.",
	 					pattern: "A senha deve conter pelo menos 8 caracteres, incluindo letras, números e pelo menos um caractere especial (@, $, !, %, *, ?, &)."
	 				}
	 			}
			});
		})
	</script>

</body>
</html>