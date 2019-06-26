<%@page import="dao.ClienteDAO,model.Cliente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<!-- META TAGS -->
	<meta name="description" content="clientes dashboard">
	<meta name="keywords" content="sites, web, dashboard, bootstrap, html, clientes">
	<meta name="author" content="Mauricio Ferraz">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">	

	<!-- BOOTSTRAP CSS REFERENCE -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<title>CLIENTE DASHBOARD V1.0</title>
</head>
<body>
	  
<%  
	String id = request.getParameter("id");  
	Cliente cli = ClienteDAO.selecionar(Integer.parseInt(id));  
%>  

<!-- MENU  -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	  <a class="navbar-brand"  style="color: gray; font-weight: bold">CRUD CLIENTES</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarNav">
	    <ul class="navbar-nav">
	      <li class="nav-item active">
	        <a class="nav-link" href="listar.jsp">Listar clientes <span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="form-add.jsp">Adicionar novos clientes</a>
	      </li>	      
	    </ul>
	  </div>
	</nav>					

<!-- CONTENT -->
	<div class="container-fluid">
		<div class="row">
			<!-- COLUNA PARA FIXAR NO MEIO -->
			<div class="col-2"></div>
			<div class="col-8 clientform p-4 m-4">
					
					<div class="form-group">
						<label for="id">ID: </label>
						<input type="text" class="form-control" readonly name="id" value="<%=cli.getId() %>">
					</div>
				
					<div class="form-group">
						<label for="nome">Nome: </label>
						<input type="text" class="form-control" name="nome" required value="<%=cli.getNome() %>">
					</div>

					<div class="form-row">
					    <div class="col">
					    	<label for="cpf">CPF: </label>
					    	<input type="text" id="cpf" name="cpf" class="form-control" required value="<%=cli.getCpf() %>">
					    </div>
					    <div class="col">
					    	<label for="rg">RG: </label>
					    	<input type="text" id="rg" name="rg" class="form-control" required value="<%=cli.getRg() %>">
					    </div>
					</div>

					<div class="form-group">
						<label for="telefone">Telefone: </label>
						<input type="tel" class="form-control" name="telefone" id="telefone" required value="<%=cli.getTelefone() %>">
					</div>
					
					<div class="form-group">
						<label for="endereco">Endereço: </label>
						<input type="text" class="form-control" name="endereco" id="endereco" required value="<%=cli.getEndereco() %>">
					</div>

					<div class="form-row">
					    <div class="col">
					    	<label for="cidade">Cidade: </label>
					     	<input type="text" id="cidade" name="cidade" class="form-control" required value="<%=cli.getCidade() %>">
					    </div>
					    <div class="col">
					    	<label for="uf">UF: </label>
					      	<input type="text" id="uf" name="uf" class="form-control" required maxlength="2" value="<%=cli.getUf() %>">
					    </div>
					    <div class="col">
					    	<label for="cep">CEP: </label>
					      	<input type="text" id="cep" name="cep" class="form-control" required maxlength="10" value="<%=cli.getCep() %>">
					    </div>
					</div>	
						
					<div class="form-group">
						<label for="email">Email: </label>
						<input type="email" class="form-control" name="email" id="email" required value="<%=cli.getEmail() %>">
					</div>

					<br>
					<hr>				
			</div>
		</div>
	</div>

<!-- JAVASCRIPT REFERENCE -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"> </script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
	<script>
		$("#telefone").mask("(00) 0000-0000");
		$("#rg").mask("00.000.000-0");
		$("#cep").mask("00.000-000");
		$("#cpf").mask("000.000.000-00");
	</script>
</body>
</html>