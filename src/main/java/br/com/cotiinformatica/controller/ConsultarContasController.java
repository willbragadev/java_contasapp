package br.com.cotiinformatica.controller;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import br.com.cotiinformatica.dtos.UsuarioDTO;
import br.com.cotiinformatica.entities.Conta;
import br.com.cotiinformatica.repositories.ContaRepository;
@Controller
public class ConsultarContasController {
	
	@Autowired
	ContaRepository contaRepository;
	//método que mapeia a rota para abrir a página
	@RequestMapping(value = "/admin/consultar-contas")
	public ModelAndView consultarContas() {
		ModelAndView modelAndView = new ModelAndView("admin/consultar-contas");
		return modelAndView;
	}
	
	//método que captura o submti post do formulário
	@RequestMapping(value = "/admin/consultar-contas-post", method = RequestMethod.POST)
	public ModelAndView consultarContasPost(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("admin/consultar-contas");
		
		try {
			
			//capturar as datas enviadas pela página
			String dataInicio = request.getParameter("dataInicio");
			String dataFim = request.getParameter("dataFim");
						
			//capturar o usuário autenticado na sessão
			UsuarioDTO usuarioDTO = (UsuarioDTO) request.getSession().getAttribute("usuario_auth");
			
			//consultar as contas no banco de dados
			List<Conta> contas = contaRepository.findAll(
					new SimpleDateFormat("yyyy-MM-dd").parse(dataInicio),
					new SimpleDateFormat("yyyy-MM-dd").parse(dataFim),
					usuarioDTO.getId());
			
			//verificando se alguma conta foi obtida
			if(contas.size() != 0) {
				//enviando as contas para serem exibidas na página
				modelAndView.addObject("listagem_contas", contas);
			}
			else {
				modelAndView.addObject("mensagem_alerta", "Nenhuma conta foi encontrada para o período selecionado");
			}
			
			modelAndView.addObject("dt_inicio", dataInicio);
			modelAndView.addObject("dt_fim", dataFim);
		}
		catch(Exception e) {
			modelAndView.addObject("mensagem_erro", e.getMessage());
		}
		
		return modelAndView;
	}
}



