# ⚖️ Desafio Fullstack Avançado: Workflow Pro (Sistema de Aprovações)

> **Elimine a burocracia do papel e das mensagens perdidas. Crie um fluxo de trabalho auditável onde cada decisão conta e fica registada.**

## 📌 O Problema Real

Em empresas, escolas ou condomínios, pedidos de compra, solicitações de folga, abonos de faltas ou autorizações de desconto costumam ser feitos de forma verbal ou por e-mail, perdendo-se no tempo. Não há um histórico de quem autorizou, quando e por quê. Sem um sistema de aprovação, a gestão perde o controlo e a transparência.

## 💡 A Solução

Você desenvolverá o **Workflow Pro**, um sistema de gestão de solicitações onde o utilizador cria um pedido e um supervisor/gestor recebe uma notificação para **Aprovar** ou **Reprovar**, com obrigatoriedade de comentário em caso de recusa.

---

## 🔴 Requisitos de Nível Avançado

### 1. Modelagem de Dados e Hierarquia (SQLite)

O sistema deve suportar diferentes níveis de acesso (**RBAC - Role Based Access Control**).

**Estrutura de Tabelas Sugerida:**

```sql
-- 1. Utilizadores e Cargos
CREATE TABLE usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    senha_hash TEXT NOT NULL,
    cargo TEXT CHECK(cargo IN ('Solicitante', 'Aprovador', 'Admin')) DEFAULT 'Solicitante'
);

-- 2. Solicitações (O Pedido)
CREATE TABLE solicitacoes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    solicitante_id INTEGER NOT NULL,
    tipo TEXT NOT NULL, -- Ex: "Compra", "Folga", "Reembolso"
    titulo TEXT NOT NULL,
    descricao TEXT,
    valor DECIMAL(10,2), -- Opcional, para casos de reembolso/compra
    status TEXT CHECK(status IN ('Pendente', 'Aprovado', 'Reprovado', 'Cancelado')) DEFAULT 'Pendente',
    data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (solicitante_id) REFERENCES usuarios(id)
);

-- 3. Histórico de Aprovação (Audit Log)
CREATE TABLE historico_aprovacao (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    solicitacao_id INTEGER NOT NULL,
    aprovador_id INTEGER NOT NULL,
    decisao TEXT NOT NULL, -- "Aprovado" ou "Reprovado"
    comentario TEXT, -- Justificativa
    data_decisao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (solicitacao_id) REFERENCES solicitacoes(id),
    FOREIGN KEY (aprovador_id) REFERENCES usuarios(id)
);

```

### 2. Regras de Negócio Avançadas

* **Controlo de Acesso (ACL):** * O **Solicitante** só vê os seus próprios pedidos.
* O **Aprovador** vê todos os pedidos pendentes da sua área.


* **Imutabilidade:** Uma solicitação que já foi "Aprovada" ou "Reprovada" não pode ser editada nem alterada.
* **Trilha de Auditoria:** Cada mudança de status deve gerar um registo na tabela `historico_aprovacao`, informando quem tomou a decisão e o comentário feito.
* **Validação de Valor:** (Opcional) Pedidos acima de R$ 5.000,00 exigem obrigatoriamente a aprovação de um utilizador com cargo "Admin".

### 3. Interface (Frontend)

* **Painel do Solicitante:** Botão de "Novo Pedido" e lista de status (colorida por situação).
* **Painel do Aprovador:** Lista de pendências com botões rápidos de Aprovar/Reprovar. Se clicar em Reprovar, deve abrir um campo para preencher o motivo.

---

## 🎯 Funcionalidades do MVP

* [ ] **Sistema de Login:** Diferenciação automática de ecrã/menu baseada no cargo do utilizador.
* [ ] **Formulário de Pedido:** Com seleção de tipo de solicitação.
* [ ] **Fluxo de Decisão:** Interface para o gestor validar os pedidos.
* [ ] **Timeline do Pedido:** O utilizador clica num pedido e vê todo o histórico (ex: "Criado em 10/01", "Visualizado pelo gestor em 11/01", "Reprovado por falta de orçamento em 12/01").

---

## 💰 Potencial de Renda Extra

Este sistema é o "motor" de processos em empresas de médio porte.

* **Onde vender:** Departamentos de RH, Financeiro de empresas de serviços, Secretarias de Escolas ou Administradoras de Condomínios.
* **Diferencial:** Você pode vender a "Customização dos Tipos de Pedido" conforme a necessidade do cliente.
* **Preço sugerido:** * **Projeto Fechado:** R$ 1.500,00 a R$ 3.500,00.
* **Aluguer (SaaS):** R$ 99,00 a R$ 199,00/mês.



---

## 📦 Como enviar sua Entrega (Padrão HDEV)

1. **Repositório:** Código no GitHub organizado com os modelos e controladores bem definidos.
2. **Vídeo:** Demonstre o fluxo de ponta a ponta:
* Login como Solicitante e criação de pedido.
* Login como Aprovador e decisão sobre o pedido.
* Verificação do histórico atualizado.


3. **Issue:** Abra uma Issue no repositório oficial da comunidade usando o template padrão.
4. **Links:** Forneça a URL do GitHub e o link do vídeo.

---

## 🔗 Apoio Técnico

* **Autenticação:** Estude Middlewares para proteger rotas (ex: apenas aprovadores podem aceder à rota `/aprovar`).
* **UX:** Use ícones claros para indicar o status (Check verde, X vermelho, Relógio amarelo).

**Este desafio testa a sua capacidade de criar lógica de fluxo e segurança de dados. É um divisor de águas no seu portfólio profissional!** 🚀

