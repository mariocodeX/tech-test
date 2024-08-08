import pandas as pd

# ---------------- combine data ------------

# Membaca file .csv ke dalam DataFrame
df1 = pd.read_csv('branch_a.csv')
df2 = pd.read_csv('branch_b.csv')
df3 = pd.read_csv('branch_c.csv')

# Menggabungkan DataFrame
df_combined = pd.concat([df1, df2, df3], ignore_index=True)

# 1. membersihkan baris data yang memiliki value NaN
df_cleaned = df_combined.dropna(subset=['transaction_id', 'date', 'customer_id'])

# 2. Ubah date menjadi datetime
df_new = df_cleaned.copy()
#print("Ini date")
#print(df_new['date'])

df_new['date'] = pd.to_datetime(df_new['date'])
#print("Ini datetime")
#print(df_new['date'].dtype)

# 3. Hilangkan data duplikat berdasarkan transaction_id
#    pilih data berdasarkan date terbaru
df = df_new.sort_values('date').drop_duplicates('transaction_id', keep='last')

# 4. Hitung total penjualan per branch
total_sales = df.groupby('branch')['price'].sum().reset_index()
total_sales.columns = ['branch', 'total']

# Simpan ke total_sales_per_branch.csv
total_sales.to_csv('total_sales_per_branch.csv', index=False)

print("Data berhasil diolah")
print("Data disimpan pada file total_sales_per_branch.csv")
