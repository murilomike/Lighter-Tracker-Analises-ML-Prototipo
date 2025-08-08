import pandas as pd
from sqlalchemy import create_engine
from tinydb import TinyDB

# dados reais do banco
usuario = "dbname_53y7_user"
senha = "4e7M2DQWoSBdkDdefbuQztM5gwsxIKOh"
host = "dpg-d26jok6r433s73emtpdg-a"
porta = "5432"
nome_db = "banco-postgres-lightertracker"


# 2. Conecta ao PostgreSQL
url = "postgresql://dbname_53y7_user:4e7M2DQWoSBdkDdefbuQztM5gwsxIKOh@dpg-d26jok6r433s73emtpdg-a:5432/banco-postgres-lightertracker"
engine = create_engine(url)


# 1. Conecta ao TinyDB
db = TinyDB('db.json')
users = db.table('users')
lighters = db.table('lighters')
events = db.table('events')


# 3. Processa e transfere a coleção 'users'
df_users = pd.DataFrame(users.all())
# Converte 'created_at' para datetime
if 'created_at' in df_users.columns:
    df_users['created_at'] = pd.to_datetime(df_users['created_at'])
# 'preferences' será salvo como JSONB no PostgreSQL
df_users.to_sql('users_lightertracker', engine, if_exists='replace', index=False)
print("✅ Coleção 'users' transferida para PostgreSQL (tabela: users_lightertracker)")


# 4. Processa e transfere a coleção 'lighters'
df_lighters = pd.DataFrame(lighters.all())
# Converte 'acquisition_date' para datetime
if 'acquisition_date' in df_lighters.columns:
    df_lighters['acquisition_date'] = pd.to_datetime(df_lighters['acquisition_date'])
df_lighters.to_sql('lighters_lightertracker', engine, if_exists='replace', index=False)
print("✅ Coleção 'lighters' transferida para PostgreSQL (tabela: lighters_lightertracker)")


# 5. Processa e transfere a coleção 'events'
df_events = pd.DataFrame(events.all())
# Converte 'timestamp' para datetime
if 'timestamp' in df_events.columns:
    df_events['timestamp'] = pd.to_datetime(df_events['timestamp'])
# Divide 'geolocation' em 'lat' e 'lon'
if 'geolocation' in df_events.columns:
    df_events['lat'] = df_events['geolocation'].apply(lambda x: x['lat'] if x else None)
    df_events['lon'] = df_events['geolocation'].apply(lambda x: x['lon'] if x else None)
    df_events.drop(columns=['geolocation'], inplace=True)
df_events.to_sql('events_lightertracker', engine, if_exists='replace', index=False)
print("✅ Coleção 'events' transferida para PostgreSQL (tabela: events_lightertracker)")

print("✅ Transferência completa!")