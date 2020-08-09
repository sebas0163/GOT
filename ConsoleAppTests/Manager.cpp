#include <iostream>
#include <fstream>
using namespace std;
#include "Manager.h"
#include "md5.cpp"

vector<string> Manager::split(const string& s, char delimiter)
{
   vector<string> tokens;
   string token;
   istringstream tokenStream(s);
   while (std::getline(tokenStream, token, delimiter))
   {
      tokens.push_back(token);
   }
   return tokens;
}

void Manager::init(string name)
{
    cout << "Repositorio " << name << " iniciado"<<endl;
}
void Manager::help()
{
    string STRING;
	ifstream infile;
    
	infile.open ("help.txt");
        while(!infile.eof()) // To get you all the lines.
        {
	        getline(infile,STRING); // Saves the line in STRING.
	        cout<<STRING<<endl; // Prints our STRING.
        }
	infile.close();
}

void Manager::add(string file)
{
    cout << "Archivo " << file << " agregado"<<endl;
}
void Manager::commit(string message)
{
    cout << "Commit con mensaje "<< message << ", código: " << md5(message) << endl;
}
void Manager::status(string file)
{
    cout << "Estado del archivo " << file << endl;
}
void Manager::rollback(string file, string commit)
{
    cout << "Archivo " << file << "al commit " << commit << endl;
}
void Manager::reset(string file)
{
    cout << "Resetear el achivo "<<file;
}
void Manager::sync(string file)
{
    cout << "Sincronizar el archivo "<<file;
}

void Manager::hello()
{
    cout << "hello!" << endl;
}