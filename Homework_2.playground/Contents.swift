import UIKit

//Task 1: Functions

/*
 Objective: Practice recursion and functions.

 Implement the following function that calcualtes factorial.

 If the input is nil, the function should return nil.
 If the input is less than 0, print an error message and return nil.
 Otherwise, return the factorial of the number using recursion.
 Example Output:

 func factorial(n: Int?) -> Int {
    // TODO: add your implementation here
    return nil
 }
 // n! = n * (n - 1)!
 // 1! = 1
 // n! = n * (n - 1) * ... * 1
*/

print("Task N1:\n")

func factorial(n: Int?) -> Int? { // if we want to return nill return type must ne Int? instead of Int
    guard let number = n else {
        return nil;
    }
    
    if number < 0{
        print(" Error: argument must be >= 0.");
        return nil;
    }
    
    if number == 0{
        return 1;
    }
    
    return number * factorial(n: number-1)!;
}

print(" factorial of 5 is", factorial(n: 5) ?? "Invalid");
print(" factorial of 0 is", factorial(n: 0) ?? "Invalid");
print(" factorial of -2 is", factorial(n: -2) ?? "Invalid");
print(" factorial of 10 is", factorial(n: 10) ?? "Invalid");


//Task 2: Working With Arrays and custom Structures

/*
 Objective: Practice using arrays and structure.

 Create a structure Student. It should have a name: String and grades: [Double]

 Implement a function averageGrade(for: Student, inClass: [String: Student]) -> Double.
 
 Implement a function bestStudent(for: Student, inClass: [String: Student]) -> (Student, Double)
 which finds the best student with higher average grade in a list of students.

 Tip: inClass is a dictionary like :

 let students = [
    "Alice" : Stident(name: "Alice", grades: [5.5, 3.5, 5.75]),
    "Bob" : Stident(name: "Bob", grades: [5.25, 3.75, 5.75])
 ]
*/

print("\nTask N2:\n")

struct Student{
    var name : String;
    var grades : [Double];
}

let students = [
    "Alice" : Student(name: "Alice", grades: [5.5, 3.5, 5.75]),
    "Bob" : Student(name: "Bob", grades: [5.25, 1.75, 2.75])
]

func averageGrade(student: Student) -> Double{
    return student.grades.reduce(0, +)/Double(student.grades.count);
}

func averageGrade(classStudents: [String:Student]) -> Double{
    var averageScore = 0.0;
    for (_, student) in classStudents{
        averageScore += averageGrade(student: student);
    }
    return averageScore/Double(classStudents.count);
}

print(" Alices average score is ", String(format: "%.2f", averageGrade(student: students["Alice"]!)));
print(" average score in class is ", String(format: "%.2f", averageGrade(classStudents: students)));


func bestStudent(classStudents: [String: Student]) -> (Student, Double){
    var best: Student = Student(name:"temp", grades:[-1.0, -1.0, -1.0]);
    
    for (_,student) in classStudents{
        if averageGrade(student : student) > averageGrade(student: best){
            best = student;
        }
    }
    return (best, averageGrade(student: best));
}

print(" The best student in the class is", bestStudent(classStudents: students).0.name, "with average score -", String(format: "%.2f", bestStudent(classStudents: students).1));


//Task 3: Find the longest word in a list of words using recursion

/*
 Objective: Practice arrays and functions.
 
 Example:
 
 func findLongestWord(in: [String?]) -> String? {
    // TODO:
    return nil
 }
*/

print("\nTask N3:\n")


func findLongestWord(in words: [String?]) -> String? {
    guard !words.isEmpty else {return nil; }
    let firstWord = words[0] ?? "";
    let longestInRest = findLongestWord(in : Array(words.dropFirst())) ?? "";
    
    return firstWord.count > longestInRest.count ? firstWord : longestInRest;
}

let test1: [String?] = ["apple", "banana", "strawberry", nil, "blueberry"];
print(" the longest word in the list is \"\(findLongestWord(in: test1) ?? "{Error, the list is Empty!}")\".");

let test2: [String?] = [];
print(" the longest word in the list is \"\(findLongestWord(in: test2) ?? "{Error, the list is Empty!}")\".");


//Task 4: Shopping List

/*
 Objective: Practice structures, methods, getters and dictionary.

 Create a structure ShoppingItem with the following properties:

 name
 quantity
 isPurchased
 Write a structure ShoppingList with the following props and functionalities:

 A dictionary of items. The name of the item is used as a key.
 A method addItem(item: ShoppingItem).
 A method markAsPurchased(item: ShoppingItem).
 A method markAsPurchased(itemName: String).
 A method listUnpurchasedItems() -> [ShoppingItems].
 Example Output:

 let shoppingList = ShoppingList()
 shoppingList.addItem(name: "Apples", quantity: 5)
 shoppingList.addItem(name: "Bananas", quantity: 3)
 shoppingList.markAsPurchased(name: "Apples")

 let unpurchased = shoppingList.listUnpurchasedItems()
*/

print("\nTask N3:\n")


struct ShoppingItem{
    var name : String;
    var quantity : Int;
    var isPurchased : Bool = false;
}

struct ShoppingList{
    var items : [String :ShoppingItem] = [:];
    mutating func addItem(item: ShoppingItem){
        items[item.name] = item;
    }
    
    mutating func markAsPurchased(item: ShoppingItem){
        if var passedItem = items[item.name]{
            passedItem.isPurchased = true;
            items[item.name] = passedItem;
        } else{
            print(" Item not found in the List.");
        }
    }
    mutating func markAsPurchased(itemName: String){
        if var passedItem = items[itemName]{
            passedItem.isPurchased = true;
            items[itemName] = passedItem;
        } else{
            print(" Item not found in the List.");
        }
    }

    func listUnpurchasedItems() -> [ShoppingItem]{
        var unpurchasedItems : [ShoppingItem] = [];
        for item in items{
            if (item.value.isPurchased == false){
                unpurchasedItems.append(item.value);
            }
        }
        return unpurchasedItems;
    }
}

var myList = ShoppingList();

myList.addItem(item: ShoppingItem(name: "Milk", quantity: 2));
myList.addItem(item: ShoppingItem(name: "Bread", quantity: 1));
myList.addItem(item: ShoppingItem(name: "Eggs", quantity: 12));
myList.addItem(item: ShoppingItem(name: "Butter", quantity: 1));


myList.markAsPurchased(itemName: "Bread");

if let eggs = myList.items["Eggs"] {
    myList.markAsPurchased(item: eggs);
}

let unpurchasedItems = myList.listUnpurchasedItems();

print(" Unpurchased Items:")
for item in unpurchasedItems {
    print("  - \(item.name) (x\(item.quantity))")
}

print("\n Final Shopping List Status:")
for (name, item) in myList.items {
    let status = item.isPurchased ? "Purchased" : "Not Purchased"
    print("  - \(name) (x\(item.quantity)) -> \(status)")
}

