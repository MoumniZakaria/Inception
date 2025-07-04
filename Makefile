all:
	@echo "\033[0;32m🚀 Building and starting Inception containers...\033[0m"
	cd srcs && docker compose up --build

# Stop and remove all containers, volumes, and images
down:
	@echo "\033[0;31m🧹 Stopping and removing everything...\033[0m"
	cd srcs && docker compose down --rmi all --volumes

# Rebuild: full clean and then launch again
re: down all

# Optional: show container status
status:
	cd srcs && docker compose ps