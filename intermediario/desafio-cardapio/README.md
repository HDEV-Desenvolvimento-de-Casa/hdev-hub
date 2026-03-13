# 🍕 Desafio Fullstack Intermediário: Cardápio Digital QR Code (E-Cardápio)

> **Acabe com os custos de impressão e menus desatualizados. Crie uma plataforma onde o restaurante gerencia o que o cliente vê em tempo real.**

## 📌 O Problema Real

Restaurantes, lanchonetes e bares sofrem toda vez que um ingrediente sobe de preço ou um item acaba no estoque: o cardápio de papel fica desatualizado ou cheio de rasuras. O cliente quer rapidez e fotos bonitas no telemóvel/celular.

## 💡 A Solução

Você desenvolverá o **E-Cardápio**, um sistema composto por duas partes:

1. **Visão do Cliente:** Uma página web elegante, rápida e otimizada para mobile que lista os produtos por categoria.
2. **Painel do Lojista:** Área restrita para cadastrar produtos, alterar preços e "pausar" itens que acabaram no dia.

---

## 🟡 Requisitos de Nível Intermediário

### 1. Modelagem de Dados Relacional (SQLite)

Neste projeto, a relação entre Categorias e Produtos é fundamental para a organização da interface.

**Estrutura de Tabelas Sugerida:**

```sql
-- 1. Categorias (Ex: Pizzas, Bebidas, Sobremesas)
CREATE TABLE categorias (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    ordem INTEGER DEFAULT 0 -- Para ordenar o cardápio (ex: Entradas primeiro)
);

-- 2. Produtos
CREATE TABLE produtos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    categoria_id INTEGER NOT NULL,
    nome TEXT NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    imagem_url TEXT, -- Link para a foto do prato
    disponivel BOOLEAN DEFAULT 1, -- 1 para Sim, 0 para "Esgotado"
    FOREIGN KEY (categoria_id) REFERENCES categorias(id) ON DELETE CASCADE
);

```

### 2. Regras de Negócio (Processos Corporativos)

* **Disponibilidade em Tempo Real:** Se o lojista marcar um produto como `disponivel = 0`, ele deve desaparecer automaticamente (ou aparecer como "Esgotado") na visão do cliente.
* **Agrupamento por Categoria:** O backend deve entregar os produtos agrupados pelas suas categorias para que o frontend não precise processar dados pesados.
* **Preço Dinâmico:** O sistema deve suportar atualizações instantâneas. Se o preço mudar no banco, todos os clientes que abrirem o QR Code verão o novo valor.

### 3. Diferencial Técnico: Filtro Amigável

Implemente uma busca ou filtros por categoria no topo da página do cliente (Ex: "Clique em 'Bebidas' e a página rola até a seção de bebidas").

---

## 🎯 Funcionalidades do MVP

* [ ] **Visão do Cliente:** Menu responsivo, limpo e com fotos.
* [ ] **Gestão de Categorias:** Adicionar ou renomear categorias.
* [ ] **Gestão de Itens:** Cadastro de nome, descrição (ingredientes), preço e foto.
* [ ] **Switch de Status:** Um botão simples no painel para ativar/desativar um produto instantaneamente.

---

## 💰 Pronto para Venda: Como faturar?

O Cardápio Digital é a porta de entrada para muitos desenvolvedores no mercado de freelancers:

* **O Produto:** Você entrega o sistema e um **QR Code** impresso para o dono do restaurante colar nas mesas.
* **Público:** Restaurantes, Food Trucks, Quiosques de Praia e Cafetarias.
* **Valor de Mercado:** * **Setup Inicial:** R$ 400,00 a R$ 800,00 (Configuração e fotos).
* **Mensalidade (SaaS):** R$ 30,00 a R$ 60,00 (Para manter o sistema no ar e dar suporte).



---

## 📦 Como enviar sua Entrega (Padrão HDEV)

Siga os passos oficiais para validação:

1. **GitHub:** Suba o código completo e o arquivo SQLite com alguns produtos de exemplo (Seed).
2. **Vídeo:** Mostre duas janelas: o Painel Administrativo desativando um produto e a Visão do Cliente atualizando para refletir a mudança.
3. **Issue:** Vá em **Issues** -> **New Issue** e selecione o template **"🚀 Enviar entrega do desafio"**.
4. **Links:** Cole a URL do repositório e o link do seu vídeo demonstrativo.

---

## 🔗 Apoio Técnico

* **Imagens:** Você pode usar o link de imagens do Unsplash para os testes iniciais.
* **CSS:** Foque no "App-like feel" (parecer um aplicativo nativo no telemóvel).

**O mercado de alimentação não para. Construa hoje a solução que o restaurante do seu bairro precisa!** 🚀

> Nosso projeto vinculado á HDEV tem caráter exclusivamente acadêmico, sem fins comerciais ou de exploração da marca registrada por alguma empresa.

