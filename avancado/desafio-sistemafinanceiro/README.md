# 💰 Desafio Fullstack Avançado: Gestor Financeiro "Saldo Real"

> **Controle cada centavo. Transforme a confusão de contas em decisões estratégicas com um fluxo de caixa profissional.**

## 📌 O Problema Real

Muitos pequenos empreendedores misturam contas pessoais com as da empresa ou não sabem se tiveram lucro real no mês porque esquecem de anotar pequenas despesas. Planilhas de Excel são facilmente corrompidas e difíceis de usar no telemóvel/celular no dia a dia.

## 💡 A Solução

Você desenvolverá o **Saldo Real**, um sistema de gestão financeira (ERP Financeiro) focado em Fluxo de Caixa. O sistema deve permitir o controle de entradas e saídas, gestão de categorias e, principalmente, oferecer uma visão clara do saldo atual e futuro.

---

## 🔴 Requisitos de Nível Avançado

### 1. Modelagem de Dados e Integridade (SQLite)

A modelagem deve garantir que nenhuma transação fique "órfã" e que o histórico seja imutável.

**Estrutura de Tabelas Sugerida:**

```sql
-- 1. Utilizadores (Controle de Acesso)
CREATE TABLE usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    senha_hash TEXT NOT NULL
);

-- 2. Categorias Financeiras
CREATE TABLE categorias (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    tipo TEXT CHECK(tipo IN ('Receita', 'Despesa')) NOT NULL
);

-- 3. Transações (O coração do sistema)
CREATE TABLE transacoes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    usuario_id INTEGER NOT NULL,
    categoria_id INTEGER NOT NULL,
    descricao TEXT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    data_vencimento DATE NOT NULL,
    data_pagamento DATE, -- Se nulo, a conta está pendente
    status TEXT CHECK(status IN ('Pago', 'Pendente')) DEFAULT 'Pendente',
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

```

### 2. Regras de Negócio de Alto Nível

* **Cálculo de Saldo Projetado:** O sistema deve calcular o saldo considerando contas já pagas **E** contas pendentes para o futuro.
* **Autenticação e Autorização:** O utilizador só pode visualizar, editar ou eliminar transações que ele mesmo criou (`WHERE usuario_id = ?`).
* **Relatórios por Período:** Filtrar entradas e saídas por mês/ano específico.
* **Prevenção de Erros:** Não permitir valores negativos no campo `valor` (o que define se é saída é o tipo da categoria).

### 3. Dashboard Administrativo

O frontend deve exibir 3 indicadores principais (KPIs):

1. **Total de Receitas (Mês atual)**
2. **Total de Despesas (Mês atual)**
3. **Saldo Líquido (Receitas - Despesas)**

---

## 🎯 Funcionalidades do MVP

* [ ] **Login e Registo:** Sistema de acesso seguro.
* [ ] **Gestão de Categorias:** Personalizar categorias (Ex: Aluguer, Vendas, Marketing).
* [ ] **Lançamento de Contas:** Registrar o que tem a pagar e o que tem a receber.
* [ ] **Filtro de Status:** Ver rapidamente o que está atrasado (Pendente e data vencida).

---

## 💰 Como transformar isso em Renda Extra?

Um sistema financeiro bem feito é um produto de **alto valor agregado**:

* **O Produto:** "Gestor Financeiro para Prestadores de Serviço".
* **Personalização:** Adicione a funcionalidade de "Anexar Comprovante" (upload de foto do recibo) para aumentar o valor da venda.
* **Preço sugerido:** * **Venda da Licença:** R$ 1.200,00 a R$ 2.500,00.
* **Modelo SaaS:** R$ 59,90 a R$ 99,00 por mês.



---

## 📦 Como enviar sua Entrega (Padrão HDEV)

1. **Repositório:** Código no GitHub com boas práticas de organização e variáveis de ambiente (`.env`).
2. **Vídeo:** Demonstre o fluxo: Login -> Cadastro de uma Despesa Pendente -> Pagamento dessa Despesa -> Atualização do Saldo no Dashboard.
3. **Issue:** Abra a Issue no repositório oficial com o template de entrega.
4. **Links:** Informe a URL do repositório e o link do vídeo.

---

## 🔗 Apoio Técnico

* **Segurança:** Use `Argon2` ou `Bcrypt` para as senhas. Nunca salve senhas em texto puro.
* **Matemática:** Ao lidar com dinheiro no SQLite/JS, tenha cuidado com arredondamentos de ponto flutuante. Dica: armazene em centavos (inteiros) ou use bibliotecas de precisão decimal.

**Este é o desafio final para consolidar sua carreira como Desenvolvedor Fullstack. Mostre que você é capaz de lidar com a responsabilidade de um sistema financeiro!** 🚀

---