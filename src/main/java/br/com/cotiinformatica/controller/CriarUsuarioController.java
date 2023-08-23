package br.com.cotiinformatica.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.cotiinformatica.entities.Usuario;
import br.com.cotiinformatica.helpers.MD5Helper;
import br.com.cotiinformatica.repositories.UsuarioRepository;

@Controller

public class CriarUsuarioController {
	
	@Autowired
	UsuarioRepository usuarioRepository;
	
	
	@RequestMapping(value = "/criar-usuario")
	public ModelAndView criarUsuario() {
		
		ModelAndView modelAndView = new ModelAndView("criar-usuario");
		
		return modelAndView;
				
	}
	
	//capturando o submit do formulário
	
	@RequestMapping(value = "/criar-usuario-post", method = RequestMethod.POST)
	public ModelAndView criarUsuarioPost(HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView("criar-usuario");
		
		try {
			
			Usuario usuario = new Usuario();
			usuario.setNome(request.getParameter("nome"));
			usuario.setEmail(request.getParameter("email"));
			usuario.setSenha(MD5Helper.encrypt(request.getParameter("senha")));
			
			//verificando se o e-mail já existe no BD
			if (usuarioRepository.find(usuario.getEmail()) != null) {
				
				modelAndView.addObject("mensagem_erro", "O email informado já está cadastrado");
				
			} else {
				
				usuarioRepository.create(usuario); // cadastrado
			
			modelAndView.addObject("mensagem_sucesso", "Usuario cadastrado com sucesso.");
			
			}
						
		} catch (Exception e) {
			modelAndView.addObject("mensagem", "Erro:" + e.getMessage());						
		}
		
		return modelAndView;
			
	}
}