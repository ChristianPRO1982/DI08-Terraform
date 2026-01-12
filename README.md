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

### Terraform = 4 briques, pas plus

> Tout le cours tourne autour de ça (cf. pages 18–19, 29–31)[https://github.com/ChristianPRO1982/DI08-Terraform/blob/main/Intro%20Terraform.pdf]

1. Provider

→ “À qui je parle ?” (local, Azure, AWS…)

2. Resource

→ “Qu’est-ce que je veux ?” (fichier, VM, réseau…)

3. State

→ “Qu’est-ce qui existe vraiment ?”

4. Plan / Apply

→ “Qu’est-ce qui va changer ?” puis “On exécute”