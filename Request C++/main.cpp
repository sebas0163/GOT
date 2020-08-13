#include <cpr/cpr.h>
#include <iostream>
#include <thread>
#include <pthread.h>
#include <vector>
#include <unistd.h>

std::vector<std::future<void>> thread_thing;

void server_start(){


    system("npm run init jose jose");


}

int main(int argc, char** argv) {

    thread_thing.push_back(std::async(std::launch::async,server_start));
    sleep(3);


    auto response = cpr::Get(cpr::Url{"http://localhost:3000/GOT/api/logmein"});
    std::cout << response.text << std::endl;

    int i;
    std::cout << "Please enter an integer value: ";
    std::cin >> i;
    std::cout << "The value you entered is " << i;
    std::cout << " and its double is " << i*2 << ".\n";
    return 0;
}
