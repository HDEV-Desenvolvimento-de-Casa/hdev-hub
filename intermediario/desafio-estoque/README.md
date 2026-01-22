# 📦 Desafio Fullstack Intermediário: Gestor de Estoque Inteligente (StockPro)

> **Quem não controla o que tem, não sabe o que pode vender. Construa uma ferramenta essencial para qualquer pequeno comércio ou e-commerce.**

## 📌 O Problema Real

Pequenos lojistas muitas vezes perdem vendas por falta de produto ou compram itens que já têm em excesso, ficando com dinheiro parado. Planilhas falham porque não registram o histórico de quem tirou o produto ou quando ele entrou. Um sistema de estoque profissional precisa de **rastreabilidade** e **alertas de reposição**.

## 💡 A Solução

Você desenvolverá o **StockPro**, um sistema de gestão de inventário que controla entradas (compras), saídas (vendas/perdas) e gera alertas automáticos quando o estoque está baixo.

---

## 🟡 Requisitos de Nível Intermediário

### 1. Modelagem de Dados Relacional (SQLite)

O foco aqui é o relacionamento entre o cadastro do produto e o seu histórico de movimentação.

**Estrutura de Tabelas Sugerida:**

```sql
-- 1. Categorias
CREATE TABLE categorias (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL
);

-- 2. Produtos
CREATE TABLE produtos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    categoria_id INTEGER,
    preco_venda DECIMAL(10,2),
    estoque_minimo INTEGER DEFAULT 5,
    estoque_atual INTEGER DEFAULT 0,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- 3. Movimentações (O Histórico de tudo)
CREATE TABLE movimentacoes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    produto_id INTEGER NOT NULL,
    tipo TEXT CHECK(tipo IN ('Entrada', 'Saída')) NOT NULL,
    quantidade INTEGER NOT NULL,
    motivo TEXT, -- Ex: "Venda", "Compra", "Ajuste de Inventário", "Produto Vencido"
    data_movimento DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (produto_id) REFERENCES produtos(id) ON DELETE CASCADE
);

```

### 2. Regras de Negócio (Lógica Corporativa)

O sistema deve implementar estas validações obrigatórias:

* **Bloqueio de Estoque Negativo:** O sistema não pode permitir uma "Saída" se a quantidade for maior que o `estoque_atual`.
* **Atualização Automática:** Sempre que uma `movimentacao` for registrada, o campo `estoque_atual` na tabela `produtos` deve ser atualizado. (Dica: Use **Transactions** no seu código ou **Triggers** no SQL).
* **Alerta de Reposição:** Destacar visualmente (ex: cor vermelha) os produtos onde `estoque_atual <= estoque_minimo`.

### 3. Consulta de Relatório (SQL Avançado)

Implemente uma query para ver o valor total do seu estoque (dinheiro parado):

```sql
SELECT 
    p.nome, 
    p.estoque_atual, 
    (p.estoque_atual * p.preco_venda) AS valor_investido
FROM produtos p
WHERE p.estoque_atual > 0;

```

---

## 🎯 Funcionalidades do MVP

* [ ] **Painel de Alertas:** Exibir logo no início quais produtos precisam de compra urgente.
* [ ] **Gestão de Produtos:** CRUD completo com categoria.
* [ ] **Fluxo de Movimentação:** Tela simples para registrar se está entrando ou saindo mercadoria.
* [ ] **Filtro por Categoria:** Localizar produtos rapidamente.

---

## 💰 Potencial de Renda Extra

Este é um dos sistemas mais fáceis de vender. Toda loja de bairro (roupas, peças, cosméticos) precisa disso.

* **Público:** Vendedores de Instagram/Shopee, mercadinhos, lojas de ferragens.
* **Valor de mercado:** Configuração inicial de **R$ 600,00 a R$ 1.200,00**.
* **Diferencial:** Se você fizer o sistema rodar offline (localmente com SQLite) e ele for rápido, o lojista vai preferir o seu do que sistemas web lentos.

---

## 📦 Como enviar sua Entrega (Padrão HDEV)

1. **Repositório:** Código no GitHub com o arquivo SQLite.
2. **Vídeo:** Demonstre: Cadastrar um produto -> Registrar uma entrada -> Tentar fazer uma saída maior que o estoque (erro esperado) -> Fazer uma saída válida e mostrar o saldo atualizado.
3. **Issue:** No repositório oficial da comunidade, abra uma **New Issue** com o template **"🚀 Enviar entrega do desafio"**.
4. **Links:** Informe a URL do repositório e o link do vídeo.

---

## 🔗 Apoio Técnico

* **SQLite Transactions:** Importante para garantir que a movimentação e a atualização do saldo ocorram juntas.
* **CSS Dinâmico:** Use classes condicionais para o alerta de estoque baixo.

**Este desafio encerra o nível intermediário. Se você chegar aqui, você já entende como os dados fluem em uma empresa real!** 🚀
