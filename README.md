# ML_FlaskAPI_Docker

Le projet consist a creer un modele ML de classification, le deployer ( Flask ), et le dockeriser.

## prérequis

Lors du lencement du projet, les librairies necessaires seront automatiqument installées grace au ficher "API/requirements.txt"


## Structure du projet

- Dossier SQL : contient la reponse sur la partie SQL en fichier .sql, fait en SQLite
- Dossier ML : 
  - EDA.ipynb : le notebook d'analyse du dataset, 
  - Model.ipynb : le fichier regroubant different algorithmes de classification entrainés sur le dataset. L'algorithme choisi pour l'API est celui qui a la meilleure accuracy.
  - model.joblib : le resultat de notre algorithme.
- Dossier API : 
  - app.py : l'API en Flask
  - Dockerfile et docker-commpose.yml : les fichiers Docker
  - requirements.txt : les librairies necessaires pour la mise en place du projet
  - Dossier utils : qui contient un fichier où on a fait appel à notre fichier .joblib pour pouvoir predire
  - Dossier templates : un fichier index.html pour communiquer avec l'API d'une maniere plus simple et plus jolie, que envoyer des request par lien, les deux façons étaient traitées dans ce projet
  - Dossier static : contier le fichier css et une image pour la page home

## Lancement du projet

Dans le dossier API, executer le ficher yml en utilisant la commande :
```
docker-compose up
```
Cela lancera l'API que vous pouvez acceder sur votre navigateur en utilisant le port 5000

Premier façon d'utiliser l'api est en envoyant les arguments dans la barre de recherche.
Exemple : http://localhost:5000/predict?height=10&width=10&depth=10&weight=10
la réponse du request sera affichée en format JSON : { "activity": "deco" }

Deuxieme façon est d'utiliser le formulaire dans page home (http://localhost:5000) créé en HTML et CSS
La reponse s'affichera en bas du formulaire

![Capture d’écran du 2021-05-04 13-44-49](https://user-images.githubusercontent.com/47146111/116999268-ad4b2680-acdf-11eb-8395-f3ed2b8b97de.png)

