.PHONY: clean all

FLAGS=-e _start
tlf=tl $(FLAGS)

all: tests/hello.tb tests/hello_direct.tb tests/call_hello.tb tests/catl.tb tests/mem_test.tb tests/main_hello.tb tests/password.tb tests/intos_test.tb
	

std.to: lib/io.to lib/mem.to lib/rt.to lib/convert.to lib/strcmp.to
	tl -r -o $@ $^

lib/%.to: lib/%.telda lib/%/*.telda
	tc $<
%.to: %.telda
	tc $^

clean:
	rm **/*.to **/*.tb


tests/hello.tb: tests/hello.to
	$(tlf) -o $@ $^

tests/hello_direct.tb: tests/hello_direct.to
	$(tlf) -o $@ $^

tests/call_hello.tb: lib/io.to tests/call_hello.to
	$(tlf) -o $@ $^

tests/catl.tb: lib/io.to tests/catl.to
	$(tlf) -o $@ $^

tests/mem_test.tb: lib/io.to lib/mem.to tests/mem_test.to
	$(tlf) -o $@ $^

tests/main_hello.tb: tests/main_hello.to std.to
	$(tlf) -o $@ $^

tests/password.tb: lib/io.to tests/password.to lib/strcmp.to
	$(tlf) -o $@ $^

tests/intos_test.tb: lib/convert.to lib/io.to tests/intos_test.to
	$(tlf) -o $@ $^
