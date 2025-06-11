import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Chargement du fichier CSV
try:
    df = pd.read_csv("C:/Users/samar/sales_data_with_specific_errors.csv")
except FileNotFoundError:
    print("Le fichier n'a pas été trouvé. Vérifie le chemin du fichier.")
    exit()

# Affichage des premières lignes du fichier
print("Aperçu des données :")
print(df.head())

# Vérification du type des données
print("\nTypes de données :")
print(df.info())

# Vérification des valeurs manquantes
print("\nValeurs manquantes :")
print(df.isnull().sum())

# Vérification de doublons
print("\nNombre de doublons :", df.duplicated().sum())

# Suppression des doublons
df = df.drop_duplicates()

# Suppression des valeurs manquantes
df = df.dropna()
print("\nDonnées après suppression des valeurs manquantes :")
print(df.info())

# Convertir les dates en gérant les erreurs
df['Date'] = pd.to_datetime(df['Date'], errors='coerce')

# Vérifier les dates invalides (NaT)
invalid_dates = df[df['Date'].isna()]
print("\nDates invalides :")
print(invalid_dates)

# Supprimer les lignes avec des dates invalides
df = df.dropna(subset=['Date'])

# Suppression des données avec une quantité négative
df = df[df["Quantity"] >= 0]

# Suppression des données avec un prix négatif
df = df[df["Price"] > 0]
print("\nDonnées après suppression des valeurs négatives :")
print(df.info())

# Création d'une colonne Chiffre d'affaires
df["Chiffre_affaire"] = df["Price"] * df["Quantity"]
print("\nAperçu des données avec chiffre d'affaires :")
print(df.head())

# Analyse pour trouver les produits les plus vendus
df_produits_plus_vendus = df.groupby("ProductID")["Quantity"].sum().sort_values(ascending=False).reset_index()
print("\nTop 10 des produits les plus vendus :")
print(df_produits_plus_vendus.head(10))

# Analyse pour trouver la région qui a la meilleure vente
df_regions_meilleures_ventes = df.groupby("Region")["Chiffre_affaire"].sum().sort_values(ascending=False).reset_index()
print("\nTop 5 des régions avec les meilleures ventes :")
print(df_regions_meilleures_ventes.head(5))

# Analyse pour trouver la distribution des ventes par catégorie
df_vente_par_categorie = df.groupby("Category")["Chiffre_affaire"].sum().sort_values(ascending=False).reset_index()
df_vente_par_categorie["Part (en %)"] = df_vente_par_categorie["Chiffre_affaire"] / df_vente_par_categorie["Chiffre_affaire"].sum() * 100
print("\nDistribution des ventes par catégorie :")
print(df_vente_par_categorie)

# Utiliser une palette de couleurs de Seaborn
palette = sns.color_palette("husl", len(df_regions_meilleures_ventes))

# Graphique à barres des ventes par région
plt.figure(figsize=(8, 6))
plt.bar(x=df_regions_meilleures_ventes["Region"], height=df_regions_meilleures_ventes["Chiffre_affaire"], width=0.5, color=palette)
plt.title("Ventes par région")
plt.xlabel("Région")
plt.ylabel("Ventes")
plt.xticks(rotation=45)
plt.grid(True)
plt.tight_layout()
plt.show()

# Diagramme circulaire des ventes par catégorie
plt.figure(figsize=(8, 6))
plt.pie(df_vente_par_categorie["Chiffre_affaire"], labels=df_vente_par_categorie["Category"], colors=palette, autopct='%1.1f%%')
plt.title("Ventes par Catégorie")
plt.tight_layout()
plt.show()

# Boxplot des ventes par région
sns.boxplot(data=df, x="Region", y="Chiffre_affaire")
plt.title("Boxplot des ventes par région")
plt.show()

# Ajouter une colonne pour le mois en anglais
df["Mois"] = df["Date"].dt.strftime('%B')

# Définir l'ordre des mois en anglais
ordre_mois = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']

# Convertir la colonne "Mois" en type catégoriel avec l'ordre spécifique
df['Mois'] = pd.Categorical(df['Mois'], categories=ordre_mois, ordered=True)

# Calculer les ventes par mois
ventes_par_mois = df.groupby("Mois")["Chiffre_affaire"].sum().reset_index()

# Tracer le graphique des ventes mensuelles
plt.figure(figsize=(8, 6))
plt.plot(ventes_par_mois["Mois"], ventes_par_mois["Chiffre_affaire"], marker='o')
plt.title('Ventes mensuelles')
plt.xlabel('Mois')
plt.ylabel('Ventes totales')
plt.xticks(rotation=45)
plt.grid(True)
plt.tight_layout()
plt.show()
