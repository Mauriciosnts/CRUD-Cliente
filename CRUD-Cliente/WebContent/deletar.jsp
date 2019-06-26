<%@page import="dao.ClienteDAO"%>  
<jsp:useBean id="cli" class="model.Cliente"></jsp:useBean>  
<jsp:setProperty property="*" name="cli"/>  
<%  
	boolean executado = ClienteDAO.remover(cli); 
	
	if(executado == true){
		response.sendRedirect("listar.jsp");		
	}else{
		out.print("<h1>Erro ao deletar!</h1>"); 
		out.print("<a href='listar.jsp'>voltar</a>");
	}
%>  