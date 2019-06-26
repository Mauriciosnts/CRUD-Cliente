<%@page import="dao.ClienteDAO"%>  
<jsp:useBean id="id" class="model.Cliente"></jsp:useBean>  
<jsp:setProperty property="*" name="id"/>
  
<%  
	boolean executado = ClienteDAO.alterar(id);

	if(executado == true){
		response.sendRedirect("listar.jsp");		
	}else{
		out.print("<h1>Erro ao atualizar!</h1>"); 
		out.print("<a href='listar.jsp'>voltar</a>");
	}
	  
%>  