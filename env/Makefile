.PHONY: setup provisioning

setup:
	sudo apt-get install -y python-dev
	sudo apt-get install -y python-pip
	sudo pip install ansible

provisioning:
	ansible-playbook -i hosts isucon.yml
