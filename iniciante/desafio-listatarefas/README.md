# 🛒 Desafio Fullstack #Gestor de Compras "Carrinho Cheio"

> **Pare de esquecer o leite! Transforme a lista de compras de papel numa ferramenta digital que organiza o seu trajeto dentro do mercado.**

## 📌 O Problema Real

Fazer compras confiando apenas na memória ou em mensagens soltas no WhatsApp é receita para o erro. As listas de tarefas comuns (To-Do) não funcionam bem no mercado porque não agrupam os produtos por setor (Hortifruti, Limpeza, Açougue), obrigando o utilizador a dar voltas desnecessárias no estabelecimento.

## 💡 A Solução

O **"Carrinho Cheio"** é um gestor de listas de compras focado em **agilidade**. O diferencial é a organização por categorias, permitindo que o utilizador veja tudo o que precisa de comprar num corredor antes de passar para o próximo.

---

## 🛠️ Especificações Técnicas

### 1. Banco de Dados (Obrigatório: SQLite)

Para este desafio, a modelagem foi pensada para permitir múltiplas listas e uma organização impecável. Utilize o esquema abaixo:

```sql
-- Tabela de Listas (Ex: Compras Mensais, Churrasco, Festa)
CREATE TABLE listas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Categorias (Para organizar o trajeto no mercado)
CREATE TABLE categorias (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL UNIQUE -- Ex: Açougue, Higiene, Hortifruti, Bebidas
);

-- Tabela de Itens da Lista
CREATE TABLE itens (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    lista_id INTEGER NOT NULL,
    categoria_id INTEGER,
    nome_item TEXT NOT NULL,
    quantidade TEXT, -- Ex: "2 kg", "1 pacote", "5 unidades"
    comprado BOOLEAN DEFAULT 0, -- 0 para não, 1 para sim
    FOREIGN KEY (lista_id) REFERENCES listas(id) ON DELETE CASCADE,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

```

### 2. Backend (Livre)

* Implemente em **PHP, Python, Node.js, C#, Java** ou qualquer linguagem que suporte SQLite.
* **Funcionalidade Crítica:** Quando um item for marcado como "comprado", o estado deve ser guardado no banco via API (sem recarregar a página).

### 3. Frontend (UX de "Mão Ocupada")

* **Mobile-First:** O utilizador estará a segurar um carrinho ou cesto. Os botões devem ser fáceis de clicar com o polegar.
* **Agrupamento:** Exiba os itens agrupados por categoria.
* **Visual:** Itens marcados como comprados devem ser movidos para o fundo da lista ou riscados de forma clara.

---

## 🎯 Funcionalidades para o MVP (Produto Mínimo Viável)

* [ ] **Gerir Múltiplas Listas:** Criar, editar e apagar listas diferentes.
* [ ] **Gestão de Itens:** Adicionar itens definindo nome, quantidade e categoria.
* [ ] **Checklist em Tempo Real:** Marcar o que já foi apanhado da prateleira.
* [ ] **Soma de Itens:** Mostrar quantos itens faltam para terminar a compra (Ex: "Faltam 3 de 10").

---

## 💰 Diferencial para Venda (O seu lucro)

Este projeto torna-se vendável quando adiciona estas "features":

1. **Estimativa de Preços:** Adicione um campo de valor para cada item e mostre o total que o utilizador pagará no caixa antes de chegar lá.
2. **Partilha Simples:** Botão para exportar a lista formatada para o WhatsApp da pessoa que vai ao mercado.
3. **Sugestão de Itens:** Criar "Templates" de listas (Ex: "Lista Básica de Sobrevivência" ou "Kit Limpeza Semanal").

---

## 📦 Como enviar sua Entrega (Padrão HDEV)

Para validar a sua submissão, siga estes passos:

1. **Repositório:** Suba o código para o GitHub (incluindo o arquivo `.db` ou o script de migração).
2. **Vídeo:** Grave um vídeo demonstrando a criação de uma lista e a marcação de itens como comprados.
3. **Issue:** No repositório oficial da comunidade, vá em **Issues** -> **New Issue**.
4. **Template:** Escolha o modelo **"🚀 Enviar entrega do desafio"**.
5. **Links:** Cole o link do repositório e do vídeo.

---

## 🔗 Links de Apoio

* **Documentação SQLite:** [sqlite.org](https://www.sqlite.org/)
* **Padrão de Validação:** [hdev.com.br/hub/#validacao](https://hdev.com.br/hub/#validacao)

**Mãos à obra! Desenvolva algo que facilite a vida de quem faz as compras da casa.** 🚀