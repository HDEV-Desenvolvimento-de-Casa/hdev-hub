# 🚀 Desafio Fullstack: Sistema "Cliente na Mão" (CRM Express)

> **Transforme o caderninho de papel em uma ferramenta digital profissional e lucre com isso.**

## 📌 O Conceito

Este desafio não é apenas um exercício de código. É a criação de um **produto real**. O objetivo é resolver o problema de organização de pequenos prestadores de serviços (manicures, barbeiros, confeiteiros, etc.) usando uma interface simples, rápida e que funciona no celular.

---

## 🛠️ Especificações Técnicas

### 1. Banco de Dados (Obrigatório)

* **Engine:** **SQLite** (Deve ser entregue o arquivo `.db` ou o script de criação).
* **Estrutura da Tabela `clientes`:**
* `id`: INTEGER PRIMARY KEY AUTOINCREMENT
* `nome`: TEXT (Obrigatório)
* `whatsapp`: TEXT (Apenas números, incluindo DDD)
* `servico`: TEXT (Ex: "Progressiva", "Bolo de Chocolate")
* `valor`: DECIMAL(10,2)
* `data_cadastro`: DATETIME DEFAULT CURRENT_TIMESTAMP
* `status`: TEXT (Sugestão: "Pendente", "Concluído", "Pago")



### 2. Backend (Livre)

* Desenvolva uma API simples em qualquer linguagem (**Node.js, PHP, Python, C#, Java, etc.**).
* Deve conter as rotas básicas: `GET` (listar), `POST` (cadastrar), `DELETE` (remover).

### 3. Frontend (Mobile-First)

* Design focado em **usabilidade mobile**.
* Lista de clientes com busca em tempo real.
* **Botão de Ação:** Um botão de destaque para abrir o WhatsApp.

---

## 💬 A "Mágica" da Integração: Botão WhatsApp

Para tornar o projeto profissional, você deve implementar o link dinâmico do WhatsApp.

**Como funciona a lógica:**
O link deve seguir este padrão:
`https://wa.me/55[NUMERO]?text=[MENSAGEM_CODIFICADA]`

### Exemplos de Mensagens Automáticas (Diferencial de Venda):

O aluno deve permitir que o sistema gere mensagens como:

* **Para Confeitaria:** *"Olá [Nome], aqui é da [Nome da Loja]. Confirmando seu pedido de [Serviço/Produto] no valor de R$ [Valor]. Podemos agendar a entrega?"*
* **Para Salão de Beleza:** *"Olá [Nome], aqui é do [Nome do Salão]. Gostaria de confirmar seu horário para [Serviço]. Nos vemos em breve?"*

> **Dica Técnica:** No JavaScript, use `encodeURIComponent(mensagem)` para garantir que espaços e caracteres especiais funcionem na URL.

---

## 📦 Processo de Entrega (Padrão HDEV)

Para validar sua entrega e receber o feedback da comunidade, siga rigorosamente estes 4 passos:

1. **Repositório e Vídeo:** Suba seu código no GitHub (Público) e grave um vídeo curto (Loom, YouTube ou Drive) demonstrando o cadastro de um cliente e o clique para o WhatsApp funcionando.
2. **Abra uma Issue:** No repositório do desafio, vá em **Issues** → **New Issue**.
3. **Selecione o Template:** Escolha o modelo **"🚀 Enviar entrega do desafio"**.
4. **Informe os Links:** Cole o link do seu repositório e o link do vídeo.

**Validação:** O validador automático da **HDEV** analisará seu projeto e comentará o resultado diretamente na sua Issue.

---

## 💰 Guia de Monetização: Como vender este projeto?

Este sistema pode ser sua primeira fonte de renda extra como dev. Aqui está como oferecer:

1. **Identifique o alvo:** Vá ao salão de beleza ou padaria que você frequenta.
2. **Apresente o problema:** "Já perdeu alguma venda porque esqueceu de anotar no caderno ou não achou o número do cliente?"
3. **Mostre a solução:** Mostre o sistema funcionando no seu celular.
4. **Personalize:** Mude as cores para a marca do cliente e adicione a logo dele.
5. **Preço sugerido:** Você pode cobrar uma taxa de **configuração (R$ 150 - R$ 300)** e uma pequena taxa de **hospedagem/suporte mensal (R$ 30 - R$ 50)**.

---

## 🔗 Links Úteis

* **Documentação SQLite:** [sqlite.org](https://www.sqlite.org/index.html)
* **Validação HDEV:** [hdev.com.br/hub/#validacao](https://hdev.com.br/hub/#validacao)
* **Gerador de Link WhatsApp:** [wa.me](https://www.google.com/search?q=https://faq.whatsapp.com/591339899867292)

---

**Mãos à obra!** O mercado está cheio de problemas simples esperando por soluções inteligentes. Mostre o que você sabe fazer. 🚀

