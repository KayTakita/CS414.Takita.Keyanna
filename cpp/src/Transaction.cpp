#include "../include/Transaction.hpp"

// ----- Constructor -----
Transaction::Transaction(Store& store)
    : store(store), backup(store), committed(false) 	//initizlizer list
{
}

// ----- Commit -----
void Transaction::commit()
{
    committed = true;
}

// ----- Destructor -----
Transaction::~Transaction() 	//calls when the line is at its end
{
    if (!committed)
    {
        store = backup;
    }
}
