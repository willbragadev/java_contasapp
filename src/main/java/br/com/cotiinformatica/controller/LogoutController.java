package br.com.cotiinformatica.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LogoutController {
	
	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpServletRequest request) {
		
		//apagando dados de sessão (apaga tudo)
		request.getSession().invalidate();
		
		//redirecionando para pág de login
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/"); //voltando pra pag principal
		
		return modelAndView;
		
	}

}
