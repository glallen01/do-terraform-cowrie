
apply:
	terraform apply \
	  -var do_token=${DIGITALOCEAN_TOKEN} \
	  -var "pub_key=${HOME}/.ssh/id_ed25519.pub" \
	  -var "pvt_key=${HOME}/.ssh/id_ed25519"
