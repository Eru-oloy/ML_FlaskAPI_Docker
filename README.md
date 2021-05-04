# ML_FlaskAPI_Docker

Le projet consiste à créer un modèle ML de classification, le déployer ( Flask ), et le dockeriser.

## prérequis

Lors du lancement du projet, les librairies nécessaires seront automatiquement installées grâce au fichier "API/requirements.txt"


## Structure du projet

- Dossier SQL : contient la réponse sur la partie SQL en fichier .sql, fait en SQLite
- Dossier ML : 
  - EDA.ipynb : le notebook d'analyse du dataset, 
  - Model.ipynb : le fichier regroupant différents algorithmes de classification entrainés sur le dataset. L'algorithme choisi pour l'API est celui qui a la meilleure accuracy.
  - model.joblib : le résultat de notre algorithme.
- Dossier API : 
  - app.py : l'API en Flask
  - Dockerfile et docker-commpose.yml : les fichiers Docker
  - requirements.txt : les librairies nécessaires pour la mise en place du projet
  - Dossier utils : qui contient un fichier où on a fait appel à notre fichier .joblib pour pouvoir prédire
  - Dossier templates : un fichier index.html pour communiquer avec l'API d'une manière plus simple et plus jolie, que envoyer des request par lien, les deux façons étaient traitées dans ce projet
  - Dossier static : contient le fichier css et une image pour la page home

## Lancement du projet

Dans le dossier API, exécuter le fichier yml en utilisant la commande :
```
docker-compose up
```
Cela lancera l'API que vous pouvez accéder sur votre navigateur en utilisant le port 5000

La première façon d'utiliser l'api est d'envoyer les arguments dans la barre de recherche.
Exemple : http://localhost:5000/predict?height=10&width=10&depth=10&weight=10
la réponse du request sera affichée en format JSON : { "activity": "deco" }

Deuxième façon est d'utiliser le formulaire dans page home (http://localhost:5000) créé en HTML et CSS
La réponse s'affiche en bas du formulaire
