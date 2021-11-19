prefix = @prefix@
exec_prefix = @exec_prefix@
bindir = @bindir@

hello: hello.c
	$(CC) -Wall -O3 -o hello hello.c

clean:
	rm -f hello

install: hello
	install -d $(bindir)
	install -t $(bindir) hello
