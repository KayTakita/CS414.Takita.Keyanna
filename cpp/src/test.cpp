#include "../include/Store.hpp"
#include "../include/Transaction.hpp"
#include <iostream>

using namespace std;

int main()
{
    Store store;

    // ----- SET Test -----
    cout << "----- SET TEST -----" << endl;
    store.set("name", "Ada");
    cout << "name = " << store.get("name") << endl;

    // ----- GET Test -----
    cout << "\n----- GET TEST -----" << endl;
    cout << "name = " << store.get("name") << endl;

    // ----- DELETE Test -----
    cout << "\n----- DELETE TEST -----" << endl;
    store.remove("name");
    cout << "After deleting name:" << endl;
    store.list();

    // ----- Transaction Rollback Test -----
    cout << "\n----- TRANSACTION ROLLBACK TEST -----" << endl;

    store.set("x", "10");

    cout << "Initial state:" << endl;
    store.list();

    {
        Transaction tx(store);

        store.set("x", "20");
        store.set("y", "30");

        cout << "\nInside transaction:" << endl;
        store.list();

        // No commit.
        // Destructor should restore the original store.
    }

    cout << "\nAfter aborted transaction:" << endl;
    store.list();

    // ----- SAVE Test -----
    cout << "\n----- SAVE TEST -----" << endl;
    store.save("test_data.txt");
    cout << "Store saved." << endl;

    // ----- LOAD Test -----
    cout << "\n----- LOAD TEST -----" << endl;

    Store loadedStore;
    loadedStore.load("test_data.txt");

    cout << "Loaded store:" << endl;
    loadedStore.list();

    return 0;
}
