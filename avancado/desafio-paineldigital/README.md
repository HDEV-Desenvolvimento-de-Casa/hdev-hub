# 📺 Desafio Fullstack Avançado: Digital Signage "CloudScreen"

> **Transforme qualquer TV ou monitor num canal de comunicação profissional. Controle o conteúdo de centenas de ecrãs de forma centralizada.**

## 📌 O Problema Real

Clínicas, ginásios e restaurantes têm televisões que ficam sintonizadas em canais genéricos ou paradas em imagens estáticas. Mudar o conteúdo via "pen drive" é lento e ineficiente. O mercado precisa de uma solução onde o dono do negócio mude uma imagem no seu computador e, instantaneamente, a TV do outro lado da cidade seja atualizada.

## 💡 A Solução

Você desenvolverá o **CloudScreen**, uma plataforma onde:

1. **Dashboard (Admin):** Onde o utilizador faz login, gere os seus ecrãs e cria playlists de mídia.
2. **Player (Exibição):** Uma página web simples (URL única) que, ao ser aberta numa SmartTV ou TV Box, entra em modo "loop" exibindo o conteúdo programado.

---

## 🔴 Requisitos de Nível Avançado

### 1. Modelagem Relacional e Segurança (SQLite)

A segurança é fundamental. O "Player" não pode ter acesso às rotas de edição do "Admin".

**Estrutura de Tabelas Sugerida:**

```sql
-- 1. Utilizadores (Auth)
CREATE TABLE usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    login TEXT UNIQUE NOT NULL,
    senha_hash TEXT NOT NULL
);

-- 2. Terminais (As TVs/Ecrãs)
CREATE TABLE terminais (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL, -- Ex: "TV Recepção", "Monitor Lanchonete"
    chave_acesso TEXT UNIQUE NOT NULL, -- Token único para o Player se identificar
    ultima_vez_online DATETIME
);

-- 3. Mídia (Conteúdo)
CREATE TABLE midias (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT,
    url_arquivo TEXT NOT NULL, -- Link da imagem ou vídeo
    tipo TEXT CHECK(tipo IN ('Imagem', 'Vídeo')) NOT NULL,
    duracao_segundos INTEGER DEFAULT 10
);

-- 4. Playlist (Relacionamento N:N entre Terminal e Mídia)
CREATE TABLE playlists (
    terminal_id INTEGER,
    midia_id INTEGER,
    ordem INTEGER,
    FOREIGN KEY (terminal_id) REFERENCES terminais(id),
    FOREIGN KEY (midia_id) REFERENCES midias(id)
);

```

### 2. Regras de Negócio Avançadas

* **Autenticação JWT/Session:** O Dashboard deve ser protegido por login.
* **Token de Terminal:** O Player (TV) não faz login. Ele acede a uma URL como `seusite.com/player/CHAVE_UNICA`. O sistema deve validar essa chave para entregar a playlist correta.
* **Atualização Automática (Polling/Interval):** O Player deve verificar a cada X minutos se houve alteração na playlist sem que ninguém precise de atualizar a página manualmente.
* **Gestão de Estado:** No Dashboard, deve aparecer se a TV está "Online" ou "Offline" com base na última vez que o Player solicitou dados.

### 3. Frontend (Admin vs. Player)

* **Admin:** Interface de gestão (CRUD de mídias e terminais).
* **Player:** Deve ser **Full Screen** (Ecrã total), sem barras de rolagem, com transições suaves entre as mídias.

---

## 🎯 Funcionalidades do MVP

* [ ] **Sistema de Login:** Proteção da área administrativa.
* [ ] **Gestão de Terminais:** Gerar chaves de acesso para novas TVs.
* [ ] **Upload/Link de Mídias:** Organizar o que será exibido.
* [ ] **Modo Player:** Página otimizada que roda o loop infinito de imagens/vídeos baseada na chave de acesso.

---

## 💰 Modelo de Negócio (SaaS)

Este é um projeto de alta escalabilidade.

* **Como vender:** Você cobra por "Ponto de Exibição".
* **Exemplo:** Uma clínica com 3 TVs paga uma mensalidade de R$ 150,00 (R$ 50 por tela).
* **Custo:** Como usa SQLite e é uma aplicação leve, o seu custo de servidor será mínimo, permitindo uma margem de lucro altíssima.

---

## 📦 Como enviar sua Entrega (Padrão HDEV)

1. **Repositório:** Código no GitHub. **Importante:** Não envie as senhas ou segredos no código (use `.env`).
2. **Vídeo:** Mostre o Admin criando uma playlist e, em seguida, abra outra aba (simulando a TV) onde o conteúdo começa a rodar sozinho.
3. **Issue:** Abra a Issue no repositório oficial com o template de entrega.
4. **Links:** Repositório e vídeo.

---

## 🔗 Apoio Avançado

* **Segurança:** Pesquise sobre `bcrypt` para as senhas.
* **Frontend:** Use o modo `Fullscreen API` do navegador para o Player.
* **SQLite:** Explore o uso de `JOINs` para buscar toda a playlist de um terminal numa única consulta.

**Este desafio valida a sua capacidade de arquitetar sistemas complexos de ponta a ponta. Boa sorte, você está no nível profissional!** 🚀

---
