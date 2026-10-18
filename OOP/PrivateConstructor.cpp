#include <iostream>
using namespace std;


class MathUtil {
    MathUtil() {} // class members are private by default, making the constructor private to prevent instantiation

    public:
        static int add(int a, int b) {
            return a + b;
        }

        static int subtract(int a, int b) {
            return a - b;
        }
};


int main() {
    int x = 70, y = 6;

    cout << "Addition: " << MathUtil::add(x, y) << endl;
    cout << "Subtraction: " << MathUtil::subtract(x, y) << endl;

    return 0;
} 