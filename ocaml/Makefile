# ----- OCaml Transactional Key Value Store -----

.DEFAULT_GOAL := all

OCAMLC = ocamlc

# ----- Main -----
store: store.ml main.ml
	$(OCAMLC) store.ml main.ml -o store

# ----- Tests -----
test_store: store.ml test_store.ml
	$(OCAMLC) store.ml test_store.ml -o test_store

# ----- Everything -----
all: store test_store

# ----- Compiled Files -----
clean:
	rm -f *.cmi *.cmo store test_store
