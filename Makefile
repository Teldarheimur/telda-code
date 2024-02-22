.PHONY: clean all

FLAGS=-e
tlf=tl $(FLAGS)

all: tests/hello.tb tests/hello_direct.tb tests/call_hello.tb tests/catl.tb tests/mem_test.tb tests/copy_test.tb tests/password.tb tests/password_compact.tb tests/intos_test.tb tests/parse_test.tb tests/main_hello.tb
	

lib/std.to: lib/io.to lib/mem.to lib/rt.to lib/convert.to lib/strcmp.to
	tl -o $@ $^

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

tests/copy_test.tb: lib/io.to lib/mem.to tests/copy_test.to
	$(tlf) -o $@ $^

tests/password.tb: lib/io.to lib/strcmp.to tests/password.to
	$(tlf) -o $@ $^

tests/password_compact.tb: lib/io.to lib/strcmp.to tests/password.to
	$(tlf) -o $@ -A2 $^

tests/intos_test.tb: lib/convert.to lib/io.to tests/intos_test.to
	$(tlf) -o $@ $^

tests/parse_test.tb: lib/convert.to lib/io.to tests/parse_test.to
	$(tlf) -o $@ $^

tests/main_hello.tb: lib/std.to tests/main_hello.to
	$(tlf) -o $@ $^
