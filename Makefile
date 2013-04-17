
clean:
	rm -f \#*\#
	rm -f ./*.pyc
	rm -f ./*.pyo

cleantest: clean
	mkdir -p gnupg/tests/tmp_test
	touch gnupg/tests/placeholder.log
	rm -rf gnupg/tests/tmp_test
	rm gnupg/tests/*.log

test: cleantest
	python gnupg/tests/test_gnupg.py parsers basic genkey sign listkeys

install: 
	python setup.py install --record installed-files.txt

uninstall:
	touch installed-files.txt
	cat installed-files.txt | sudo xargs rm -rf

cleandocs:
	sphinx-apidoc -F -A "Isis Agora Lovecruft" -H "python-gnupg" -V 0.4.0 -R 0.4.0 -o docs gnupg/ tests/

docs:
	cd docs
	make clean
	make html

venv:
	-source /usr/shared/python/ns/virtualenvwrapper.sh && mkvirtualenv -a "$PWD" --no-site-packages --unzip-setuptools --distribute python-gnupg
