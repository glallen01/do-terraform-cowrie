
apply:
	terraform apply \
	  -var do_token=${DIGITALOCEAN_TOKEN} \
	  -var "pub_key=${HOME}/.ssh/id_ed25519.pub" \
	  -var "pvt_key=${HOME}/.ssh/id_ed25519" \
	  -var "ssh_fingerprint=97:90:17:65:74:3f:a5:2a:23:15:1d:2e:6a:55:51:4c"
