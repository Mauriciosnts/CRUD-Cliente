<%@page import="dao.ClienteDAO"%>  
<jsp:useBean id="cliente" class="model.Cliente"></jsp:useBean>  
<jsp:setProperty property="*" name="cliente"/>  
  
<%  
	boolean executado= ClienteDAO.adicionar(cliente);

	if(executado == true){  
		response.sendRedirect("listar.jsp");  
	}else{  
		out.print("<h1>Erro ao adicionar!</h1>"); 
		out.print("<a href='form-add.jsp'>voltar</a>");
	}  
%>  