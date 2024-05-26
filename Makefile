build-no-cache:
	@if [ ! -f .env ]; then \
		echo  "\033[31mOops! \033[91mLooks like the \033[93m.env \033[91mfile is missing. 😱\n\033[96mPlease ensure the \033[93m.env \033[96mfile exists before running this command.\033[0m"; \
		exit 1; \
	fi; \
	docker-compose --profile l2_execution_engine build --no-cache

up:
	@if [ ! -f .env ]; then \
		echo "\033[31mOops! \033[91mLooks like the \033[93m.env \033[91mfile is missing. 😱\n\033[96mPlease ensure the \033[93m.env \033[96mfile exists before running this command.\033[0m"; \
		exit 1; \
	fi; \
	docker-compose --profile l2_execution_engine up  -d
down:
	@echo "\033[96mShutting down services from default docker-compose file...\033[0m"
	@docker-compose down --remove-orphans


