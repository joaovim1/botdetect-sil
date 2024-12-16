# Implementação de CAPTCHA em JSP

- **Integração de CAPTCHA**: O BotDetect CAPTCHA foi integrado ao formulário de login para validar se o usuário é um ser humano.
- **Validação de usuário e senha**: Após a validação do CAPTCHA, o sistema verifica as credenciais do usuário (simuladas com valores fixos para demonstração).
- **Interface Responsiva**: A interface é responsiva e adaptável a diferentes tamanhos de tela.
- **Feedback de Erro**: Exibe mensagens de erro claras para o usuário caso o CAPTCHA ou as credenciais estejam incorretos.

## Tecnologias Utilizadas

- **JSP (JavaServer Pages)** para renderização dinâmica de conteúdo no lado do servidor.
- **BotDetect CAPTCHA** para geração e validação do CAPTCHA.
- **HTML5** para estruturação de páginas.
- **CSS** para estilo responsivo.
- **Font Awesome** para ícones no layout.

## Estrutura do Projeto
├── webapp/
│   ├── css/
│   │   └── style.css
│   ├── images/
│   │   └── images.jpeg (Imagem do logo)
│   ├── WEB-INF/
│   │   └── lib/
│   │       └── botdetect.jar (Biblioteca do CAPTCHA)
│   └── index.jsp
└── pom.xml (se utilizando Maven)
