#include <iostream>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
using namespace std;
extern "C" double _first(char[], double);


int main()
{
    char applyName[100];
    double salary = 0.0;

    cout << "Welcome to Software Analysis by Paramount Programmers, Inc.\n";
    cout << "Please enter your first and last names and press enter: ";
    cin.getline(applyName, sizeof(applyName));
    cout << "\n";
    cout << "Thank you " << applyName << "." << " Our records show that you applied for employment here with our agency a week ago.\n";
    cout << "Please enter your expected annual salary when eployed at Paramount: ";
    cin >> salary;
    cout << "\n";
    cout << "Your interview with Ms Linda Fenster, Personnel Manager, will begin shortly.\n";
    
    salary = _first(applyName, salary);

    if(salary == 88000.88)
    {
        cout << "\nHello " << applyName << " I am the receptionist.\n";
        printf("This envelope contains your job offer with starting salary %.2lf. Please check back on Monday morning 8am.\n", salary);
        printf("Bye.\n");
    }
    else if(salary == 1200.12)
    {
        cout << "\nHello " << applyName << " I am the receptionist.\n";
        printf("We have an opening for you in the company cafeteria for %.2lf. Take your time to let us know your decision.\n", salary);
        printf("Bye.\n");
    }
    else if(salary == 1000000)
    {
        cout << "\nHello Mr. Sawyer. I am the receptionist.\n";
        cout << "This envelope has your job offer starting at 1 million annual. Please start any time you like. In the middle time out CTO wishes to have dinner with you. Have a very nice evening Mr. Sawyer.\n";
        cout << "Bye.\n";
    }

    return 0;
}
