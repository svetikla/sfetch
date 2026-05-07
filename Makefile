SRC = src/fetch.c
CC ?= cc
CFLAGS += -O2 -Wall -Wextra
PREFIX ?= /usr/local

all: sfetch

sfetch: ${SRC} src/config.h
	${CC} ${CFLAGS} ${SRC} -o sfetch

clean:
	rm -rf sfetch sfetch.dSYM

install: sfetch
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp sfetch ${DESTDIR}${PREFIX}/bin

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/sfetch

.PHONY: all clean debug install uninstall
