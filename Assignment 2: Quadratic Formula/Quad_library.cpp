#include <iostream>

extern "C" void show_no_root();
extern "C" void show_one_root(double root);
extern "C" void show_two_root(double root1, double root2);

extern "C"{
    void show_no_root(){
        std::cout << "No root is detected. Returning to program." << std::endl;
    }
}

extern "C"{
    void show_one_root(double root){
        std::cout << "One root is detected. The root is: " << root << std::endl;
    }
}

extern "C"{
    void show_two_root(double root1, double root2){
        std::cout << "Two roots are detected. The two roots are " << root1 
                  << " and " << root2 << std::endl;
    }
}
