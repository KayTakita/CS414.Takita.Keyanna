## 6) Required Comparison
	## 1) Which operations in your C++ program side effects?
Operations that was giving: set(), remove(), save(), and load(). The set and remove changed what was already existing in our function. Save and load was put into a different file. However I don’t think this would be consider a side effect.

	## 2) Which operations in you OCaml program have side effects?
When using the set and remove for the storage, the original file was saved while storing new information.

	## 3) Which OCaml function could reasonably be considered pure? 
An OCaml function that doesn’t change the original store would be set and delete.

	## 4) Where does mutable state exist in the c++ implementation?
It would be inside the store function. 

	## 5) Where does mutable state exist in the OCaml implementation?
	… n/A Note to self redo code… again

	## 6) How does RAII help control or isolate side effects in C++?
It keeps the files and saves when not deleted or commit() is not used

	## 7) How does immutability help control side effects in OCaml?
In OCaml, it help keep the original file while a new one is being written. 

	## 8) How doe rollback work differently in the two implementation?
From OCaml the original version was always saved and used when rollback was called. Unlike C++ where the original would only be used when the new one was deleted

	## 9) Why can the OCaml implementation retain an earlier state without explicitly copying the entire map?
Google -> its is implemented as an immutable. So creating a new file will not hurt the old one. When needed you can call it back.

	## 10) Which programming model made transaction rollback easier to express? (None)
If we do a pros and cons. Pros would be C++ all the way around. On a bias standpoint, I used the language longer than OCaml, naturally it would be my favorite. The con is that you have to become aware of what you are putting in you code send what you are overwriting and deleting, and where it is placed in the code. (Trial and error but more of error.) However OCaml would have to take the lead for this one. With it saving the original file and when making a new file it would use the old file to fill in the blanks without overwriting it.

## Overall

Both implementations accomplish the same goal, but they handle state differently. The C++ version changes the Store object directly, which means the program needs a way to protect the previous state during a transaction. The Transaction class handles this by creating a backup and using its destructor to perform rollback when commit() is not called. This demonstrates how RAII can manage more than memory or files; it can also manage program state.

The OCaml version approaches the same problem differently because its map is immutable. Instead of changing one Store object, each Set or Delete operation produces another store value. This means the previous state remains available naturally. The project helped demonstrate why functional programming often separates data transformations from operations that have side effects, such as console input, console output, SAVE, and LOAD.

Both approaches can implement transactions successfully, but they reach the result using different programming models.
