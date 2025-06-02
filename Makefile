.PHONY: clean all strip

FLAGS=-e
tlf=tl $(FLAGS)

all: tests/hello.tb tests/carry_test.tb tests/hello_direct.tb tests/call_hello.tb tests/catl.tb tests/mem_test.tb tests/copy_test.tb tests/password.tb tests/password_compact.tb tests/intos_test.tb tests/parse_test.tb tests/edd_test.tb tests/main_hello.tb tests/busy.tb
	
strip:
	tstrip -a -- tests/*.tb

lib/%.to: lib/%.telda $(wildcard lib/%/*.telda)
	tasm $<
	tstrip $@
%.to: %.telda
	tasm $^
lib/std.savn: lib/io.to lib/mem.to lib/convert.to lib/convert32.to lib/strcmp.to lib/edd_interface.to lib/rt.to
	tar -o $@ $^

clean:
	rm -v tests/*.to lib/*.to tests/*.tb lib/std.savn

tests/%.tb: lib/std.savn tests/%.to
	$(tlf) -o $@ -l $^

tests/password_compact.tb: lib/std.savn tests/password.to
	$(tlf) -o $@ -A2 -l $^
