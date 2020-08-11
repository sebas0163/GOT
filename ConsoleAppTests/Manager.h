#include <iostream>
using namespace std;
#include <sstream>
#include <algorithm>
#include <iterator>
#include <vector>

class Manager
{
    private:
        string username;
        vector<string> files;
        
    public:
        
        Manager(string user);
        static vector<string> split(const string& s, char delimiter);
        void init(string name);
        void help();
        void add(string file);
        void commit(string message);
        void status(string file);
        void rollback(string file, string commit);
        void reset(string file);
        void sync(string file);
        void hello();
        string decode(string dictionary, string decodeStr);
        vector<string> encode(string str);


};