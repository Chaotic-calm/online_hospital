# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++11 -Wall

# Directories
SRC_DIR = ./src
INCLUDE_DIR = ./include
BUILD_DIR = ./build

# Source files
SRCS = main.cpp \
       $(SRC_DIR)/global.cpp \
       $(SRC_DIR)/hospital.cpp \
       $(SRC_DIR)/address.cpp \
       $(SRC_DIR)/person.cpp \
       $(SRC_DIR)/doctor.cpp \
       $(SRC_DIR)/patient.cpp \
       $(SRC_DIR)/appointment.cpp \
       $(SRC_DIR)/nurse.cpp \
       $(SRC_DIR)/driver.cpp \
       $(SRC_DIR)/ambulance.cpp

# Object files
OBJS = $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SRCS))

# Executable
EXE = $(BUILD_DIR)/hms

# Targets
all: $(EXE)

run: $(EXE)
	./$(EXE)

clean:
	rm -rf $(BUILD_DIR)

# Compile source files
$(EXE): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Rule for creating object files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -I$(INCLUDE_DIR) -c -o $@ $<

$(BUILD_DIR):
	mkdir -p $@
