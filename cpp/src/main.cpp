#include "../include/Store.hpp"

#include "../include/Transaction.hpp"

#include <iostream>
#include <sstream>
#include<string>

using namespace std;

int main()
{
	Store store;
	string line;
	string command;
	cout << "Transcational key value store" << endl;
	cout << "Please enter a command: " << endl;

   // ----- Command Loop -----
	while (true) 		// keep runing until other wise
	{
	   cout << " ... ";	// leave open
	   getline(cin, line);
	   stringstream input(line);
	   input >> command;

   // ----- Set -----
	if (command == "Set")
	{
	   string key;
	   string value;
	   input >> key >> value;
	   store.set(key, value);
	   cout << "saved: " << key << " = " << value << endl;
	}

   // ----- Get -----
	if (command == "Get")
	{
	   string key;
	   input >> key;
	   cout << store.get(key) << endl;
	}

   // ----- Delete -----
	if (command == "Delete")
	{
	   string key;
	   input >> key;
	   store.remove(key);
	   cout << "Delete: " << key << endl;
	}

   // ----- List -----
	if (command == "List")
	{
	   cout << "Store: " << endl;
	   store.list();
	}

   // ----- Quit -----
	if (command == "Quit") 	
	{
	   cout << "Thank you, Goodbye" << endl;
	   break;		// we breaking free! 
	}
	}
return 0;
}
