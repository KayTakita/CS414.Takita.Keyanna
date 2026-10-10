#include "../include/Store.hpp"
#include <fstream>
#include <iostream> 

// ----- SET -----
void Store::set(const string& key, const string& value)
{
	data[key] = value;
}

// ----- GET -----
string Store::get(const string& key) const
{
	auto it = data.find(key);
	if (it != data.end())
	{
		return it-> second;
	}
	return "key not found";
}

// ----- Deletion -----
void Store::remove(const string& key)
{
	data.erase(key);
}

// ----- List -----
void Store::list() const
{
	for (const auto& item : data)
	{
		cout << item.first << " = " << item.second << endl;
	}
}

// ----- Save -----
void Store::save(const string& filename) const
{
	ofstream outFile(filename);
	for (const auto& item : data)
	{
		outFile << item.first << " = " << item.second << endl;
	}
}

// ----- Load -----
 void Store:: load(const string& filename)
{
	ifstream inFile(filename);
	string line;
	while (getline(inFile, line))
	{
		size_t position = line.find ('=');
		if (position != string::npos)
		{
			string key = line.substr(0, position);
			string value = line.substr(position + 1);
			data[key] = value;
		}
	}
}
