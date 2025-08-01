# Lighter-Tracker-Analises-ML-Prototipo

# 🔥 LighterTracker - Projeto de Data Science Comportamental

**LighterTracker** é um sistema inteligente de rastreamento e análise de perdas de objetos pessoais, com foco inicial em **isqueiros**, mas com potencial para expandir para chaves, fones de ouvido, cartões, entre outros itens do cotidiano.

Este projeto foi criado com base em **uma observação pessoal recorrente**: por que as pessoas perdem tanto objetos pequenos e aparentemente banais como isqueiros? A partir dessa pergunta simples, nasceu um sistema completo que analisa **dados comportamentais**, simula perfis de usuários, prevê perdas com base em padrões e oferece **insights práticos** tanto para os usuários quanto para comerciantes.

> 💡 O LighterTracker é um case completo de **Ciência de Dados aplicada**, desenvolvido por **Murilo**, em transição de carreira, utilizando todo o ciclo de vida dos dados — da geração e análise à visualização, predição e apresentação.

---

## 🎯 Objetivos do Projeto

- Investigar o comportamento de perda de objetos pessoais
- Criar uma base de dados sintética realista e segmentada
- Aplicar métodos estatísticos, exploratórios e preditivos (ML)
- Construir protótipos visuais que demonstrem a funcionalidade do sistema
- Criar uma base NoSQL complementar à base relacional
- Desenvolver um agente conversacional no Telegram
- Gerar um portfólio profissional e publicável com base no case

---

## 🧠 Funcionamento do Sistema

### 👤 Sistema do Usuário

O módulo do usuário registra e analisa:
- Uso do isqueiro (dia, horário, frequência)
- Estado emocional no momento do uso
- Probabilidade de perda com base no perfil comportamental
- Recomendações para evitar perdas
- Classificação de perfis (distraído, impulsivo, cuidadoso, etc.)

Ele também fornece insights como:
- Horários com maior risco de perda
- Dicas personalizadas baseadas em dados
- Predição de perda futura com base em variáveis como humor, frequência, tipo de uso

### 🛍️ Sistema do Comerciante

O módulo do comerciante oferece:
- Análise dos perfis dos usuários na região
- Sugestões de mix de produtos personalizados (por cor, tipo, frequência de reposição)
- Dados econômicos e culturais cruzados (ex: PIB per capita x tipo de consumidor)
- Predição de demanda local
- Possibilidade de uso para definir localização de lojas ou campanhas

---

## 📊 Notebooks do Projeto

| Notebook | Finalidade |
|----------|------------|
| `1_geracao_base_sintetica.ipynb` | Gera dados realistas de usuários, baseados em variáveis comportamentais |
| `2_analise_exploratoria.ipynb`  | Realiza análise estatística e gráfica da base |
| `3_modelo_regressao.ipynb`      | Aplica regressão linear para prever intensidade de uso e risco de perda |
| `4_modelo_classificacao.ipynb`  | Aplica modelo de classificação (árvore de decisão) para prever perdas |
| `5_comportamento_comerciante.ipynb` | [Em andamento] Foca na análise do comportamento do ponto de venda e estoque inteligente |

---

## 🧬 Base NoSQL

Além da base relacional em SQL, o projeto inclui uma **estrutura NoSQL (MongoDB)**, usada para representar de forma mais flexível os dados comportamentais dos usuários.

Exemplos de documentos:
```json
{
  "usuario_id": "U001",
  "uso": [
    {"data": "2025-07-30", "hora": "19:42", "estado_emocional": "ansioso"},
    {"data": "2025-07-31", "hora": "08:12", "estado_emocional": "calmo"}
  ],
  "perfil_comportamental": "impulsivo",
  "alertas": ["alta chance de perda às sextas-feiras à noite"]
}
