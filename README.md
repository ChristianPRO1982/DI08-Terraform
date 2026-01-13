# TERRAFORM

Voici mes notes personnelles de la compréhension de l'outil

## objectifs de Terraform
### en clair
Terraform sert à :
* formaliser une stratégie
* l’industrialiser
* la reproduire

Mais :
* la stratégie vient de l’architecte
* le SLA vient du provider
* la fiabilité vient du design

## mémo commandes

### docker

```bash
docker compose up -d
```
```bash
docker compose exec terraform sh
```

### terraform

```bash
cd /workspace/exercice_1
```
```bash
terraform init
```
```bash
terraform plan
```
```bash
terraform apply
```


## cours

### Terraform = 4 briques, pas plus

> Tout le cours tourne autour de ça ([cf. pages 18–19, 29–31](https://github.com/ChristianPRO1982/DI08-Terraform/blob/main/Intro%20Terraform.pdf))

1. Provider

→ “À qui je parle ?” (local, Azure, AWS…)

2. Resource

→ “Qu’est-ce que je veux ?” (fichier, VM, réseau…)

3. State

→ “Qu’est-ce qui existe vraiment ?”

4. Plan / Apply

→ “Qu’est-ce qui va changer ?” puis “On exécute”

### fichier lock (concept)

.terraform.lock.hcl = uv.lock / poetry.lock / package-lock.json

### à quoi sert `terraform init`

* lit required_providers
* résout les versions compatibles
* fige les versions exactes
* écrit .terraform.lock.hcl

Ensuite :
* plus de surprise
* même provider pour tout le monde
* même comportement en CI/CD

### à quoi sert `terraform plan`

* ne modifie rien
* compare :
  * le code .tf
  * le state
  * la réalité (via l’API provider)
* calcule un diff

> 👉 C’est un dry-run sécurisé.

**Analogie :** EXPLAIN (SQL)

Dans la sortie :
```
Plan: 1 to add, 0 to change, 0 to destroy
```

**Règle d’or**

❌ Ne jamais faire apply sans avoir lu le plan.

**En entreprise :**
* le plan est souvent généré en CI
* relu
* puis appliqué manuellement ou automatiquement

### à quoi sert `terraform apply`

> “Exécute exactement ce plan”

terraform apply :
* génère un plan (ou utilise un plan sauvegardé)
* appelle les APIs du provider
* crée / modifie / supprime les ressources
* met à jour le state

> 👉 C’est le point de non-retour.

**Analogie :** COMMIT

### Mémo terminologie

`known after apply` = *“je ne peux pas le savoir tant que ce n’est pas réellement créé”*

### Bonnes pratiques

En général :
* `terraform.tfvars` → local / non versionné
* `*.tfvars.example` → versionné
* variables sensibles → via CI/CD ou vault

1️⃣ Séparer le code et les valeurs
* .tf → logique Terraform
* .tfvars → configuration

2️⃣ Éviter les erreurs humaines

“.tfvars permet de mettre dans un fichier les variables au lieu de les mettre dans une commande lancée à la main.”

3️⃣ Gérer plusieurs environnements

exemple : `prod.tfvars`

### à quoi sert le state (`terraform.tfstate`)

Le state :
* mappe le code Terraform aux ressources réelles
* stocke les IDs et métadonnées de l’infrastructure
* permet à Terraform de calculer les différences

⚠️ Sans state fiable, Terraform est dangereux.

En entreprise :
* le state est stocké à distance (S3, Azure Storage, etc.)
* jamais versionné dans Git

### Mémo CI/CD – Terraform (vision réaliste)

**Terraform et CI/CD**

Terraform **permet** une automatisation complète (init → plan → apply),
mais **n’impose pas** un modèle unique.

Le niveau d’automatisation doit être **proportionnel au risque**.

***Modèles CI/CD possibles avec Terraform***

🔴 **Automatisation complète (plan + apply)**
```
commit / PR → terraform plan → terraform apply
```
Acceptable si :
* environnement isolé (dev / sandbox)
* abonnement dédié
* pas de données critiques
* quotas et budgets maîtrisés
* monitoring et alertes en place
> ⚠️ À éviter en production.

🟡 **Plan automatique, apply avec validation humaine (standard entreprise)**

```
commit / PR → terraform plan
↓
lecture et validation humaine
↓
terraform apply
```
Avantages :
* contrôle des changements
* responsabilité humaine
* auditabilité
* particulièrement important avec du code généré par IA

🟢 **Plan validé / signé (environnements critiques)**

```
terraform plan
↓
approbation (review, signature, RBAC)
↓
terraform apply du plan exact
```
Utilisé pour :
* production
* environnements réglementés
* infrastructures à fort impact

***Impact de l’IA sur Terraform***
> Avec le codage assisté par IA :
> * le plan Terraform devient un artefact de contrôle
> * l’automatisation aveugle augmente le risque
> * la validation humaine reste essentielle hors environnements maîtrisés

***Principe clé***
> **Automatiser autant que possible, mais jamais plus que le niveau de risque acceptable.**