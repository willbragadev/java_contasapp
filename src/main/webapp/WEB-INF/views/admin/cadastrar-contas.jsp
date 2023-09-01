<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ContasApp</title>
<!-- Folhas de estilo CSS -->
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" type="text/css" />
<style>
label.error {
	color: #d9534f;
}

input.error {
	border: 2px solid #d9534f;
}
select.error {
	border: 2px solid #d9534f;
}
textarea.error {
	border: 2px solid #d9534f;
}
</style>
</head>
<body>

	<!-- componente navbar -->
	<jsp:include page="/WEB-INF/views/admin/components/navbar.jsp"></jsp:include>
	<!-- componente alertas -->
	<jsp:include page="/WEB-INF/views/admin/components/messages.jsp"></jsp:include>
	
	
	<div class="container mt-4">
		<div class="card">
			<div class="card-body">
				<h4>Cadastro de contas</h4>
				<p>Fa�a o cadastro de suas contas a receber ou a pagar.</p>
				<hr/>
				
				<div class="mb-2">
				<strong>${mensagem}</strong>
				</div>
				
				<form id="formCadastro" action="cadastrar-contas-post" method="post">
				
					<div class="row mb-2">
						<div class="col-md-6">
							<label>Nome da conta:</label>
							<input type="text" id="nome" name="nome" class="form-control"/>
						</div>
						<div class="col-md-3">
							<label>Data da conta:</label>
							<input type="date" id="data" name="data" class="form-control"/>
						</div>
						<div class="col-md-3">
							<label>Valor da conta:</label>
							<input type="text" id="valor" name="valor" class="form-control"/>
						</div>
					</div>
					
					<div class="row mb-2">
						<div class="col-md-9">
							<label>Descri��o da conta:</label>
							<textarea id="descricao" name="descricao" class="form-control"></textarea>
						</div>
						<div class="col-md-3">
							<label>Tipo da conta:</label>
							<select id="tipo" name="tipo" class="form-select">
								<option value="">Escolha uma op��o</option>
								<option value="1">Conta a receber</option>
								<option value="2">Conta a pagar</option>
							</select>
						</div>
					</div>
					
					<div class="row mb-2">
						<div class="col-md-12">
							<input type="submit" value="Realizar Cadastro" class="btn btn-success"/>
							<a href="/java_contasapp/admin/consultar-contas" class="btn btn-secondary">
								Ir para a consulta
							</a>
						</div>
					</div>
				
				</form>
				
			</div>
		</div>
	</div>
	<!-- Arquivos JavaScript -->
	
	<script src="../resources/js/bootstrap.bundle.min.js"></script>
	<script src="../resources/js/jquery-3.7.0.min.js"></script>
	<script src="../resources/js/jquery.validate.min.js"></script>
	<script src="../resources/js/additional-methods.min.js"></script>
	<script src="../resources/js/messages_pt_BR.min.js"></script>
	
		<script>		
		$(document).ready(function(){			
			$("#formCadastro").validate({
				rules: {
					"nome": {
						required: true,
						minlength: 8,
						maxlength: 100
					},
					"data": {
						required: true
					},
					"valor": {
						required: true
					},
					"descricao": {
						required: true,
						minlength: 8,
						maxlength: 250
					},
					"tipo": {
						required: true
					}
				}
			});
		})
	</script>
</body>
</html>



