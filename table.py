import sqlite3
import pandas as pd

# Tengjast SQLite gagnagrunninum
conn = sqlite3.connect('timataka.db')

# Lesa gögnin úr töflunni 'hlaup'
df_hlaup = pd.read_sql_query("SELECT * FROM hlaup", conn)
print(df_hlaup)

# Lesa gögnin úr töflunni 'hlauparar'
df_hlauparar = pd.read_sql_query("SELECT * FROM timataka", conn)
print(df_hlauparar)

# Loka tengingunni
conn.close()