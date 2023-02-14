DEPLOYMENTS=$(kubectl -nrunners get deploy --no-headers -o custom-columns=":metadata.name")

for DEPLOYMENT in $DEPLOYMENTS; do

	echo "Restarting ${DEPLOYMENT}.."

	kubectl -n runners rollout restart deployment/${DEPLOYMENT}

done
