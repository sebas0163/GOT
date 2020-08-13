// basic file operations
#include "Manager.cpp"
#include <iostream>
#include <fstream>
#include <istream>
using namespace std;


int main () {

  //vector<string> vec= Manager::split("Hola prueba de split", ' ');
  string user;
  cout << "> Escriba su nombre: ";
  getline(cin, user);
  Manager manager(user);
  
  while(true)
  {
    
    string input;
    cout << user+"> ";
    getline(cin, input);
    vector<string> inputVec= Manager::split(input, ' ');
    string command= inputVec[0]+' '+inputVec[1];

    if (command=="got init")
    {
      manager.init(inputVec[2]);
    }
    else if (command =="got help")
    {
      manager.help();
    }
    else if (command =="got add")
    {
      manager.add(inputVec[2]);
    }
    else if (command =="got commit")
    {
      manager.commit(inputVec[2]);
    }
    else if (command =="got status")
    {
      if (inputVec.size()==3)
      {
        manager.status(inputVec[2]);
      }
      else
      {
        manager.status("");
      }
    }
    else if (command =="got rollback")
    {
      manager.rollback(inputVec[2], inputVec[3]);
    }
    else if (command =="got reset")
    {
      manager.reset(inputVec[2]);
    }
    else if (command =="got sync")
    {
      manager.sync(inputVec[2]);
    }
    else if (command =="got befriend")
    {
      manager.befriend(inputVec[2]);
    }
    else if (command=="got end")
    {
      break;
    }
    else
    {
      manager.hello();
      cout << "comando no encontrado" << endl;
    }
    
  }
    
    
  /*ofstream myfile;
  myfile.open ("example.txt");
  myfile << "Writing this to a file.\n";
  myfile.close();
  return 0;*/
}