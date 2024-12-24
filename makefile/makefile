IDIR = ./include
CC = g++ # compiler
CFLAGS = -I$(IDIR) # flags with include directory, no space after -I

SRCDIR = ./src
ODIR = $(SRCDIR)/obj
BUILDDIR = ./build

_DEPS = hellomake.hpp
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

SRC = $(wildcard $(SRCDIR)/*.cpp) # gets all .cpp files in src directory
OBJS = $(patsubst $(SRCDIR)/%.cpp,$(ODIR)/%.o,$(SRC)) # patsubst replaces $(SRCDIR)/%.cpp with $(ODIR)/%.o with all matches in SRC

$(ODIR)/%.o: $(SRCDIR)/%.cpp $(DEPS) # rule to compile .cpp files to .o files
	$(CC) -c -o $@ $< $(CFLAGS)

# $@ is the target of the rule, $^ is all the dependencies, $< is the first dependency

$(BUILDDIR)/hellomake: $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS)

all: # make all, default target
	mkdir -p $(ODIR)
	mkdir -p $(BUILDDIR)
	make $(BUILDDIR)/hellomake

.PHONY: clean cleano  # clean and cleano are not files, making it clear that they are not files

clean:
	rm -rf $(BUILDDIR)/* $(ODIR)/*.o

cleano:
	rm -f $(ODIR)/*.o