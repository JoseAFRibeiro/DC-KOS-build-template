SRC = $(wildcard ./src/*.c)
OBJ = $(patsubst ./src/%.c, ./obj/%.o, $(SRC))

INCLUDE = 
OBJ_DIR = 
BIN_DIR = 

all: test.elf

include $(KOS_BASE)/Makefile.rules

dist:
	$(KOS_STRIP) test.elf

test.elf: $(OBJ)
	$(KOS_CC) $(KOS_CFLAGS) $(KOS_LDFLAGS) -o ./bin/$@ $(KOS_START) $^ -lm $(KOS_LIBS)

./obj/%.o: ./src/%.c
	kos-cc $(CFLAGS) -I/opt/toolchains/dc/kos/include -I/opt/toolchains/dc/kos/kernel/arch/dreamcast/include -c $< -o $@
