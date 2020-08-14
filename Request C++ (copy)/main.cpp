#include <cpr/cpr.h>
#include <iostream>
#include <thread>
#include <pthread.h>
#include <vector>
#include <unistd.h>
#include "Manager.cpp"
using namespace std;

string user;
string password;
std::vector<std::future<void>> thread_thing;


void server_start(){

  string command = "npm run init "+ user + " " +password;
  system(command.c_str());


}

int main(int argc, char** argv) {

  system("fuser -n tcp -k 3000");
  cout << "> Escriba su nombre: ";
  getline(cin, user);
  cout << "> Escriba su contraseña: ";
  getline(cin, password);

  thread_thing.push_back(std::async(std::launch::async,server_start));
  sleep(3);

  string help="http://localhost:3000/GOT/api/logmein";
  auto response = cpr::Post(cpr::Url{help});
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
    return 0;
}
