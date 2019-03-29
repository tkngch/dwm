# dwm - dynamic window manager
# See LICENSE file for copyright and license details.

include config.mk

SRC = drw.c dwm.c util.c
OBJ = ${SRC:.c=.o}

all: ${HOME}/bin/dwm

man:
	groff -m man -T ascii dwm.1

options:
	@echo dwm build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"

.c.o:
	${CC} -c ${CFLAGS} $<

${OBJ}: config.h config.mk

dwm: ${OBJ}
	${CC} -o $@ ${OBJ} ${LDFLAGS}

${HOME}/bin/dwm: dwm
	rm -f $@
	ln -s ${CURDIR}/$(@F) $@

clean:
	rm -f dwm ${OBJ} dwm-${VERSION}.tar.gz


.PHONY: all options clean
