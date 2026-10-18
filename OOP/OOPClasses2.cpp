#include <iostream>
#include <string>
using namespace std;


class person {
    string name;
    int age;

    public:
        person(const string& n = "Unknown", int a = 0): name(n), age(a) {}

        void greet() {
            cout << "Hello, my name is " << name << "." << endl;
        }

        void stateAge() {
            cout << "I am " << age << " years old." << endl;
        }
};

class cat {
    string favFood, favDrink;

    public:
        cat(const string& f = "unknown food", const string& d = "unknown drink"): favFood(f), favDrink(d) {}

        void meow() {
            cout << "Meow!" << endl;
        }

        void requestFavMeal() {
            cout << "I need " << favFood << " and " << favDrink << ", nya!" << endl;
        }
};


int main() {
    person p1("Noor", 19);
    p1.greet();
    p1.stateAge();
    cout << endl;

    cat c1("tuna", "lactose-free milk");
    c1.meow();
    c1.requestFavMeal();
    cout << endl;
    
    return 0;
}