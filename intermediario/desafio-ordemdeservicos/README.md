# 🛠️ Desafio Fullstack Intermediário: Gestor de Ordens de Serviço (O.S. Pro)

> **Abandone as listas simples e construa um fluxo de trabalho corporativo. Transforme pedidos informais em processos auditáveis e profissionais.**

## 📌 O Problema Real

Pequenas assistências técnicas e prestadores de serviço perdem dinheiro por falta de controle. Aparelhos ficam esquecidos, orçamentos não são aprovados por falta de acompanhamento e o dono do negócio nunca sabe exatamente quanto lucrou no final do mês. Um sistema de O.S. organiza o caos: registra a entrada, documenta o orçamento, aguarda aprovação e formaliza a entrega.

## 💡 A Solução

Você desenvolverá um sistema de **Controle de Ordens de Serviço**. O diferencial aqui é a **máquina de estados**: uma O.S. percorre um caminho lógico (Entrada -> Orçamento -> Execução -> Finalizado).

---

## 🟡 Requisitos de Nível Intermediário

### 1. Modelagem de Dados Relacional (SQLite)

Neste nível, o uso de `FOREIGN KEYS` é obrigatório para garantir a integridade dos dados.

**Estrutura de Tabelas Sugerida:**

```sql
-- 1. Clientes
CREATE TABLE clientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    whatsapp TEXT NOT NULL
);

-- 2. Catálogo de Serviços/Produtos (Preços base)
CREATE TABLE servicos_produtos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    descricao TEXT NOT NULL,
    preco_base DECIMAL(10,2) NOT NULL
);

-- 3. Cabeçalho da Ordem de Serviço
CREATE TABLE ordens_servico (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cliente_id INTEGER NOT NULL,
    status TEXT CHECK(status IN ('Aberto', 'Orçamento', 'Aprovado', 'Concluído', 'Cancelado')) DEFAULT 'Aberto',
    data_entrada DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_saida DATETIME,
    observacoes TEXT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- 4. Itens da O.S. (O que foi usado em cada serviço específico)
CREATE TABLE itens_os (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    os_id INTEGER NOT NULL,
    servico_id INTEGER NOT NULL,
    quantidade INTEGER DEFAULT 1,
    valor_unitario_aplicado DECIMAL(10,2) NOT NULL, -- Valor no momento da venda
    FOREIGN KEY (os_id) REFERENCES ordens_servico(id) ON DELETE CASCADE,
    FOREIGN KEY (servico_id) REFERENCES servicos_produtos(id)
);

```

### 2. Regras de Negócio (A Inteligência do Sistema)

Seu código deve validar os seguintes processos:

* **Cálculo Automático:** O valor total da O.S. deve ser a soma de todos os seus itens.
* **Integridade de Fluxo:** Uma O.S. só pode ser marcada como "Concluída" se já tiver passado pelo status "Aprovado".
* **Histórico de Preços:** O valor do serviço na O.S. deve ser gravado no momento da inclusão (`valor_unitario_aplicado`), para que, se o preço no catálogo mudar no futuro, o valor da O.S. antiga permaneça intacto.

### 3. O Relatório Financeiro (Query Avançada)

Para o painel administrativo, você deve implementar uma consulta que retorne o faturamento total por mês.

**Exemplo de lógica SQL para o seu relatório:**

```sql
SELECT 
    strftime('%m/%Y', os.data_entrada) AS Mes,
    SUM(it.quantidade * it.valor_unitario_aplicado) AS Faturamento_Total
FROM ordens_servico os
JOIN itens_os it ON os.id = it.os_id
WHERE os.status = 'Concluído'
GROUP BY strftime('%m/%Y', os.data_entrada);

```

---

## 🎯 Funcionalidades do MVP

* [ ] **Dashboard:** Cards mostrando "O.S. em Aberto", "Aguardando Aprovação" e "Faturamento do Mês".
* [ ] **Gestão de O.S.:** Criar nova O.S. selecionando um cliente existente e adicionando itens de serviço.
* [ ] **Atualização de Status:** Botões para avançar a O.S. no fluxo de trabalho.
* [ ] **Exportação Simples:** Gerar uma visualização (HTML print-friendly) para enviar ao cliente via WhatsApp como comprovante.

---

## 📦 Como enviar sua Entrega (Padrão HDEV)

1. **Repositório:** Código no GitHub com o banco SQLite (ou script de migração/seed).
2. **Vídeo:** Mostre o fluxo: Cadastro de Cliente -> Abertura de O.S. -> Adição de Itens -> Mudança de Status até o fechamento.
3. **Issue:** No repositório oficial, abra uma **New Issue** com o template **"🚀 Enviar entrega do desafio"**.
4. **Links:** Informe a URL do repositório e o link do vídeo.

---

## 💰 Potencial de Renda Extra

Sistemas de Ordem de Serviço são a base de milhares de microempresas. Ao finalizar este projeto, você terá um **SaaS Base** que pode ser vendido para:

* Assistências técnicas de informática e celulares.
* Oficinas de bicicletas ou automóveis.
* Instaladores de ar-condicionado e eletricistas.

**Sugestão de valor:** Uma solução destas configurada pode ser vendida por **R$ 800,00 a R$ 1.200,00** para instalação única, ou uma assinatura de **R$ 49,90/mês**.

---

> **Dica de Ouro:** Foque na clareza do banco de dados. Um banco bem relacionado é o que diferencia um desenvolvedor Júnior de um Pleno.

**Bom trabalho, Coder! Estamos ansiosos para ver sua solução.** 🚀

