<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>      
<%@page import="dao.ClienteDAO,model.*,java.util.*"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

	<!--  ICONES - FONTS AWESOME -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<title>CLIENTE DASHBOARD V1.0</title>
</head>
<body>


<%
	List<Cliente> list=ClienteDAO.listar();
	request.setAttribute("list",list);  
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
	        <a class="nav-link" href="#">Listar clientes <span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="form-add.jsp">Adicionar novos clientes</a>
	      </li>	      
	    </ul>
	  </div>
	</nav>					

<!-- CONTENT -->
	<div class="container-fluid mt-5">
		<div class="row">
			<!-- COLUNA PARA FIXAR NO MEIO -->
			<div class="col-1"></div>			
			<div class="col-10 p-5">
			
			<form method="post" action="buscar.jsp">
				  <div class="form-row">
				    <div class="form-group col-11">				      
				      <input type="text" class="form-control" id="text" name="text" placeholder="Digite um nome..">
				    </div>
				    <div class="form-group col-1">
				      <button type="submit" class="btn btn-primary mb-2 ml-2"><i class="fa fa-search"></i></button>
				    </div>
				  </div>				 
			</form>		
			
				<table class="table text-center mt-5">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">NOME</th>
							<th scope="col">TELEFONE</th>
							<th scope="col">EMAIL</th>							
							<th scope="col">CIDADE</th>							
							<th scope="col">ACTIONS</th>
						</tr>
					</thead>

					<tbody>
					
					<c:forEach items="${list}" var="clientes">    				
						<tr>
							<td scope="row">${clientes.getId() }</td>
							<td> ${clientes.getNome() }</td>
							<td> ${clientes.getTelefone() }</td>														
							<td> ${clientes.getEmail() }</td>
							<td> ${clientes.getCidade()}</td>							
							<td>
								<a class="btn btn-success btn-sm" href="visualizar.jsp?id=${clientes.getId() }"><i class="fa fa-file"></i></a>								
								<a class="btn btn-warning btn-sm" href="form-att.jsp?id=${clientes.getId() }"><i class="fa fa-pencil-square-o"></i></a>
								<a class="btn btn-danger btn-sm" href="deletar.jsp?id=${clientes.getId() }"><i class="fa fa-trash"></i></a>								
							</td>
						</tr>
					</c:forEach>				
					</tbody>
				</table>				
			</div>			
		</div>
	</div>
	
<!-- SCRIPTS  -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>	
</body>
</html>