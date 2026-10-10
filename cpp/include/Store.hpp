#pragma once
#include <map>
#include <string> 

using namespace std;

// ----- Store class-----
class Store
{
	private: // holding the key value pairs // under private so it cannot change.
		map<string, string> data; // the storage

	public:
		void set(const string& key, const string& value); // SET
		string get(const string& key) const; // GET
		void remove(const string& key); // Delete
		void list()const; // LIST
		void save(const string& filename) const; // save
		void load(const string& filename); // Load
};
