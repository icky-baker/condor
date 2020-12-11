# Originally wrote by @JrooTJunior in
# https://github.com/aiogram/aiogram/blob/dev-3.x/Makefile

.DEFAULT_GOAL := help

base_python := python3
python := python
project_source_dir := condor

reports_dir := reports


# =================================================================================================
# Environment
# =================================================================================================

.PHONY: install
install:
	$(base_python) -m pip install -r requirements.txt

.PHONY: clean
clean:
	rm -rf `find . -name __pycache__`
	rm -f `find . -type f -name '*.py[co]' `
	rm -f `find . -type f -name '*~' `
	rm -f `find . -type f -name '.*~' `
	rm -rf `find . -name .pytest_cache`
	rm -rf *.egg-info
	rm -f .coverage
	rm -f report.html
	rm -f .coverage.*
	rm -rf {build,dist,site,.cache,.mypy_cache,reports}


# =================================================================================================
# Code quality
# =================================================================================================

.PHONY: isort
isort:
	$(py) isort $(project_source_dir)

.PHONY: black
black:
	$(py) black $(project_source_dir)

.PHONY: flake8
flake8:
	$(py) flake8 $(project_source_dir)

.PHONY: flake8-report
flake8-report:
	mkdir -p $(reports_dir)/flake8
	$(py) flake8 --format=html --htmldir=$(reports_dir)/flake8 $(project_source_dir)

.PHONY: lint
lint: isort black flake8

# =================================================================================================
# Tests
# =================================================================================================

.PHONY: test
test:
	$(py) pytest --cov=$(project_source_dir) --cov-config .coveragerc tests/

.PHONY: test-coverage
test-coverage:
	mkdir -p $(reports_dir)/tests/
	$(py) pytest --cov=$(project_source_dir) --cov-config .coveragerc --html=$(reports_dir)/tests/index.html tests/


.PHONY: test-coverage-report
test-coverage-report:
	$(py) coverage html -d $(reports_dir)/coverage

.PHONY: test-coverage-view
test-coverage-view:
	$(py) coverage html -d $(reports_dir)/coverage
	python -c "import webbrowser; webbrowser.open('file://$(shell pwd)/reports/coverage/index.html')"

.PHONY: runserver
run:
	$(python) $(project_source_dir)/manage.py runserver

.PHONY: prodrunserver
prodrunserver:
#check this shit
	$(python) $(project_source_dir)/manage.py runserver 0.0.0.0:80

.PHONY: makemigrations
makemigrations:
	$(python) $(project_source_dir)/manage.py makemigrations

.PHONY: migrate
migrate:
	$(python) $(project_source_dir)/manage.py migrate
