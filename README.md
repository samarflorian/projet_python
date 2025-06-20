# 📊 Analyse des ventes – Projet Data Analyst Junior

Ce projet a pour but de démontrer mes compétences en analyse de données à travers l'exploration et la visualisation d’un jeu de données de ventes. Il s'agit d'un projet complet intégrant le nettoyage, l’enrichissement, l’analyse et l’interprétation des données.

---

## 🧰 Technologies utilisées

- Python 3.12.2
- Pandas  
- Matplotlib  
- Seaborn  
- VS Code  

---

## 📁 Fichier utilisé

**sales_data.csv**  
> Un jeu de données fictif contenant des erreurs réalistes (valeurs manquantes, formats invalides, doublons, etc.), représentant des transactions commerciales :

- `TransactionID`  
- `ProductID`  
- `Category`  
- `Price`  
- `Quantity`  
- `Date`  
- `Region`

---

## 🧼 Étapes du projet

### 1. **Chargement et nettoyage des données**
- Lecture du fichier CSV
- Suppression des doublons
- Suppression des lignes avec valeurs manquantes
- Correction du format des dates (`pd.to_datetime`)
- Suppression des valeurs négatives dans `Price` et `Quantity`

### 2. **Enrichissement des données**
- Création d’une colonne **Chiffre d’affaires** = `Price * Quantity`
- Extraction du **mois** à partir de la date

### 3. **Analyses réalisées**
- 🔝 Produits les plus vendus (en volume)
- 🌍 Régions les plus performantes (chiffre d'affaires)
- 🏷️ Répartition des ventes par **catégorie**
- 📅 Évolution des ventes **par mois**

### 4. **Visualisations**
- Graphique à barres des ventes par région
- Diagramme circulaire des ventes par catégorie
- Boxplot des ventes par région
- Ligne des ventes mensuelles

---

## 📈 Exemples de résultats

- Le produit `PXXX` est le plus vendu avec XXXX unités écoulées.
- La région `Nord` génère le plus de chiffre d'affaires.
- Les ventes sont les plus fortes entre `juin` et `août`.
- La catégorie `Électronique` représente XX % du CA total.

*(Ces chiffres seront visibles dans les sorties du code ou dans le notebook)*

---

## 📎 Fichiers du projet

| Nom du fichier | Description |
|----------------|-------------|
| `analyse_ventes.py` | Script Python complet avec traitement et visualisations |
| `sales_data_with_specific_errors.csv` | Jeu de données original |
| `sales_data_cleaned.csv` *(optionnel)* | Jeu de données nettoyé |
| `images/` *(optionnel)* | Dossier contenant les graphiques sauvegardés |
| `README.md` | Description du projet |

---

## 🧠 Objectifs pédagogiques

- Démontrer mes compétences de **Data Analyst Junior**
- Illustrer ma capacité à **nettoyer, explorer et visualiser des données**
- Présenter un projet clair, commenté et réutilisable

---

## ✅ Résultat attendu

Un recruteur ou manager peut :
- Lire ce script/notebook
- Comprendre les étapes de nettoyage
- Visualiser les KPIs extraits
- Évaluer mes capacités à structurer une analyse de bout en bout

---

## 🧵 Auteur

**Florian Samar**  
*Passionné par l'analyse de données et les visualisations claires. Ce projet représente un exemple concret de mon savoir-faire pour un poste de Data Analyst Junior.*

---

