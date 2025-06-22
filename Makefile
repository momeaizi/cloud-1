.PHONY: deploy down clean

deploy:
	ansible-playbook site.yaml --skip-tags "down, clean"

down:
	ansible-playbook site.yaml --tags down

clean:
	ansible-playbook site.yaml --tags clean
