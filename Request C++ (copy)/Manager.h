#include <iostream>
using namespace std;
#include <sstream>
#include <algorithm>
#include <iterator>
#include <vector>

/// @brief Clase para controlar los comandos que envía el usuario
class Manager
{
    private:
        string username;
        vector<string> files;
        
    public:
        /// @brief Constructor de la clase
	    /// @param user Nombre del usuario
        Manager(string user);
        /// @brief Divide un string dependiendo del caracter delimitador
	    /// @param s String a dividir
	    /// @param delimiter Delimitador
        /// @return Vector con el string dividido
        static vector<string> split(const string& s, char delimiter);
        /// @brief Inicializa un repositorio en la base de datos 
	    /// @param name Nombre del repositorio
        void init(string name);
        /// @brief Retorna la función de cada comando
        void help();
        /// @brief Agrega todos los archivos o el archivo especficado al vector files
	    /// @param file Archivo a agregar
        void add(string file);
        /// @brief Envía todos los archivos que fueron agregados al servidor
	    /// @param message Mensaje del commit
        void commit(string message);
        /// @brief Retorna el estado de todos los archivos o las versiones de un archivo en específico
	    /// @param file Archivo especificado
        void status(string file);
        /// @brief Devuelve un archivo especificado a la versión del commit especificado
	    /// @param file Archivo que se quiere devolver
        /// @param commit Commit al que se quiere volver
        void rollback(string file, string commit);
        /// @brief Devuelve un archivo especificado 
	    /// @param file Archivo especificado
        void reset(string file);
        /// @brief Sincroniza un archivo con la última versión del servidor permite realizar un merge
	    /// @param file Archivo especifo
        void sync(string file);
        /// @brief Permite enviar archivos al mismo repositorio en el que está el usuario especificado
	    /// @param user Usuario al que conectarse
        void befriend(string user);
        /// @brief Decodifica un string con su diccionario
	    /// @param dictionary Diccionario
	    /// @param decodeStr String codificado
        /// @return El string decodificado
        string decode(string dictionary, string decodeStr);
        /// @brief Codifica un string utilizando Huffman
	    /// @param str String a codificar
        /// @return Un vector con el diccionario y el string codificado
        vector<string> encode(string str);
        void hello();


};
