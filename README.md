# SOC

### Prérequis

- 1 compte Azure avec suffisamment de crédit pour lancer l'environnement.
- 1 autorisation du propriétaire du dépôt pour accéder et récupérer ce dépôt
- Azure CLI installé en local avec une authentification paramétré.
- Terraform installé en local.
- Ansible installé en local.
- Ce dépôt cloné sur votre machine.

##### Installer Azure CLI

https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli

##### Installer Terraform

https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

##### Cloner le dépôt

cd /chemin/vers/mon/dossier/dépôt.git
git clone https://github.com/Gst3r/SOC.git

### Intégration du SOC

##### Déploiement de l'infrastructure avec Terraform

##### Configuration de l'infrastructure avec Ansible

##### Importation des automatisations pour le SOAR

##### 

### POC d'utilisation du SOC

##### POC des ressources Azures

ping des ip des réseaux
ping des ip des serveurs
connexion SSH aux serveurs (les identifiants sont disponibles dans le fichier d'environnement .env)

##### POC des services SOC

connexion à Kibana
connexion à TheHive
Vérifier que TheHive est connecté à Cortex
Vérifier que TheHive est connexté à MISP
connexion à Cortex
connexion à MISP

check des Dashboards mis en place pour le POC
check de la section Management de Kibana :
    - check nomenclature
    - check des index de la base de donnée Elastic
    - check des datastream Elastic
    - check des component template et custom template
    - check des users, roles et permissions (SAML)
    - check des Ingest pipelines et des Logstash pipelines
check de la section Monitoring de Kibana : 
    - check du bon état des ressources de chaque noeud Elastic
    - check des logs d'erreurs
check du Discover pour la réception des logs
check du Fleet Server :
    - Les agents sont up et en contact avec fleet server
    - Les agents remontent bie la donnée (check des indexs)
    - Les stratégies, intégrations et agents sont cohérents entre eux

check du SOAR :
    - check des workflows patterns
    - check des users, roles et permissions
    - check des running workflows

check de TheHive : 
    - users, roles et permissions (organisations)
    - check des responders/analyzes cortex
    - check des alertes / cases systems
check de Cortex : 
    - check des responders
    - check des analyzers
    - check de l'organisation, users et roles
    
Ce tuto est terminé ! Bonne exploitation !