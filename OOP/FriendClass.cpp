#include <iostream>
using namespace std;


class A {
    int secretNumber;

    public:
        A(): secretNumber(76) {}

        friend class B;
};

class B {
    public:
        void revealSecret(A a) {
            cout << "The secret number is: " << a.secretNumber << endl;
        }
};


int main() {
    A objA;
    B objB;

    objB.revealSecret(objA);

    return 0;
}
