DEPLOYMENTS=$(kubectl -nrunners get deploy --no-headers -o custom-columns=":metadata.name")

for DEPLOYMENT in $DEPLOYMENTS; do

	echo "Patching ${DEPLOYMENT}.."

	kubectl -n runners set env deployment/${DEPLOYMENT} GITHUB_ACCESS_TOKEN=$1
	kubectl -n runners rollout restart deployment/${DEPLOYMENT}

done
