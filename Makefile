.PHONY: deploy down clean

deploy:
	ansible-playbook -i inventory.yaml site.yaml --skip-tags "down, clean" --ask-become-pass

down:
	ansible-playbook -i inventory.yaml site.yaml --tags down --ask-become-pass

clean:
	ansible-playbook -i inventory.yaml site.yaml --tags clean --ask-become-pass
