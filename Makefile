.PHONY: deploy down clean

deploy:
	ansible-playbook -i inventory.yaml site.yaml --skip-tags "down, clean" --vault-password-file vault-pass.txt

down:
	ansible-playbook -i inventory.yaml site.yaml --tags down --vault-password-file vault-pass.txt

clean:
	ansible-playbook -i inventory.yaml site.yaml --tags clean --vault-password-file vault-pass.txt
