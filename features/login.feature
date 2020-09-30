#language:pt

@LoginLokus
Funcionalidade: logar no sistema
	Para que eu possar gerenciar as informações do sistema
	Sendo um  usuário previamente cadastrado
	Posso acessar o sistema, organizações e unidades

	Contexto:
		Dado que estou na tela de login

	@CN01 @sucesso
	Esquema do Cenario: Validar login com sucesso
		Quando eu informo <cpf>,  <organizacao> e <senha> e clico em "Entrar"
		Então devo verificar que o "<usuario>" logou com sucesso
		E   a organização logada tem o "<nomeConta>"
		Exemplos:
			| cpf         | organizacao  | senha     | usuario         | nomeConta                                    |
			| 45008809091 | LOKUS        | 123456789 | Cidmario Amorim | LOKUS                                        |
			| 45008809091 | IRG Hospital | 123456789 | Cidmario Amorim | IRG Hospital - Instituto do Rim de Goiânia   |
			| 45008809091 | OGTI         | 123456789 | Cidmario Amorim | ORGANIZACAO GOIANA DE TERAPIA INTENSIVA LTDA |

	@CN02 @falha
	Esquema do Cenario: Validar logim com senha inválida
		Quando eu informo <cpf>,  <organizacao> e <senha> e clico em "Entrar"
		Então devo verificar a "<mensagem>", me impedindo de acessar o sistema
		Exemplos:
			| cpf         | organizacao  | senha  | mensagem               |
			| 45008809091 | LOKUS        | 123456 | CPF ou senha inválido! |
			| 45008809091 | IRG Hospital | 123456 | CPF ou senha inválido! |
			| 45008809091 | OGTI         | 123456 | CPF ou senha inválido! |

	@CN03 @falha
	Cenario: Validar acesso com cpf inválido
		Quando informo o cpf inválido "123456789101" e teclar enter
		Então  devo verificar a mensagem "CPF ou senha inválido!" me impedindo de acessar o sistema

