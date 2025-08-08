
# LighterTracker: Banco NoSQL e Integração com PostgreSQL

Este projeto demonstra a criação de um banco NoSQL com TinyDB e a transferência dos dados para um banco PostgreSQL, no contexto do **LighterTracker**, um sistema para rastrear eventos de uso e perda de isqueiros.

---

## 🧱 Procedimento

### 1. Criação do Banco NoSQL com TinyDB

Um banco NoSQL foi configurado usando **TinyDB**, criando três coleções:

- **`users`**: armazena dados de usuários  
  Exemplo de campos:  
  `user_id`, `name`, `email`, `created_at`, `preferences`.

- **`lighters`**: registra os isqueiros  
  Exemplo de campos:  
  `lighter_id`, `user_id`, `type`, `brand`, `acquisition_date`, `status`.

- **`events`**: contém eventos comportamentais  
  Exemplo de campos:  
  `event_id`, `user_id`, `lighter_id`, `event_type`, `timestamp`, `location`, `mood`, `stress_level`, `geolocation`.

> Um script Python gerou dados fictícios:  
> - 4 usuários  
> - 8 isqueiros (2 por usuário)  
> - 50 eventos  
>  
> Os dados foram salvos no arquivo `db.json`.

---

### 2. Transferência para PostgreSQL

Os dados das coleções do TinyDB foram processados usando **pandas**:

- O campo **`geolocation`** em `events` foi dividido em duas colunas: `lat` e `lon`.
- Campos de data como `created_at`, `acquisition_date` e `timestamp` foram convertidos para o formato `datetime`.

Os dados foram então transferidos para o **PostgreSQL** em três tabelas:

- `users_lightertracker`
- `lighters_lightertracker`
- `events_lightertracker`

A transferência foi feita utilizando **SQLAlchemy**:

- A conexão utilizou as credenciais fornecidas.
- As tabelas foram criadas (ou substituídas) no banco de dados.
- O campo `preferences` da tabela `users` foi salvo como **JSONB**, garantindo flexibilidade estrutural.

---
