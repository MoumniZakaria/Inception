# Variables
# COMPOSE_FILE = srcs/docker-compose.yml
# Default target
all:
	@echo "\033[0;34m📁 Creating data directories...\033[0m"
	mkdir -p /data/zmoumni/mariadb
	mkdir -p /data/zmoumni/wordpress
	@echo "\033[0;32m🚀 Building and starting Inception containers...\033[0m"
	cd srcs && docker compose up --build -d

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
	sudo rm -rf /data/zmoumni

# Rebuild: full clean and then launch again
re: fclean all

# Show container status
status:
	@echo "\033[0;36mℹ️  Container status:\033[0m"
	cd srcs && docker compose ps

# Show logs
logs:
	@echo "\033[0;36m📋 Container logs:\033[0m"
	cd srcs && docker compose logs -f

# Help target
help:
	@echo "\033[0;33m📖 Available targets:\033[0m"
	@echo "  all    - Create directories and start containers"
	@echo "  down   - Stop containers"
	@echo "  clean  - Stop containers and remove volumes/images"
	@echo "  fclean - Full clean including data directories"
	@echo "  re     - Rebuild everything (fclean + all)"
	@echo "  status - Show container status"
	@echo "  logs   - Show container logs"
	@echo "  help   - Show this help"

# Declare phony targets
.PHONY: all down clean fclean re status logs help