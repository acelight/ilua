# Makefile for rlcompleter

V=2.0

#~ CFLAGS=-O2 -Wall -I/usr/include/lua5.1/ -fPIC
CFLAGS=-O2 -Wall -I/usr/include/ -fPIC -llua

DYN=readline.so

OBJS=readline.o

$(DYN): $(OBJS)
	$(CC) -shared -o $(DYN) $(OBJS) -lreadline

clean:
	rm -f $(DYN) $(OBJS)
