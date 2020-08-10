#include <iostream>
#include <fstream>
using namespace std;
#include "Manager.h"
#include "md5.cpp"

string http = " http://localhost:3000/GOT/api/";
Manager::Manager(string usr)
{
    username = usr;
}



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
    string url = http+"init/"+name;
    //auto response = cpr::Post(cpr::Url{url);
    //std::cout << response.text << std::endl; 
    cout << url <<endl;

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
    //TENGO QUE HACER UNA FUNCION QUE BUSQUE LOS ARCHIVOS Y VAYA MANDANDO EL COMANDO CON CADA ARCHIVO
    string file; //Cada archivo con cambios
    string changes;//Cambios con huffman
    string dictionary;//Diccionario que se crea
    string url = http+"commit/"+file+"/"+changes+"/"+ dictionary+"/"+md5(message);
    //auto response = cpr::Post(cpr::Url{url);
    //std::cout << response.text << std::endl; 
    cout << url <<endl;
}
void Manager::status(string file)
{
    string url = http+"status/"+file;
    //auto response = cpr::Post(cpr::Url{url);
    //std::cout << response.text << std::endl; 
    cout << url <<endl;
}
void Manager::rollback(string file, string commit)
{
    string url = http+"rollback/"+file+"/"+commit;
    //auto response = cpr::Post(cpr::Url{url);
    //std::cout << response.text << std::endl; 
    cout << url <<endl;
}
void Manager::reset(string file)
{
    string url = http+"newest/"+file;
    //auto response = cpr::Post(cpr::Url{url);
    //std::cout << response.text << std::endl; 
    cout << url <<endl;
}
void Manager::sync(string file)
{
    string url = http+"newest/"+file;
    //auto response = cpr::Post(cpr::Url{url);
    //std::cout << response.text << std::endl; 
    cout << url <<endl;
}

void Manager::hello()
{
    cout << "hello!" << endl;
}