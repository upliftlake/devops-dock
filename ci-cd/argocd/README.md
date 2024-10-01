# Send Notifications from ArgoCD to Teams


## Description
The idea is to send notification from ArgoCD to a Microsoft Teams Channel whenever there is an Event

## Steps for MS Teams
1. Go to MS Teams
2. Create a Team > Channel (eg: ArgoDeployChannel) > Make sure to make the channel "Public", Select "Channel Moderation: OFF" & Select "Everyone can start a new post"
3. Go to Apps > Incoming Webhook > Give a Name (eg: ArgoDeployWebhook) > Give a nice image :grin: > Create and Copy the Webhook URL

## Steps for ArgoCD
1. Get the manifests for argo-notification-controller: https://github.com/argoproj-labs/argocd-notifications/blob/master/manifests/install.yaml
2. Edit the configmap and secret in the install.yaml (refer to the cm and secret files in the directory)
3. Make sure the version is "image: argoprojlabs/argocd-notifications:v1.2.1" as older versions will not work
4. Apply the install file, `kubectl apply -n argocd -f install.yaml`
5. Edit the argo application file by adding the metadata.annotations (refer to the application app.yaml file)

## Refer to these docs for further references
1. https://argo-cd.readthedocs.io/en/stable/operator-manual/notifications/services/teams/ note: the notification will not work without using templates and triggers
2. https://github.com/argoproj/argo-cd/blob/master/notifications_catalog/install.yaml
