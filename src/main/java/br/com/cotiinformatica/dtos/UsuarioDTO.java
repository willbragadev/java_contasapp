package br.com.cotiinformatica.dtos;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class UsuarioDTO {
	
	private Integer id;
	private String nome;
	private String email;
	private Date dataHoraAcesso;

}
