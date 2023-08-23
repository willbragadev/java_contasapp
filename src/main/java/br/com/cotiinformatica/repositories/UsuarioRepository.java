package br.com.cotiinformatica.repositories;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;


import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import br.com.cotiinformatica.entities.Usuario;

public class UsuarioRepository {
	
	private JdbcTemplate jdbcTemplate;
	
	
	public UsuarioRepository(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	//inserindo um usuário
	public void create(Usuario usuario) throws Exception {
		
		//escrevendo a instrução sql
		String sql = "insert into usuario (nome, email, senha) values (?,?,?)";
		
		//definindo dados
		Object[] params = {
			usuario.getNome(),
			usuario.getEmail(),
			usuario.getSenha()			
		};
		
		//executando no banco de dados
		jdbcTemplate.update(sql, params);
		
	}
	
	//metodo de consulta através do e-mail
	public Usuario find(String email) throws Exception {
		
		//escrevendo a instrução
		String sql = "select * from usuario where email = ?";
		
		//definindo parametros a serem passados
		Object[] params = {
			email
		};
		
		//executando a consulta e obtendo dados da tabela
		List<Usuario> resultado = jdbcTemplate.query(sql, params, new RowMapper<Usuario>() {
			
			//metodo para ler cada registro da consulta 
			@Override
			public Usuario mapRow(ResultSet rs, int rowNum) throws SQLException {

				Usuario usuario = new Usuario();
				
				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setEmail(rs.getString("email"));
				usuario.setSenha(rs.getString("senha"));
				
				return usuario;
			}
			
		});
		
		if(resultado.size() > 0)
			return resultado.get(0);
		
		else
			
			return null;		

	}
	
	//metodo de consulta através do e-mail e senha
		public Usuario find(String email, String senha) throws Exception {
			
			//escrevendo a instrução
			String sql = "select * from usuario where email = ? and senha = ?";
			
			//definindo parametros a serem passados
			Object[] params = {
				email, senha
			};
			
			//executando a consulta e obtendo dados da tabela
			List<Usuario> resultado = jdbcTemplate.query(sql, params, new RowMapper<Usuario>() {
				
				//metodo para ler cada registro da consulta 
				@Override
				public Usuario mapRow(ResultSet rs, int rowNum) throws SQLException {

					Usuario usuario = new Usuario();
					
					usuario.setId(rs.getInt("id"));
					usuario.setNome(rs.getString("nome"));
					usuario.setEmail(rs.getString("email"));
					usuario.setSenha(rs.getString("senha"));
					
					return usuario;
				}
				
			});
			
			if(resultado.size() > 0)
				return resultado.get(0);
			
			else
				
				return null;		

		}
	
	
}