#include <iostream>
using namespace std;


class person {
    public:
        string name;
        int age;

        void greet() {
            cout << "Hello, my name is " << name << "." << endl;
        }

        void stateAge() {
            cout << "I am " << age << " years old." << endl;
        }
};

class cat {
    public:
        string favFood, favDrink;

        void meow() {
            cout << "Meow!" << endl;
        }

        void requestFavMeal() {
            cout << "I need " << favFood << " and " << favDrink << ", nya!" << endl;
        }
};


int main() {
    person p1;
    p1.name = "Noor";
    p1.age = 19;
    p1.greet();
    p1.stateAge();
    cout << endl;

    cat c1;
    c1.favFood = "tuna";
    c1.favDrink = "lactose-free milk";
    c1.meow();
    c1.requestFavMeal();
    cout << endl;

    return 0;
}