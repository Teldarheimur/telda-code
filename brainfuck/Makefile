.PHONY: all

all: sierpinski.to q.to
	

sierpinski.to: sierpinski.bf bf.tb
	./bf.tb < sierpinski.bf > sierpinski.to

q.to: q.bf bf.tb
	./bf.tb < q.bf > q.to

bf.tb: bf.to
	tl -e -o bf.tb bf.to
	tstrip -a bf.tb

bf.to: bf.telda bflib.telda
	tc bf.telda

