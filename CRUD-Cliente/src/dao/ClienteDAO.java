package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Cliente;

public class ClienteDAO {
	
	public static boolean adicionar(Cliente cliente) {
		ConexaoBanco bd = new ConexaoBanco();
		boolean status = false;
		if (bd.getConnection()) {
			try {
				String sql = "INSERT INTO clientes (id, nome, email, telefone, endereco, cidade, uf, rg, cpf, cep)"
						+ "VALUES (null, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
				PreparedStatement stmt = bd.con.prepareStatement(sql);
				
				stmt.setString(1, cliente.getNome());
				stmt.setString(2, cliente.getEmail());
				stmt.setString(3, cliente.getTelefone());
				stmt.setString(4, cliente.getEndereco());
				stmt.setString(5, cliente.getCidade());				
				stmt.setString(6, cliente.getUf());
				stmt.setString(7, cliente.getRg());
				stmt.setString(8, cliente.getCpf());
				stmt.setString(9, cliente.getCep());
				
				if (stmt.executeUpdate() == 1) {
					status = true;
				}
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}			 
		}else {
			System.out.println("ERRO AO ADICIONAR, BANCO NÃO CONECTADO!");
		}
		
		return status;
	}
	
	public static boolean alterar(Cliente cliente) {
		ConexaoBanco bd = new ConexaoBanco();
		boolean status = false;
		if (bd.getConnection()) {
			try {
				String sql = "UPDATE CLIENTES SET "
						+ "nome=?, email=?, telefone=?, endereco=?, cidade=?, uf=?, rg=?, cpf=?, cep=? WHERE ID = ?";
				PreparedStatement stmt = bd.con.prepareStatement(sql);
				
				stmt.setString(1, cliente.getNome());
				stmt.setString(2, cliente.getEmail());
				stmt.setString(3, cliente.getTelefone());
				stmt.setString(4, cliente.getEndereco());
				stmt.setString(5, cliente.getCidade());
				stmt.setString(6, cliente.getUf());
				stmt.setString(7, cliente.getRg());
				stmt.setString(8, cliente.getCpf());
				stmt.setString(9, cliente.getCep());
				stmt.setInt(10, cliente.getId());

				if (stmt.executeUpdate() == 1) {
					status = true;
				}
				
			} catch (Exception e) {				
				System.out.println("erro ao executar");
			}
		}else {
			System.out.println("ERRO, NÃO CONEXAO COM O BANCO DE DADOS!");
		}
		
		return status;
	}
	
	public static boolean remover(Cliente cliente) {
		ConexaoBanco bd = new ConexaoBanco();
		boolean status = false;		
		if (bd.getConnection()) {
			try {
				String sql = "DELETE FROM CLIENTES WHERE ID = ?";
				PreparedStatement stmt = bd.con.prepareStatement(sql);
				
				stmt.setInt(1, cliente.getId());
				if (stmt.executeUpdate() == 1) {
					status = true;
				}
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		return status;
	}
	
	public static List<Cliente> listar() {
		ConexaoBanco bd = new ConexaoBanco();
		List<Cliente> clientes = new ArrayList<Cliente>();
		
		if (bd.getConnection()) {
			try {
				String sql = "SELECT * FROM clientes";
                PreparedStatement stmt = bd.con.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();
                
                while (rs.next()) {
					Cliente cli = new Cliente();
					cli.id			= rs.getInt("id");
					cli.nome		= rs.getString("nome");
					cli.endereco	= rs.getString("endereco");
					cli.telefone	= rs.getString("telefone");
					cli.email		= rs.getString("email");	
					cli.cidade		= rs.getString("cidade");
					cli.uf			= rs.getString("uf");
					cli.cep			= rs.getString("cep");
					cli.rg			= rs.getString("rg");
					cli.cpf			= rs.getString("cpf");
					clientes.add(cli);
				}
                
                rs.close();
                stmt.close();
                bd.close();
			} catch (SQLException e) {
				System.out.println(e.toString());
			}
		}else {
			System.out.println("Erro ao conectar!");
		}
		return clientes;
	}
	
	public static Cliente selecionar(int id) {
		ConexaoBanco bd = new ConexaoBanco();	
		Cliente cli = null;
		if (bd.getConnection()) {
			try {
				String sql = "SELECT * FROM clientes WHERE id = ?";
                PreparedStatement stmt = bd.con.prepareStatement(sql);                
                stmt.setInt(1, id);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {			
                	cli= new Cliente();                	
					cli.id			= rs.getInt("id");
					cli.nome		= rs.getString("nome");
					cli.endereco	= rs.getString("endereco");
					cli.telefone	= rs.getString("telefone");
					cli.email		= rs.getString("email");	
					cli.cidade		= rs.getString("cidade");
					cli.uf			= rs.getString("uf");
					cli.cep			= rs.getString("cep");
					cli.rg			= rs.getString("rg");
					cli.cpf			= rs.getString("cpf");					
				}
                
                rs.close();
                stmt.close();
                bd.close();
			} catch (SQLException e) {
				System.out.println(e.toString());
			}
		}else {
			System.out.println("Erro ao conectar!");
		}
		return cli;
	}
	
	public static List<Cliente> buscaNome(String nome) {
		ConexaoBanco bd = new ConexaoBanco();
		List<Cliente> clientes = new ArrayList<Cliente>();
		
		if (bd.getConnection()) {
			try {
				String sql = "SELECT * FROM clientes where nome like ?";
                PreparedStatement stmt = bd.con.prepareStatement(sql);
                stmt.setString(1, "%" + nome + "%");
                ResultSet rs = stmt.executeQuery();
                
                while (rs.next()) {	
					Cliente cli = new Cliente();
					cli.id			= rs.getInt("id");
					cli.nome		= rs.getString("nome");
					cli.endereco	= rs.getString("endereco");
					cli.telefone	= rs.getString("telefone");
					cli.email		= rs.getString("email");	
					cli.cidade		= rs.getString("cidade");
					cli.uf			= rs.getString("uf");
					cli.rg			= rs.getString("rg");
					cli.cpf			= rs.getString("cpf");
					cli.cep			= rs.getString("cep");
					clientes.add(cli);
				}
                
                rs.close();
                stmt.close();
                bd.close();
			} catch (SQLException e) {
				System.out.println(e.toString());
			}
		}else {
			System.out.println("Erro ao conectar!");
		}
		return clientes;
	}	
}
