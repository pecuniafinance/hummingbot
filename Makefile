.ONESHELL:
.PHONY: test
.PHONY: run_coverage
.PHONY: report_coverage
.PHONY: development-diff-cover

test:
	coverage run -m nose test.hummingbot

run_coverage: test
	coverage report
	coverage html

report_coverage:
	coverage report
	coverage html

development-diff-cover:
	coverage xml
	diff-cover --compare-branch=origin/development coverage.xml

start-hummingbot:
	python3 bin/hummingbot.py 

start-gateway:
	cd gateway/ && yarn start

docker-hummingbot:
	docker-compose up