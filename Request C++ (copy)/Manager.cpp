#include <iostream>
#include <fstream>
#include <cpr/cpr.h>
using namespace std;
#include "Manager.h"
#include "Huffman.cpp"
#include "md5.cpp"
#include <stdlib.h>
string http = "http://localhost:3000/GOT/api/";
Manager::Manager(string usr)
{
    username = usr;
}

string replaceChar(string str, char oldChr, char newChr)
{
    string substring;
    for(int i =0;i<str.size();i++)
    {
        if(str[i]=='"'){}
        else if(str[i]==oldChr)
        {
            substring+=newChr;
        }
        else
        {
            substring+=str[i];
        }

    }
    return substring;
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
	        content= content + STRING +"!";
            //cout<<STRING<<endl; // Prints our STRING.
        }
	infile.close();
    content = replaceChar(content,' ','+');
    content.pop_back();
    return content;
}
void writeFile(string fileName, string content)
{
    string contentTemp = replaceChar(content,'+',' ');
    content = replaceChar(contentTemp,'!','\n');
    ofstream myfile;
    myfile.open (fileName);
    myfile << content;
    myfile.close();
  
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
	return decodedStr;

} 



vector<string> Manager::encode(string str)
{

	string encodedString, decodedString, table; 
	calcFreq(str, str.length()); 
	HuffmanCodes(str.length()); 
	for (auto v=codes.begin(); v!=codes.end(); v++) 
		table= table+ v->first +'~'+ v->second + '|';

	for (auto i: str) 
		encodedString+=codes[i]; 

	vector<string> vec;
	vec.push_back(table);
	vec.push_back(encodedString);
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
    auto response = cpr::Post(cpr::Url{url.c_str()});
    //std::cout << response.text << std::endl; 
    //cout << url <<endl;

}
void Manager::help()
{
    
    string helpTemp = replaceChar(getFileContent("help.txt"),'+', ' ');
    string help = replaceChar(helpTemp,'!', '\n');

    cout << help;
}

void Manager::add(string file)
{
    string ignore = getFileContent("gotignore.txt");
    vector<string> ignoreFiles = Manager::split(ignore,'!');
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
                if (temp[1]=="txt" && !checkForFile(files,allFiles[j]) && !checkForFile(ignoreFiles,allFiles[j]))
                {
                    files.push_back(allFiles[j]);
                }
            
            }
            
        }
        cout << "Archivos agregados: " <<endl;
        printStrVec(files);
        
    }
    else
    {
        if(!checkForFile(files,file) && !checkForFile(ignoreFiles,file))
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
        string commitId=md5(message);
        for(int i =0; i<files.size();i++)
        {
            string fileContent = getFileContent(files[i]); //Cada archivo con cambios
            vector <string> fileVec=encode(fileContent);
            string dictionary= fileVec[0];//Diccionario que se crea
            string encodedFile = fileVec[1];//Cambios con huffman
            string url = http+"commit/"+files[i]+"/"+commitId+"/"+encodedFile+"/"+ dictionary+"/"+message;
            auto response = cpr::Post(cpr::Url{url.c_str()});
            

        }
        cout << "ID del commit: "<< commitId <<endl;
        files.clear();
    }
}
void Manager::status(string file)
{
    string url;
    if (file =="")
    {
        url = http+"status";
        auto response = cpr::Get(cpr::Url{url.c_str()});
        string resp = response.text;
        //std::cout << response.text << std::endl;
        vector<string> vecResp=Manager::split(resp, '/');
        vector <string> cambiados;
        vector <string> sinCambio;
        vector <string> eliminados;

        for (int i=0;i<vecResp.size();i+=3)
        {
            string archivo = replaceChar(vecResp[i],'.','.');
            writeFile("ServerFile.txt",decode(vecResp[i+1], vecResp[i+2]));
            string out = cmdOutput("diff -q "+archivo+" ServerFile.txt");

            string allFilesStr;
            allFilesStr = cmdOutput("ls");
            vector<string> allFiles= Manager::split(allFilesStr,'\n');
            if (!checkForFile(allFiles,archivo))
            {
                eliminados.push_back(archivo);
            }
            else if(out=="")
            {
                sinCambio.push_back(archivo);
            }
            else
            {
                cambiados.push_back(archivo);
            }
            
        }
        cout << "Archivos agregados: " <<endl;
        printStrVec(files);
        cout << "Archivos eliminados: " <<endl;
        printStrVec(eliminados);
        cout << "Archivos editados: " <<endl;
        printStrVec(cambiados);

    }
    else
    {
        
        url = http+"status/"+file;
        auto response = cpr::Get(cpr::Url{url.c_str()});
        string resp = response.text;
        vector<string> vecResp=Manager::split(resp, '/');
        for(int i=0;i<vecResp.size();i+=6)
        {
            cout << "Archivo: "<< vecResp[i+1] <<endl;
            cout << "Fecha: "<< vecResp[i] <<endl;
            cout << "Commit ID: "<< vecResp[i+2] <<endl;
            cout << "Mensaje: "<< vecResp[i+3] <<endl;
            cout << "Diferencias con el original: "<<endl;
            writeFile("ServerFile.txt",decode(vecResp[i+4], vecResp[i+5]));
            string comando="diff -u " +file + " ServerFile.txt";
            system(comando.c_str());
            cout << "-----------------------" <<endl;
        }

    }
    
     
    //cout << url <<endl;
}
void Manager::rollback(string file, string commit)
{
    string url = http+"rollback/"+file+"/"+commit;
    auto response = cpr::Get(cpr::Url{url.c_str()});
    //std::cout << response.text << std::endl; 
    vector<string> resp = Manager::split(response.text, '/');
    string dictionary= resp[0];
    string decodedFile=resp[1];
    writeFile(file,decode(dictionary,decodedFile));
    //cout << url <<endl;
}
void Manager::reset(string file)
{
    string url = http+"newest/"+file;
    auto response = cpr::Get(cpr::Url{url.c_str()});
    //std::cout << response.text << std::endl;
    vector<string> resp = Manager::split(response.text, '/');
    string dictionary= resp[0];
    string decodedFile=resp[1];
    writeFile(file,decode(dictionary,decodedFile));

    //cout << url <<endl;
}
void Manager::sync(string file)
{
    
    string url = http+"newest/"+file;
    auto response = cpr::Get(cpr::Url{url.c_str()});
    //std::cout << response.text << std::endl; 
    vector<string> resp = Manager::split(response.text, '/');
    string dictionary= resp[0];
    string decodedFile=resp[1];

    writeFile("ServerFile.txt",decode(dictionary,decodedFile));

    cout << "Cambios:" <<endl;
    string out = cmdOutput("diff -q "+file+" ServerFile.txt");
    if(out==""){
        cout << "¡El archivo está actualizado!" <<endl;
    }
    else
    {
        string comando="vimdiff " +file + " ServerFile.txt";
        system(comando.c_str());
    }
    
    
    //cout << url <<endl;
}

void Manager::befriend(string name)
{
    string url = http+"befriend/"+name;
    auto response = cpr::Post(cpr::Url{url.c_str()});
    //std::cout << response.text << std::endl;
    //cout << url <<endl;
}


void Manager::hello()
{

   
    writeFile("example.txt", getFileContent("Archivo2.txt"));
    cout << "hello!" << endl;
}