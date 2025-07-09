.DEFAULT_GOAL := serve

ifeq ($(OS),Windows_NT)
  NULLDEV := NUL
else
  NULLDEV := /dev/null
endif

.PHONY: install serve

# Проверяем и ставим Bundler + гемы
install:
	@echo Checking Bundler...  
	@bundle -v >$(NULLDEV) 2>&1 || gem install bundler  
	@echo Checking gems...  
	@bundle check >$(NULLDEV) 2>&1 || bundle install  

# Запускаем Jekyll с livereload и incremental
serve: install
	@echo Starting Jekyll… (Ctrl-C to stop)  
	bundle exec jekyll serve --livereload --incremental
