	# Transactional Key-Value Store

   This project implements a transactional key-value store in both C++ and OCaml.

   The C++ implementation uses mutable state and RAII to manage transactions. 
The OCaml implementation uses an immutable map, where operations create a 
new store instead of changing the original store.

	# Project Structure

   - `cpp/` - C++ implementation
   - `ocaml/` - OCaml implementation

	# C++ Build Instructions

   From the `cpp` directory:

   bash
   mkdir -p build
   cd build
   cmake ..
   cmake --build .
