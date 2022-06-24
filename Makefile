PROJECT := $(shell basename $$PWD)

console:
	bundle exec rake console
.PHONY: console

test:
	bundle exec rake
.PHONY: test

gem:
	bundle exec rake build
.PHONY: gem
