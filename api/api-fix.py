import requests
import pandas as pd

def get_university_data(country):
    #url = f"http://universities.hipolabs.com/search?name=middle&country={country}"
    url = f"http://universities.hipolabs.com/search?country={country}"
    response = requests.get(url)
    data = response.json()
    return data

def create_dataframe(data):
    results=pd.json_normalize(data)
    df = pd.DataFrame(results)
#    df = df[['name', 'web_pages', 'country', 'domains', 'state-province']]
    return df

def filter_data(df):
    df_filtered = df.dropna(subset=['state-province'])
    return df_filtered

# Contoh filter
#country = "Turkey"
#country = "United+States"
country = input("Masukkan nama negara (dalam bhs. Inggris): ")
data = get_university_data(country)
df = create_dataframe(data)
df_filtered = filter_data(df)

print("Data secara keseluruhan:")
print(df)
print("\n")

print("Filter country (soal API no. 2): ")
print(df[['country']])
print("\n")

print("Filter data yang tidak memiliki state-country (soal API no. 3): ")
print(df_filtered)
