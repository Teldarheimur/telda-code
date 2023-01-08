.PHONY: all

all: sierpinksi.to q.to
	

sierpinksi.to: sierpinksi.bf bf.tb
	./bf.tb < sierpinksi.bf > sierpinksi.to

q.to: q.bf bf.tb
	./bf.tb < q.bf > q.to

bf.tb: bf.to
	tl -e -o bf.tb bf.to
	tstrip -a bf.tb

bf.to: bf.telda bflib.telda
	tc bf.telda
