# 🅿️ EstacionamentoOn — Desafio HDEV

Bem-vindo ao **Desafio Oficial HDEV**!  
Este desafio é parte da fase de testes da comunidade **HDEV | Desenvolvimento de Casa**.

O objetivo é criar um sistema simples e funcional de **Gestão de Estacionamento**, utilizando qualquer tecnologia (Web ou Desktop), mas **obrigatoriamente com SQLite local**.

Este repositório deve ser **forkado** para iniciar sua solução.

---

## 🎯 Objetivo do Desafio

Criar um sistema funcional que permita:

- Cadastro de veículos  
- Registro automático de entrada  
- Cálculo de permanência  
- Registro de saída  
- Cálculo automático do valor a pagar  
- Controle básico de status (Estacionado / Finalizado)  
- Interface simples e funcional  

Não importa o framework ou linguagem — somente que funcione.

---

## ⚙️ Funcionalidades Obrigatórias

- Cadastro de veículos (Placa, Modelo, Cor)  
- Entrada com data e hora automática  
- Cálculo de permanência  
- Regras de cobrança:  
  - Primeiras **2 horas = R$ 18,00**  
  - Cada hora adicional **= R$ 5,00**  
- Registro de saída  
- Atualização do status  
- Login simples  
- Interface funcional (Web responsiva ou Desktop)  

---

## 🧱 Banco de Dados (SQLite)

O banco deve ser **local** e utilizar SQLite.

Modelo sugerido:

```sql
CREATE TABLE Veiculos (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Placa TEXT NOT NULL,
    Modelo TEXT,
    Cor TEXT,
    DataEntrada DATETIME NOT NULL,
    HoraEntrada TEXT NOT NULL,
    DataSaida DATETIME,
    ValorPago DECIMAL(10,2),
    Status TEXT NOT NULL
);
````

---

## 🚀 Como Participar

1. Faça o **fork** deste repositório.
2. Crie seu projeto usando a tecnologia que preferir.
3. Inclua no seu README:

   * Tecnologias utilizadas
   * Como rodar
   * Prints do sistema funcionando
   * Vídeo demonstrativo (YouTube, Loom ou MP4)
4. Volte ao repositório oficial:
   👉 [https://github.com/HDEV-Desenvolvimento-de-Casa/hdev-hub](https://github.com/HDEV-Desenvolvimento-de-Casa/hdev-hub/issues)
5. Abra uma **Issue de ENTREGRA** usando o template oficial.

A análise será feita automaticamente pelo validador .

---

## 📚 Material de Apoio

📽️ Video:
> https://youtu.be/mmddpL6So3g

📺 Apresentação:
> [Estrutura Slides](Desafio_EstacionamentoOn_Do_Código_à_Conquista.pdf).


---

## 📝 O que será validado

A validação automática confere:

* Se o repositório existe
* Se contém README
* Se o projeto menciona **SQLite**
* Se o README possui **imagens/prints**
* Se o README possui **vídeo demonstrativo**

Se tudo estiver correto, sua entrega será marcada como:

`aprovado`

Se faltar algo, será marcada como:

`reprovado`

---

## 🏅 Badges

Durante a , os badges são aplicados **manualmente**.
A lista de badges oficiais está no repositório:

```
hdev-hub/badges/
```

---

## 📣 Comunidade HDEV

Este desafio é parte da fase inicial da comunidade **HDEV | Desenvolvimento de Casa**, criada para oferecer prática real, desafios e mentoria para desenvolvedores de todos os níveis.

Conecte-se, avance e construa junto com a gente. 🚀

---

## 📄 Licença

Este repositório é disponibilizado apenas para fins de desafio educacional dentro da comunidade HDEV.
