BASE = .

ISTANBUL = ./node_modules/.bin/istanbul
TEST_COMMAND = NODE_ENV=test ./node_modules/.bin/mocha
COVERAGE_OPTS = --lines 95 --statements 90 --branches 80 --functions 90

main: lint test

cover:
	$(ISTANBUL) cover test/run.js

check-coverage:
	$(ISTANBUL) check-coverage $(COVERAGE_OPTS)

#test: cover check-coverage

test:
	test/run.js

test-cov: cover check-coverage
	open coverage/lcov-report/index.html

test-integration:
	test/run.js -T integration 

test-acceptance:
	test/run.js -T acceptance

lint:
	./node_modules/.bin/jshint ./lib --config $(BASE)/.jshintrc && \
	./node_modules/.bin/jshint ./test --config $(BASE)/.jshintrc


.PHONY: test
