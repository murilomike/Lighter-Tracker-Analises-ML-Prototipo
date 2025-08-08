from tinydb import TinyDB, Query
from datetime import datetime, timedelta
import random

# 1. Conecta ao TinyDB (cria db.json se não existir)
db = TinyDB('db.json')
users = db.table('users')       # Coleção para usuários
lighters = db.table('lighters') # Coleção para isqueiros
events = db.table('events')     # Coleção para eventos

# 2. Dados base para geração de dados fictícios
user_ids = ["murilo_123", "ana_456", "joao_789", "lara_321"]
names = ["Murilo Silva", "Ana Costa", "João Mendes", "Lara Souza"]
emails = ["murilo@email.com", "ana@email.com", "joao@email.com", "lara@email.com"]
lighter_types = ["bic_vermelho", "clipper_preto", "mini_verde", "zippo_cromado"]
brands = ["Bic", "Clipper", "Generic", "Zippo"]
event_types = ["perda", "uso", "humor"]
locations = ["casa", "trabalho", "bar", "rua"]
moods = ["feliz", "ansioso", "tranquilo", "irritado"]

# 3. Funções para gerar dados fictícios
def gerar_usuario(user_id, name, email):
    return {
        "user_id": user_id,
        "name": name,
        "email": email,
        "created_at": (datetime.now() - timedelta(days=random.randint(0, 30))).strftime("%Y-%m-%d %H:%M:%S"),
        "preferences": {
            "notifications": random.choice([True, False]),
            "timezone": "America/Sao_Paulo"
        }
    }

def gerar_isqueiro(lighter_id, user_id):
    return {
        "lighter_id": lighter_id,
        "user_id": user_id,
        "type": random.choice(lighter_types),
        "brand": random.choice(brands),
        "acquisition_date": (datetime.now() - timedelta(days=random.randint(0, 60))).strftime("%Y-%m-%d %H:%M:%S"),
        "status": random.choice(["ativo", "perdido"])
    }

def gerar_evento(event_id, user_id, lighter_id):
    return {
        "event_id": event_id,
        "user_id": user_id,
        "lighter_id": lighter_id,
        "event_type": random.choice(event_types),
        "timestamp": (datetime.now() - timedelta(minutes=random.randint(0, 10000))).strftime("%Y-%m-%d %H:%M:%S"),
        "location": random.choice(locations),
        "mood": random.choice(moods),
        "stress_level": random.randint(1, 10),
        "geolocation": {
            "lat": round(random.uniform(-23.6, -15.7), 4),  # Latitudes no Brasil
            "lon": round(random.uniform(-47.9, -40.0), 4)   # Longitudes no Brasil
        }
    }

# 4. Limpa as coleções para evitar duplicatas
users.purge()
lighters.purge()
events.purge()

# 5. Gera dados fictícios
# Usuários (4 usuários)
for i in range(len(user_ids)):
    users.insert(gerar_usuario(user_ids[i], names[i], emails[i]))

# Isqueiros (2 por usuário, total de 8)
lighter_count = 1
for user_id in user_ids:
    for _ in range(2):
        lighters.insert(gerar_isqueiro(f"lighter_{lighter_count:03d}", user_id))
        lighter_count += 1

# Eventos (50 eventos, distribuídos entre usuários e isqueiros)
event_count = 1
for _ in range(50):
    user_id = random.choice(user_ids)
    user_lighters = [l['lighter_id'] for l in lighters.search(Query().user_id == user_id)]
    if user_lighters:  # Só gera evento se o usuário tiver isqueiros
        lighter_id = random.choice(user_lighters)
        events.insert(gerar_evento(f"event_{event_count:03d}", user_id, lighter_id))
        event_count += 1

print("✅ Banco NoSQL configurado com 3 coleções:")
print(f"   - {len(users.all())} usuários")
print(f"   - {len(lighters.all())} isqueiros")
print(f"   - {len(events.all())} eventos")

# 6. Exemplos de consultas
# Consulta 1: Todos os usuários
print("\n🔎 Todos os usuários:")
for user in users.all():
    print(user)

# Consulta 2: Isqueiros de um usuário específico
print("\n🔎 Isqueiros do usuário 'murilo_123':")
for lighter in lighters.search(Query().user_id == "murilo_123"):
    print(lighter)

# Consulta 3: Eventos de perda com alto estresse (>7)
print("\n🔎 Eventos de 'perda' com estresse > 7:")
for event in events.search((Query().event_type == "perda") & (Query().stress_level > 7)):
    print(event)