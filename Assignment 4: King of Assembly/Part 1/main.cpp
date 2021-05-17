// ****************************************************************************************************************************
// Program name: "King of Assembly".  This program demonstrates passing values from main to assembly file,       *
// calculating arithimetic functions in assembly file and using IEEE 754 conversions.                                         *
// Copyright (C) 2021 Wesley Chok                                                                                             *
// This file is part of the software program "King of Assembly".                                                              *
// King of Assembly is free software: you can redistribute it and/or modify it under the terms of the GNU General             *
// Public License version 3 as published by the Free Software Foundation.                                                     *
// King of Assembly is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the             *
// implied                                                                                                                    *
// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
// A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                            *
// ****************************************************************************************************************************




//========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//
// Author information
//  Author name: Wesley Chok
//  Author email: chokwj@csu.fullerton.edu
//
// Program information
//  Program name: King of Assembly
//  Programming languages: One modules in C++ and one modules assembly.
//  Date program began: 2021-April-26
//  Date of last update: 2021-May-12
//  Date of reorganization of comments: 2021-May-12
//  Files in this program: main.cpp, interview.asm
//  Status: Finished.  The program was tested extensively with no errors in Xubuntu19.04.
//
// Purpose
//  This serves as the main C++ file for this program. The tasks this C++ file are to complete are welcoming the user,
//  asking the user various prompts and passing the values to the assembly file, and retrieving values from the assembly file
//  and properly displaying them
// This file
//   File name: main.cpp
//   Language: X86 with Intel syntax.
//   Max page width: 132 columns
//   Assemble: g++ -c -m64 -Wall -fno-pie -no-pie -o main.o main.cpp


// ===== Begin code area ================================================================================================

#include <iostream>
#include <stdio.h>
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
