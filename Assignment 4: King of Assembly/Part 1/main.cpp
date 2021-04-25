#include <iostream>
using namespace std;
extern "C" double _first(char applyName[], double salary);


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

    cout << "I have returned mortals!!!!!!!!!!!!";
    if(salary == 88000.88)
    {
        cout << "Hello " << applyName << " I am the receptionist.\n";
        cout << "This envelope contains your job offer with starting salary " << salary << "." << "Please check back on Monday morning 8am.\n";
        cout << "Bye.\n";
    }
    else if(salary == 1200.12)
    {
        cout << "Hello " << applyName << " I am the receptionist.\n";
        cout << "We have an opening for you in the company cafeteria for " << salary << "." << "Take your time to let us know your decision.\n";
        cout << "Bye.\n";
    }
    else
    {
        cout << "Hello Mr. Sawyer. I am the receptionist.\n";
        cout << "This envelope has your job offer starting at "<< salary << " annual." << "Please start any time you like. In the middle time out CTO wishes to have dinner with you. Have a very nice evening Mr. Sawyer.\n";
        cout << "Bye.\n";
    }
  
    
    

    return 0;
}