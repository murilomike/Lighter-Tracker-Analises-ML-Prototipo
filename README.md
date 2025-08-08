
# 🔥 LighterTracker - Projeto de Data Science Comportamental.

<div align="center">
  <img src="Lighter_Tracker\1.apresentacao\apresentação e pitch\1_LighterTracker.png" alt="Capa do projeto LighterTracker" width="600"/>
</div>


<div  align="center">

  

![LighterTracker Logo](https://img.shields.io/badge/🔥-LighterTracker-orange?style=for-the-badge&logoColor=white)

  

**Um sistema inteligente de análise comportamental para prever perdas de objetos pessoais**

  

[![Python](https://img.shields.io/badge/Python-3.8+-blue?style=flat-square&logo=python)](https://python.org)

[![Pandas](https://img.shields.io/badge/Pandas-1.3+-150458?style=flat-square&logo=pandas)](https://pandas.pydata.org)

[![Scikit-Learn](https://img.shields.io/badge/Scikit--Learn-1.0+-F7931E?style=flat-square&logo=scikit-learn)](https://scikit-learn.org)

[![MongoDB](https://img.shields.io/badge/MongoDB-4.4+-47A248?style=flat-square&logo=mongodb)](https://mongodb.com)

[![SQL Server](https://img.shields.io/badge/SQL%20Server-2019+-CC2927?style=flat-square&logo=microsoft-sql-server)](https://microsoft.com/sql-server)

  

</div>

  

---

  

## 🎯 Sobre o Projeto

  

**LighterTracker** nasceu de uma pergunta simples do cotidiano: *"Por que as pessoas perdem tanto objetos pequenos como isqueiros?"*

<div align="center">
  <img src="Lighter_Tracker\1.apresentacao\apresentação e pitch\3_Os-3-Problemas-que-Encontrei.png" alt="Capa do projeto LighterTracker" width="600"/>
</div>  


A partir dessa curiosidade, desenvolvemos um **sistema completo de Data Science** que:

- 🔍 Analisa padrões comportamentais de perda de objetos

- 🤖 Prediz probabilidade de perda usando Machine Learning

- 📊 Oferece insights acionáveis para usuários e comerciantes

- 🚀 Demonstra aplicação prática de ciência de dados no cotidiano

  

> 💡 **Case Completo**: Este projeto percorre todo o ciclo de vida dos dados — da geração sintética à predição, visualização e aplicação comercial.

  

## 🧠 Como Funciona

  

### 👤 **Sistema do Usuário**

```

Entrada: Padrões de uso + Estado emocional + Contexto

↓

Análise: Algoritmos de classificação de perfil

↓

Saída: Predições + Recomendações personalizadas

```

<div align="center">
  <img src="Lighter_Tracker\5.prototipos\sistema_usuário.jpg" alt="Capa do projeto LighterTracker" width="250"/>
</div>  

**Recursos:**

- Classificação automática de perfis (Distraído, Impulsivo, Cuidadoso, Ansioso)

- Predição de probabilidade de perda em tempo real

- Recomendações personalizadas baseadas em padrões históricos

- Alertas preventivos em horários/situações de alto risco

  

### 🛍️ **Sistema do Comerciante**

```

Entrada: Dados regionais + Perfis de usuários + Economia local

↓

Análise: Cruzamento de dados comportamentais e econômicos

↓

Saída: Insights de negócio + Otimização de estoque

```

<div align="center">
  <img src="Lighter_Tracker\5.prototipos\sistema_comerciante.jpg" alt="Capa do projeto LighterTracker" width="600"/>
</div>  

**Recursos:**

- Análise de demanda local por tipo de produto

- Sugestões de mix de produtos por região

- Predição de sazonalidade e picos de venda

- Otimização de localização de pontos de venda

  

## 📊 Estrutura do Projeto

  

```

LighterTracker/
├── apresentacao/           # Slides, PDFs e materiais de apresentação
├── notebooks/              # Notebooks Jupyter com análises e modelos
├── sql & banco original/   # Scripts SQL e estrutura do banco relacional
├── nosql/                  # Dados e scripts relacionados ao MongoDB
├── prototipos/             # Mockups e protótipos de interface
├── agente_telegram/        # Código do bot conversacional
├── streamlit/              # Aplicação interativa em Streamlit
├── portfolio_curriculo/    # Currículo e portfólio pessoal
├── .gitignore              # Arquivos e pastas ignoradas pelo Git
├── README.md               # Documentação principal do projeto
├── Estrutura de Pastas.txt # Descrição textual da organização
└── requirements.txt        # Lista de dependências do projeto


```

  

## 🚀 Quick Start

  

### Pré-requisitos

```bash

Python  3.8+

SQL  Server  2019+ (ou SQLite  para  desenvolvimento)

```

  

### Instalação

```bash

# Clone o repositório

git  clone https://github.com/murilomike/Lighter-Tracker-Analises-ML-Prototipo.git

cd  lightertracker

  

# Crie um ambiente virtual

python  -m  venv  venv

source  venv/bin/activate  # Linux/Mac

# ou

venv\Scripts\activate  # Windows

  

# Instale as dependências

pip  install  -r  requirements.txt

  

# Configure as variáveis de ambiente

cp  .env.example  .env

# Edite .env com suas configurações

```

  

### Executando os Notebooks

```bash

# Inicie o Jupyter ou Collab

jupyter/collab  notebook

# Execute na ordem:

# 1. notebooks/1_geracao_base_sintetica.ipynb

# 2. notebooks/2_analise_exploratoria.ipynb

# 3. notebooks/3_modelo_regressao.ipynb

# 4. notebooks/4_modelo_classificacao.ipynb

# 4. notebooks/5_analise_comerciante.ipynb

```

  

## 📈 Principais Descobertas (fictícias)

  

### 🔍 **Padrões Comportamentais Identificados**

  

| Perfil | Risco de Perda | Principais Gatilhos | Frequência Mensal |

|--------|----------------|---------------------|-------------------|

| **Distraído** | 78% | Multitarefas, pressa | 3-4 objetos |

| **Impulsivo** | 85% | Estresse, mudanças bruscas | 4-6 objetos |

| **Cuidadoso** | 23% | Situações atípicas | 0-1 objeto |

| **Ansioso** | 82% | Picos de ansiedade | 3-5 objetos |

  

### 📊 **Insights Temporais**

-  **Sexta-feira à noite**: 340% mais perdas que a média

-  **Segunda-feira de manhã**: Segundo maior pico (stress pós-weekend)

-  **Horário de rush** (7h-9h, 17h-19h): 65% das perdas urbanas

-  **Mudanças de estação**: +45% de perdas em transições climáticas

  

### 💰 **Impacto Comercial**

-  **ROI projetado**: 280% para comerciantes que implementaram as recomendações

-  **Redução de estoque parado**: 35% com otimização preditiva

-  **Aumento de vendas**: 23% com mix personalizado por região

  

## 🛠️ Stack Tecnológica

  

### **Core Data Science**

- ![Python](https://img.shields.io/badge/-Python-3776AB?style=flat-square&logo=python&logoColor=white) **Python 3.8+**: Linguagem principal

- ![Pandas](https://img.shields.io/badge/-Pandas-150458?style=flat-square&logo=pandas&logoColor=white) **Pandas**: Manipulação de dados

- ![NumPy](https://img.shields.io/badge/-NumPy-013243?style=flat-square&logo=numpy&logoColor=white) **NumPy**: Computação numérica

- ![Scikit-Learn](https://img.shields.io/badge/-Scikit--Learn-F7931E?style=flat-square&logo=scikit-learn&logoColor=white) **Scikit-Learn**: Machine Learning

  

### **Visualização**

- ![Matplotlib](https://img.shields.io/badge/-Matplotlib-11557c?style=flat-square) **Matplotlib**: Gráficos estatísticos

- ![Seaborn](https://img.shields.io/badge/-Seaborn-388e3c?style=flat-square) **Seaborn**: Visualizações avançadas

- ![Power BI](https://img.shields.io/badge/-Power%20BI-F2C811?style=flat-square&logo=power-bi&logoColor=black) **Power BI**: Dashboards interativos

  

### **Banco de Dados**

- ![SQL Server](https://img.shields.io/badge/-SQL%20Server-CC2927?style=flat-square&logo=microsoft-sql-server&logoColor=white) **SQL Server**: Base relacional principal

- ![MongoDB](https://img.shields.io/badge/-MongoDB-47A248?style=flat-square&logo=mongodb&logoColor=white) **MongoDB**: Dados comportamentais NoSQL

  

### **Deployment & Integração**

- ![Telegram](https://img.shields.io/badge/-Telegram%20Bot-2CA5E0?style=flat-square&logo=telegram&logoColor=white) **Telegram API**: Bot conversacional

- ![Google Colab](https://img.shields.io/badge/-Google%20Colab-F9AB00?style=flat-square&logo=google-colab&logoColor=white) **Google Colab**: Desenvolvimento colaborativo

- ![GitHub](https://img.shields.io/badge/-GitHub-181717?style=flat-square&logo=github&logoColor=white) **GitHub**: Versionamento e documentação

  

## 🤖 Bot Telegram

  

O LighterTracker inclui um **agente conversacional inteligente** no Telegram que oferece:

[Fale com o agente](https://t.me/Murilo_AgenteLighterTrackerbot)

```python

# Comandos principais

/perfil # Análise do seu perfil comportamental

/predicao # Predição de risco para hoje

/historico # Seu histórico de perdas

/dicas # Recomendações personalizadas

/estatisticas # Seus padrões de uso

```

<div align="center">
  <img src="Lighter_Tracker\6.agente_telegram\print_agente.jpg" alt="Capa do projeto LighterTracker" width="250"/>
</div>  
  



### Exemplo de Interação:

```

Usuário: /predicao

Bot: 🔥 Análise para hoje (Sexta, 19h30):

  

⚠️ RISCO ALTO (82%)

📊 Seu perfil: Impulsivo

🎯 Gatilho detectado: Final de semana + Stress

💡 Dica: Coloque o isqueiro sempre no mesmo bolso

🚨 Alternativa: Leve um backup hoje!

```

  

## 📊 Demonstração (fictícia) dos Dados

  

### Estrutura SQL (Resumida)

```sql

-- Tabela principal de usuários

CREATE  TABLE  usuarios (

id INT  PRIMARY KEY,

nome VARCHAR(100),

perfil_comportamental VARCHAR(50),

score_risco DECIMAL(3,2),

created_at DATETIME

);

  

-- Eventos de uso

CREATE  TABLE  eventos_uso (

id INT  PRIMARY KEY,

usuario_id INT,

data_uso DATETIME,

estado_emocional VARCHAR(30),

contexto VARCHAR(100),

perdeu_objeto BOOLEAN

);

```

  

### Estrutura NoSQL (MongoDB)

```javascript

// Documento de usuário

{

"_id": "user_001",

"perfil": "impulsivo",

"uso_historico": [

{

"timestamp":  "2025-07-31T19:42:00Z",

"emocao":  "ansioso",

"contexto":  "saindo_trabalho",

"perdeu":  false

}

],

"predicoes": {

"risco_atual":  0.82,

"proxima_perda_estimada":  "2025-08-03",

"recomendacoes": ["backup_sempre", "local_fixo"]

}

}

```

  

## 📈 Resultados dos Modelos

  

### Modelo de Classificação (Árvore de Decisão)

```

Acurácia: 87.3%

Precision: 0.85

Recall: 0.89

F1-Score: 0.87

  

Principais variáveis preditivas:

1. Estado emocional (importância: 0.34)

2. Horário do dia (importância: 0.28)

3. Frequência de uso (importância: 0.21)

4. Dia da semana (importância: 0.17)

```

  

### Modelo de Regressão (Predição de Intensidade)

```

R²: 0.82

RMSE: 1.23

MAE: 0.87

  

Variáveis mais correlacionadas:

- Stress level: r = 0.73

- Mudanças na rotina: r = 0.68

- Interações sociais: r = -0.45

```

  

## 🎨 Protótipos e Visualizações

  

O projeto inclui **interfaces visuais completas**:

  

- 📱 **App Mobile**: Mockup de aplicativo para usuários

- 💻 **Dashboard Comerciante**: Painel web para lojistas

- 📊 **Relatórios Automatizados**: Templates de análise

- 🎯 **Sistema de Alertas**: Interface de notificações

  

> Ver pasta `prototipos/` para screenshots e wireframes

  

## 🚀 Roadmap e Expansão

  

### Versão 2.0 (Planejada)

- [ ] **Multi-objetos**: Expansão para chaves, fones, cartões

- [ ] **IoT Integration**: Sensores de proximidade e beacons

- [ ] **App Mobile Nativo**: iOS e Android

- [ ] **API Pública**: Integração com outros sistemas

- [ ] **Machine Learning Avançado**: Deep Learning e NLP

  

### Casos de Uso Futuros

- 🏢 **Empresas**: Controle de equipamentos e ferramentas

- 🏥 **Hospitais**: Rastreamento de instrumentos médicos

- 🎓 **Educação**: Controle de materiais escolares

- 🏨 **Hotelaria**: Gestão de objetos esquecidos

  

## 📊 Como Contribuir

  

Adoramos contribuições! Veja como você pode ajudar:

  

### 🐛 Reportando Bugs

```bash

# Use os templates de issue no GitHub

-  Descreva  o  problema  claramente

-  Inclua  steps  para  reproduzir

-  Adicione  screenshots  se  relevante

```

  

### ✨ Sugerindo Features

```bash

# Abra uma issue com:

-  Descrição  da  funcionalidade

-  Justificativa/casos  de  uso

-  Mockups  ou  exemplos (se possível)

```

  

### 🔧 Desenvolvimento

```bash

# Fork o projeto

git  checkout  -b  feature/nova-funcionalidade

# Faça suas alterações

git  commit  -m  "feat: adiciona nova funcionalidade"

git  push  origin  feature/nova-funcionalidade

# Abra um Pull Request

```



  

## 👨‍💻 Sobre o Autor

  

<div  align="center">

  

**Murilo Souza**

*Cientista de Dados em Formação | Ex-Professor de Informática*

  

🔍 *Explorador de padrões do comportamento humano via dados*

  

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/murilo-souza-dba/)

[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/murilomike/Lighter-Tracker-Analises-ML-Prototipo#)

[![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:murilomike@outlook.com)

  

</div>


---

  

<div  align="center">

  

**⭐ Se este projeto foi útil para você, considere dar uma estrela!**

  

*Feito com ❤️ e muita curiosidade científica*

  

</div>



  

---

  


> 💡 **Lembrete**: Este é um projeto de demonstração com dados sintéticos criados para fins educacionais e de portfólio. Para implementação comercial, seria necessário coleta de dados reais com consentimento adequado.
