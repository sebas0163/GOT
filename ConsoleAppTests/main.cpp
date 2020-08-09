// basic file operations
#include "Manager.cpp"
#include <iostream>
#include <fstream>
#include <istream>



using namespace std;





int main () {

  vector<string> vec= Manager::split("Hola prueba de split", ' ');

  while(true)
  {
    Manager Bob;
    string input;
    cout << "> ";
    getline(cin, input);
    vector<string> inputVec= Manager::split(input, ' ');
    string command= inputVec[0]+' '+inputVec[1];

    if (command=="got init")
    {
      Bob.init(inputVec[2]);
    }
    else if (command =="got help")
    {
      Bob.help();
    }
    else if (command =="got add")
    {
      Bob.add(inputVec[2]);
    }
    else if (command =="got commit")
    {
      Bob.commit(inputVec[2]);
    }
    else if (command =="got status")
    {
      Bob.status(inputVec[2]);
    }
    else if (command =="got rollback")
    {
      Bob.rollback(inputVec[2], inputVec[3]);
    }
    else if (command =="got reset")
    {
      Bob.reset(inputVec[2]);
    }
    else if (command =="got sync")
    {
      Bob.sync(inputVec[2]);
    }
    else if (command=="got end")
    {
      break;
    }
    else
    {
      cout << "comando no encontrado";
    }
  }
    
    
  /*ofstream myfile;
  myfile.open ("example.txt");
  myfile << "Writing this to a file.\n";
  myfile.close();
  return 0;*/
}