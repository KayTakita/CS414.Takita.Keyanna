#pragma once

#include "Store.hpp"

// -------------------- Transaction Class --------------------
class Transaction
{
private:
    // The real store being changed
    Store& store;

    // Copy of store; no changes
    // 3 var 
    Store backup;
    bool committed;

public:
    // ----- Constructor -----
    Transaction(Store& store);	//what is being stored

    // ----- Commit -----
    void commit();

    // ----- Destructor -----
    ~Transaction();
};
