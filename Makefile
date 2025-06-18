# Makefile
all: setup hooks

# requires `nvm use --lts` or `nvm use node`
.PHONY: setup
setup: 
	npm install -g @commitlint/config-conventional @commitlint/cli
	brew install hadolint
	brew install shellcheck


.PHONY: hooks
hooks:
	@git config --local core.hooksPath .githooks/

.PHONY: start-and-enter
start-and-enter:
	BUILDKIT_PROGRESS=plain docker compose build --no-cache
	docker compose up -d
	docker compose exec konnect zsh