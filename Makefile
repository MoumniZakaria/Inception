# Variables
# COMPOSE_FILE = srcs/docker-compose.yml
# Default target
all:
	@echo "\033[0;34m📁 Creating data directories...\033[0m"
	mkdir -p /home/zmoumni/data/mariadb
	mkdir -p /home/zmoumni/data/wordpress
	@echo "\033[0;32m🚀 Building and starting Inception containers...\033[0m"
	cd srcs && docker compose up --build

# Stop and remove all containers, volumes, and images
down:
	@echo "\033[0;31m🛑 Stopping containers...\033[0m"
	cd srcs && docker compose down

# Clean everything including volumes and images
clean: down
	@echo "\033[0;31m🧹 Cleaning containers, volumes, and images...\033[0m"
	cd srcs && docker compose down --rmi all --volumes

# Full clean including data directories
fclean: clean
	@echo "\033[0;31m🗑️  Removing data directories...\033[0m"
	sudo rm -rf /home/zmoumni/data/

# Rebuild: full clean and then launch again
re: fclean all

# Show container status
status:
	@echo "\033[0;36mℹ️  Container status:\033[0m"
	cd srcs && docker compose ps

# Declare phony targets
.PHONY: all down clean fclean re status logs help