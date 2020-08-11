#include <iostream>
#include <fstream>
using namespace std;
#include "Manager.h"
#include "Huffman.cpp"
#include "md5.cpp"
#include <stdlib.h>
string http = " http://localhost:3000/GOT/api/";
Manager::Manager(string usr)
{
    username = usr;
}


string getFileContent(string name)
{
    string STRING;
    string content;
	ifstream infile;
    
	infile.open (name);
        while(!infile.eof()) // To get you all the lines.
        {
	        getline(infile,STRING); // Saves the line in STRING.
	        content= content + STRING + "\n";
            //cout<<STRING<<endl; // Prints our STRING.
        }
	infile.close();
    return content;
}
string cmdOutput(string cmd) 
{

    string data;
    FILE * stream;
    const int max_buffer = 256;
    char buffer[max_buffer];
    cmd.append(" 2>&1");

    stream = popen(cmd.c_str(), "r");
    if (stream) {
      while (!feof(stream))
        if (fgets(buffer, max_buffer, stream) != NULL) data.append(buffer);
          pclose(stream);
      }
    return data;
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
string Manager::decode(string table, string s)
{
	string decodedStr;
	vector<string> charCodes= Manager::split(table, '|');
	string subStr;
	for (int i=0; i< s.size();i++)
	{
		subStr+=s[i];
		for (int j=0; j< charCodes.size();j++)
		{
			vector<string> code= Manager::split(charCodes[j], '~');
			if (subStr==code[1])
			{
				decodedStr+=code[0];
				subStr="";
			}
		}

	}
	cout<<"decoded: "<<decodedStr<<endl;
	return decodedStr;

} 



vector<string> Manager::encode(string str)
{
	//string str = "Pruebas para ver la codificacion y decodificacion"; 
	string encodedString, decodedString, table; 
	calcFreq(str, str.length()); 
	HuffmanCodes(str.length()); 
	//cout << "Character With their Frequencies:\n"; 
	for (auto v=codes.begin(); v!=codes.end(); v++) 
		//cout << v->first <<' ' << v->second << endl; 
		table= table+ v->first +'~'+ v->second + '|';

	for (auto i: str) 
		encodedString+=codes[i]; 
	//cout << "aaaaa: " << table;

	//cout << "\nEncoded Huffman data:\n" << encodedString << endl; 

	//decodedString = decode_file(minHeap.top(), encodedString); 
	//cout << "\nDecoded Huffman Data:\n" << decodedString << endl; 
	vector<string> vec;
	vec.push_back(table);
	vec.push_back(encodedString);
	//cout << "frecuencias: "<<vec[0]<<endl;
	//cout << "codificado"<<vec[1]<<endl;
	return vec;
	
}
void printStrVec(vector<string> vec)
{
    for(int i=0;i<vec.size();i++)
    {
        cout <<i<<": "<<vec[i] << endl;
    }
}
bool checkForFile(vector<string> fileVec, string fileName)
{
    for(int i=0;i<fileVec.size();i++)
    {
        if (fileVec[i]==fileName){return true;}
    }
    return false;
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
    cout << getFileContent("help.txt");
}

void Manager::add(string file)
{
    if (file == "-A")
    {
        string i;
        i = cmdOutput("ls");
        vector<string> allFiles= Manager::split(i,'\n');
        for(int j=0;j<allFiles.size();j++)
        {
            vector<string> temp=Manager::split(allFiles[j],'.');
            if (temp.size()>1)
            {
                if (temp[1]=="txt" && !checkForFile(files,allFiles[j]))
                {
                    files.push_back(allFiles[j]);
                }
            
            }
            
        }
        cout << "Archivos agregados: " <<endl;
        printStrVec(files);
        
        //cout << "Archivo " << file << " agregado"<<endl;
    }
    else
    {
        if(!checkForFile(files,file))
        {
            files.push_back(file);
        }
    }
    
}
void Manager::commit(string message)
{
    if (files.empty())
    {
        cout << "Debe agregar archivos, para ver los comandos escriba got help " << endl;
    }
    else
    {
        //TENGO QUE HACER UNA FUNCION QUE BUSQUE LOS ARCHIVOS Y VAYA MANDANDO EL COMANDO CON CADA ARCHIVO
        for(int i =0; i<files.size();i++)
        {
            string fileContent = getFileContent(files[i]); //Cada archivo con cambios
            vector <string> fileVec=encode(fileContent);
            string dictionary= fileVec[0];//Diccionario que se crea
            string encodedFile = fileVec[1];//Cambios con huffman
            string url = http+"commit/"+files[i]+"/"+encodedFile+"/"+ dictionary+"/"+md5(message);
            //auto response = cpr::Post(cpr::Url{url);
            //std::cout << response.text << std::endl; 
            cout << url <<endl;

        }
    }
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
    //vector<string> vec=encode(getFileContent("Archivo1.txt"));
    //decode(vec[0],vec[1]);
    
        
    cout << "hello!" << endl;
}
