Si tu as une erreur sur le SKU F1

Ça arrive souvent sur certains abonnements/ régions.

Dans ce cas, tu changes dans brief/terraform.tfvars :

webapp_sku_name = "B1"


Puis :

terraform plan
terraform apply





Pourquoi une Web App Azure a besoin d’un Service Plan
Version très simple (à retenir)

👉 La Web App, c’est ton application.
👉 Le Service Plan, c’est la machine qui la fait tourner.

Azure sépare volontairement les deux.

Ce que fait chaque brique
🧱 Service Plan

Le Service Plan définit :

la puissance (CPU / RAM)

le prix

le système (Linux / Windows)

le scaling (combien d’apps dessus)

👉 C’est l’infrastructure d’exécution.

🌐 Web App

La Web App :

contient le code (ou pas encore, dans ton cas)

expose une URL

utilise un Service Plan existant

👉 Elle ne possède pas de ressources matérielles propres.

Analogie très parlante

Service Plan = serveur

Web App = process / application

Tu peux :

faire tourner plusieurs Web Apps sur un même Service Plan

mais une Web App ne peut pas exister sans Service Plan

Pourquoi Azure a fait ce choix

Pour permettre :

la mutualisation (plusieurs apps, un seul plan)

la maîtrise des coûts

le scaling indépendant

👉 Et aussi pour éviter que chaque app crée “sa VM cachée”.

Phrase parfaite pour ton README

Tu peux écrire :

Une Web App Azure nécessite un App Service Plan car celui-ci fournit les ressources d’exécution (CPU, mémoire, OS). La Web App ne fait que consommer ces ressources.

C’est exactement ce que le correcteur attend.