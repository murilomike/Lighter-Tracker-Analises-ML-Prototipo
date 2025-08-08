from tinydb import TinyDB, Query
from datetime import datetime, timedelta
import random


# 1. Conecta ao TinyDB (cria db.json se não existir)
db = TinyDB('db.json')
eventos = db.table('eventos')  # Coleção 'eventos'

# 2. Dados base para geração de eventos fictícios
user_ids = ["murilo_123", "ana_456", "joao_789", "lara_321"]
tipos_evento = ["perda", "uso", "humor"]
locais = ["casa", "trabalho", "bar", "rua"]
humores = ["feliz", "ansioso", "tranquilo", "irritado"]
tipos_isqueiro = ["bic_vermelho", "clipper_preto", "mini_verde"]


# 3. Função para gerar um evento fictício
def gerar_evento():
    return {
        "user_id": random.choice(user_ids),
        "evento": random.choice(tipos_evento),
        "data": (datetime.now() - timedelta(minutes=random.randint(0, 10000))).strftime("%Y-%m-%d %H:%M:%S"),
        "localizacao": random.choice(locais),
        "humor": random.choice(humores),
        "tipo_isqueiro": random.choice(tipos_isqueiro),
        "uso_diario": random.randint(1, 10),
        "geolocalizacao": {
            "lat": round(random.uniform(-23.6, -15.7), 4),  # Latitudes no Brasil
            "lon": round(random.uniform(-47.9, -40.0), 4)   # Longitudes no Brasil
        },
        "nivel_estresse": random.randint(1, 10)
    }

# 4. Gera 100 eventos fictícios
eventos.purge()  # Limpa a coleção para evitar duplicatas
for _ in range(100):
    eventos.insert(gerar_evento())

print("✅ 100 eventos fictícios inseridos no banco (db.json).")



# 5. Exemplos de consultas
# Consulta 1: Todos os eventos de um usuário
Usuario = Query()
print("\n🔎 Eventos do usuário 'murilo_123':")
for ev in eventos.search(Usuario.user_id == "murilo_123"):
    print(ev)

# Consulta 2: Eventos de perda
print("\n🔎 Eventos de 'perda':")
for ev in eventos.search(Usuario.evento == "perda"):
    print(ev)

# Consulta 3: Eventos com alto estresse (>7)
print("\n🔎 Eventos com nível de estresse > 7:")
for ev in eventos.search(Usuario.nivel_estresse > 7):
    print(ev)

