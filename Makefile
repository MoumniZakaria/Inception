# makefile

# Makefile for building the project
# Define the compiler
CC = gcc
# Define the source files
SRC = main.c utils.c
# Define the object files
OBJ = $(SRC:.c=.o)
# Define the executable name
TARGET = my_program
# Define the compiler flags
CFLAGS = -Wall -Wextra -O2
# Define the linker flags
LDFLAGS = -lm
# Define the build directory
BUILD_DIR = build
# Define the source directory
SRC_DIR = src
# Define the include directory
INCLUDE_DIR = include
# Define the clean command
CLEAN = rm -f $(OBJ) $(TARGET)
# Define the build command
all: $(BUILD_DIR)/$(TARGET)


$(BUILD_DIR)/$(TARGET): $(OBJ)
	@mkdir -p $(BUILD_DIR)
	$(CC) $(OBJ) -o $@ $(LDFLAGS)
$(OBJ): $(SRC)
$(SRC_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -I$(INCLUDE_DIR) -c $< -o $@
clean:
	$(CLEAN)
.PHONY: all clean