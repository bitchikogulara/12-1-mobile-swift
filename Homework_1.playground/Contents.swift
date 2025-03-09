import UIKit


//Task 1: Practice Loops

/*Objective: Practice using loops and variables.

Create a program that counts from 1 to 10 and prints each number. Print "Even" next to even numbers and "Odd" next to odd numbers. Provide 3 different solutions using:

for in
while
repeat while
Example Output:

1 Odd
2 Even
3 Odd
...
10 Even
*/

print("Task N1:\n\n")
print(" Solution N1:\n");

for i in 1...10 {
    print ("  ",i, i % 2 == 0 ? "Even" : "Odd");
}

print("\n Solution N2:\n");

var counter = 1;
while(counter < 11){
    print ("  ",counter, counter % 2 == 0 ? "Even" : "Odd");
    counter += 1;
}

print("\n Solution N3:\n");

counter = 0;
repeat{
    print ("  ",counter, counter % 2 == 0 ? "Even" : "Odd");
    counter += 1;
}while(counter < 11);

//Task 2: Working With Arrays

/*Objective: Practice using arrays and loops.

Create an array of 10 favorite TV Series or movies. Loop through the items and do the following transformation:

if the index of an item is divisible to 3 (no reminder) print it uppercased.
if the index of an item is divisible to 4 (no reminder) capitalize each word.
Extra task: Add a new item to the array and print the updated list in full (all items).
*/

print("\nTask N2:\n\n");

var tvSeries = [
  "mad men",
  "the sopranos",
  "fargo",
  "westworld",
  "ozark",
  "succession",
  "peaky blinders",
  "narcos",
  "the mandalorian",
  "true detective"
];

for(index, tvShow) in tvSeries.enumerated(){
    if(index % 3 == 0){ tvSeries[index] = tvShow.uppercased(); continue;}
    if(index % 4 == 0){ tvSeries[index] = tvShow.capitalized;}
}
print(" ", tvSeries);

tvSeries += ["Random TV show", "some cool TV show"];
print( "\n ", tvSeries);


//Task 3: Grade Tracker
/*Objective: Practice using dictionaries.

Store the names of students as keys and their grades as values. Create a program to:

Print all students and their grades.
Add a new student and their grade to the dictionary.
Find and print the grade of a specific student.
Extra Task: Could you try to implemented it using array and tuple?

Example:

var grades = ["Alice": 85, "Bob": 90, "Charlie": 78]
*/
 
print("\nTask N3:\n\n");

var grades = ["George": 83, "Bitchiko": 92, "Lela": 94];

for(key, score) in grades{
    print(" ", key,score);
}

grades["new student"] = 91;
print("\n ",grades);

if let georgesGrade = grades["George"]{
    print("\n  Georges grade is ", georgesGrade, "\n");
}

var gradesArray = [("George", 83), ("Bitchiko", 92), ("Lela", 94)];

for student in gradesArray{
    print(" ",student.0,student.1);
}

gradesArray += [("new student", 91)];
print("\n ",gradesArray);


func getStudentGrade(name : String) -> Int{ // returns student score if found (first one in the array), else returns -1
    for i in 0..<gradesArray.count{
        if(gradesArray[i].0 == name){
            return gradesArray[i].1;
        }
    }
    return -1;
}

var georgesGrade = getStudentGrade(name: "George");

if(georgesGrade != -1){ print("\n  Georges grade is ", georgesGrade, "\n"); }


//Task 4: Person Details

/*
Objective: Practice using tuples.

Define a tuple with the following properties: name (String), age (Int), and city (String). Print each property on a separate line.

Extra Task: Update the city in the tuple and print the updated tuple.
 */

print("\nTask N4:\n\n");

func printPerson(person : (name : String, age : Int, city : String)){
    print(" name: ", person.name, "\n age:  ", person.age, "\n city: ", person.city);
}


var bitchiko = (name : "Bitchiko", age : 20, city : "Rustavi");
printPerson(person: bitchiko);

print();

bitchiko.city = "Evry";
printPerson(person: bitchiko);

//Task 5: Shopping List

/*
Objective: Practice using constants and variables.

Write a program to:

Create a constant array of 5 shopping items. Each item should has a price. (use tuples)
Use a loop to print all items.
Create a variable for the total cost (starting at 0). Calculate and print the total cost.
Example Output:

Items: Milk, Bread, Cheese, Apples, Bananas
Total cost: 50
*/

print("\nTask N5:\n\n");

let shoppingItems = [("Banana", 0.99), ("potatoes", 2.99), ("eggs", 2.49), ("baguette", 0.39), ("water", 1.95)];

var totalCost = 0.0;

for item in shoppingItems{
    print(" ", item.0, item.1);
    totalCost += item.1;
}

print("\n  Total cost: ", totalCost);

