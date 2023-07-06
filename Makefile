# Clean, and create_dirs targets set for windows

CC = emcc
CFLAGS = -Iinclude
SRC = src
OBJ = obj
BINDIR = dist
PROJNAME = WebPlay
BINNAME = $(PROJNAME)
SRCS = $(wildcard $(SRC)/*.c)
OBJS = $(patsubst $(SRC)/%.c, $(OBJ)/%.o, $(SRCS))
BIN = $(BINDIR)/$(BINNAME)

all: create_dirs
all: $(BIN)

release: CFLAGS = -Iinclude -O2
release: new

$(BIN): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@.js

$(OBJ)/%.o: $(SRC)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

%.o: $(SRC)/%.c
	$(CC) $(CFLAGS) -c $< -o $(OBJ)/$@	

link: $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(BIN)

clean:
	rmdir /S /Q $(BINDIR)
	rmdir /S /Q $(OBJ)

create_dirs:
	@if not exist $(BINDIR) mkdir $(BINDIR)
	@if not exist $(OBJ) mkdir $(OBJ)

new: clean
new: all