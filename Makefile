.PHONY: deploy clean logs

deploy:
	ansible-playbook -i inventory.yaml site.yaml --skip-tags "down,logs" --ask-become-pass

clean:
	ansible-playbook -i inventory.yaml site.yaml --tags down --ask-become-pass

logs:
	ansible-playbook -i inventory.yaml site.yaml --tags logs --ask-become-pass

