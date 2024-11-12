#!/bin/bash 

# KubeSec v2 api 

scan_result=$(curl -sSX POST --data-binary @"insecure-deployment.yaml" https://v2.kubesec.io/scan) scan_message=$(curl -sSX POST --data-binary @"insecure-deployment.yaml" https://v2.kubesec.io/scan | jq .[0 scan_score=$(curl -sSX POST --data-binary @"insecure-deployment.yaml" https://v2.kubesec.io/scan | jq .[0]. 

# Kubesec scan result processing 

echo "Scan Score : $scan_result" 

if [[ "${scan_score}" -ge 5 ]]; then 

	echo "Score is $scan_score" 
	echo "Kubesec Scan $scan_message" 

else 

	echo "Score is $scan_score, which is less than or equal to 5." 
	echo "Scanning Kubernetes Resource has Failed" 
	exit 1; 

fi; 