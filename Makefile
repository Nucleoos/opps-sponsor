.PHONY: test
test: pep8
	python runtests.py

.PHONY: travis
travis:
	pip install -r requirements_test.txt --use-mirrors
	export OPPS_TRAVIS=True
	python setup.py develop

.PHONY: install
install:
	pip install -r requirements_test.txt --use-mirrors

.PHONY: pep8
pep8:
	@flake8 . --ignore=E501,F403,E126,E127,E128,E303 --exclude=migrations

.PHONY: sdist
sdist: test
	@python setup.py sdist upload

.PHONY: clean
clean:
	@find ./ -name '*.pyc' -exec rm -f {} \;
	@find ./ -name 'Thumbs.db' -exec rm -f {} \;
	@find ./ -name '*~' -exec rm -f {} \;

.PHONY: makemessages
makemessages:
	echo "making messages";\
	cd opps/sponsor;\
	django-admin.py makemessages -l en_US;\
	cd ../../;\

.PHONY: compilemessages
compilemessages:
	echo "compiling messages";\
	cd opps/sponsor;\
	django-admin.py compilemessages;\
	cd ../../;\

.PHONY: tx
tx:
	mkdir -p opps/sponsor/locale/en_US/LC_MESSAGES
	touch opps/sponsor/locale/en_US/LC_MESSAGES/django.po
	tx set --auto-remote https://www.transifex.com/projects/p/opps/resource/sponsor/
	tx set --auto-local -r opps.sponsor "opps/sponsor/locale/<lang>/LC_MESSAGES/django.po" --source-language=en_US --source-file "opps/sponsor/locale/en_US/LC_MESSAGES/django.po" --execute
	tx pull -f
