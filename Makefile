.PHONY: clean all strip

FLAGS=-e
tlf=tl $(FLAGS)

all: tests/hello.tb tests/hello_direct.tb tests/call_hello.tb tests/catl.tb tests/mem_test.tb tests/copy_test.tb tests/password.tb tests/password_compact.tb tests/intos_test.tb tests/parse_test.tb tests/main_hello.tb
	
strip:
	tstrip -a -- tests/*.tb

lib/%.to: lib/%.telda lib/%/*.telda
	tc $<
	tstrip $@
%.to: %.telda
	tc $^
lib/std.savn: lib/io.to lib/mem.to lib/convert.to lib/strcmp.to lib/rt.to
	tar -o $@ $^

clean:
	rm -v tests/*.to lib/*.to tests/*.tb lib/std.savn

tests/%.tb: lib/std.savn tests/%.to
	$(tlf) -o $@ -l $^

tests/password_compact.tb: lib/std.savn tests/password.to
	$(tlf) -o $@ -A2 -l $^
