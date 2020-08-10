#include <cpr/cpr.h>
#include <iostream>

int main(int argc, char** argv) {
    auto response = cpr::Get(cpr::Url{"http://localhost:3000/GOT/api"});
    std::cout << response.text << std::endl;
}