.PHONY: deploy down clean

deploy:
	ansible-playbook -i inventory.yaml site.yaml --skip-tags "down, clean" --vault-password-file vault-pass.txt

down:
	ansible-playbook -i inventory.yaml site.yaml --tags down

clean:
	ansible-playbook -i inventory.yaml site.yaml --tags clean
