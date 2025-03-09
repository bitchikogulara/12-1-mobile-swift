import UIKit

//Task 1: Area Calculator

/*
Objective: Practice structs, functions and protocols.

Create a protocol Shape with a function area() -> Double.
Create the following structs that conform to the Shape protocol:

Rectangle with properties width and height.
Circle with property radius.
Implement the area function for both structs.

 Extra Task: Add an extension to the Shape protocol to include a description property that returns the name of the shape.
Extra Task: Create a list of Shape-s and calcualte their total area.

Example:

let rectangle = Rectangle(width: 5, height: 10)
print(rectangle.area()) // Output: 50.0
print(rectangle.description) // Output: Rectangle

let circle = Circle(radius: 7)
print(circle.area()) // Output: ~153.94
print(circle.description) // Output: Circle
*/

print("Task N1:\n")

protocol Shape{
    func area() -> Double;
    var description: String {get};
}

extension Shape{
    var description: String{
        return String(describing: Self.self)
    }
}

struct Rectangle : Shape{
    var height : Double;
    var width : Double;
    
    func area() -> Double {
        return height * width;
    }
}

struct Circle : Shape{
    var radius : Double;
    
    func area() -> Double {
        return radius * radius * 3.14;
    }
}


var shapes : [Shape] = [
    Rectangle(height: 10,width : 20),
    Rectangle(height: 9,width : 11),
    Rectangle(height: 27,width : 30),
    Circle(radius: 7),
    Circle(radius: 12)
]

var totalArea = 0.0;

for shape in shapes{
    totalArea += shape.area();
    print(" Shape: \(shape.description), Area: \(String(format: "%.2f",shape.area()))");
}

print("\n Total area: \(String(format: "%.2f",totalArea))");


//Task 2: Person and Employee

/*
Objective: Practice classes and inheritance.

Create a base class Person with the following properties:

name: String
age: Int
Add a method greet() that prints: "Hi, I'm [name] and I'm [age] years old."

Create a subclass Employee that inherits from Person and adds:

jobTitle: String
Override the greet() method to include the job title: "Hi, I'm [name], a [jobTitle], and I'm [age] years old."

Extra Task: Add an initializer to Employee that calls the base class designated initializer.

Example:

let person = Person(name: "Alice", age: 25)
person.greet() // Output: Hi, I'm Alice and I'm 25 years old.

let employee = Employee(name: "Bob", age: 30, jobTitle: "Engineer")
employee.greet() // Output: Hi, I'm Bob, a Engineer, and I'm 30 years old.
*/

print("\nTask N2:\n\n")

class Person{
    var name: String;
    var age: Int;
    
    init (name: String, age: Int){
        self.name = name;
        self.age = age;
    }
    
    func greet(){
        print(" Hi, I'm \(name) and I'm \(age) years old.");
    }
}

class Employee : Person{
    var jobTitle: String;
    init(name: String, age: Int, jobTitle: String){
        self.jobTitle = jobTitle;
        super.init(name: name, age: age);
    }
    
    override func greet(){
        print(" Hi, I'm \(name), a \(jobTitle), and I'm \(age) years old.");
    }
}

var person : Person = Person(name: "Gela", age:  27);
var employee : Person = Employee(name: "Gia", age: 22, jobTitle: "Engineer");

person.greet();
employee.greet();


//Task 3: Power Consumption

/*
Objective: Practice protocols and extensions.

Create a protocol Appliance with:

A property powerUsage: Double (in watts).
A function calculateMonthlyConsumption(hours: Double) -> Double.
Create two structs, WashingMachine and Refrigerator, conforming to Appliance protocol.

WashingMachine should have a power usage of 500 watts.
Refrigerator should have a power usage of 100 watts.
Add an extension to the Appliance protocol to provide a default implementation of calculateMonthlyConsumption(hours:).

Extra Task: Add a computed property description in the extension that returns a string: "This appliance uses [powerUsage] watts each month."

Extra Task: Update the implementation so it includes consumption per hour. Each appliance should have average number of hours per each month.

Example:

let washingMachine = WashingMachine()
print(washingMachine.description) // Output: This appliance uses 500 watts.
print(washingMachine.calculateMonthlyConsumption(hours: 30)) // Output: 15,000 watts

let refrigerator = Refrigerator()
print(refrigerator.description) // Output: This appliance uses 100 watts.
print(refrigerator.calculateMonthlyConsumption(hours: 720)) // Output: 72,000 watts
*/

protocol Appliance{
    var powerUsage : Double {get};
    var description : String {get};
    func calculateMonthlyConsumption(hours: Double) -> Double;
}

extension Appliance{
    func calculateMonthlyConsumption(hours: Double) -> Double{
        return hours * powerUsage;
    }
    
    var description : String {
        return "This appliance uses \(powerUsage) watts";
    }
}

struct WashingMachine : Appliance{
    var powerUsage: Double = 500;
}

struct Refrigerator : Appliance{
    var powerUsage: Double = 100;
}
// !! the term power usage is not defined correctly, in some terms it reffers
// !! to monthly power consumption and in others - hourly, so I'm not gonna move
// !! on with Extra Task N2.

//Task 4: Library

/*
Objective: Combine structs, protocols, and functions.

Create a struct Book with properties:

title: String
author: String
Create a protocol Borrowable with:

A function borrow()
A function returnBook()
Create a class Library with:

A property books: [Book].
Functions addBook(_:) and removeBook(_:).
Conform Library to the Borrowable protocol:

borrow() should remove a book from the collection.
returnBook() should add the book back.
Extra Task: Add an extension to Library to include a method listBooks() that prints all available books.

Example:

var library = Library()
library.addBook(Book(title: "1984", author: "George Orwell"))
library.addBook(Book(title: "To Kill a Mockingbird", author: "Harper Lee"))

library.listBooks()
// Output:
// 1. 1984 by George Orwell
// 2. To Kill a Mockingbird by Harper Lee

library.borrow()
// Output: Borrowed 1984
library.listBooks()
// Output: 1. To Kill a Mockingbird by Harper Lee
*/

print("\nTask N4:\n\n")

struct Book{
    var title : String;
    var author : String;
}

protocol Borrowable{
    func borrow() -> Book?;
    func returnBook(_ book: Book);
}



class Library : Borrowable{
    var books : [Book] = [];
    
    func addBook(_ book: Book){
        books.append(book);
    }
    
    func removeBook(_ title: String){
        if let index = books.firstIndex(where: { $0.title == title }) {
            books.remove(at: index);
        } else {
            print(" Book '\(title)' not found in the library.");
        }
    }
    
    func borrow() -> Book?{
        guard !books.isEmpty else {
            print(" No books available to borrow.");
            return nil;
        }
        let borrowedBook = books.removeFirst();
        print(" Borrowed: \(borrowedBook.title) by \(borrowedBook.author)");
        return borrowedBook;

    }
    
    func returnBook(_ book : Book) {
        addBook(book);
        print(" Returned: \(book.title) by \(book.author)")
    }
}

extension Library {
    func listBooks() {
        if books.isEmpty {
            print(" No books available in the library.");
        } else {
            for (index, book) in books.enumerated() {
                print(" \(index + 1). \(book.title) by \(book.author)");
            }
        }
    }
}

var library = Library();
library.addBook(Book(title: "1984", author: "George Orwell"));
library.addBook(Book(title: "To Kill a Mockingbird", author: "Harper Lee"));

library.listBooks();
print();
library.borrow();
print();
library.listBooks();


//Task 5: Vehicles

/*
Objective: Practice classes, inheritance, and extensions.

Create a base class Vehicle with properties:

make: String
model: String
fuelEfficiency: Double (in km per liter)
Add a method calculateFuelNeeded(for distance: Double) -> Double.

Create a subclass ElectricCar with an additional property:

batteryCapacity: Double (in kWh)
Override calculateFuelNeeded(for:) to calculate the energy needed in kWh based on battery efficiency (e.g., 5 km per kWh).

Extra Task: Add an extension to Vehicle to include a method description() that prints the make and model.

Example:

let car = Vehicle(make: "Toyota", model: "Corolla", fuelEfficiency: 15)
print(car.calculateFuelNeeded(for: 150)) // Output: 10.0 liters

let tesla = ElectricCar(make: "Tesla", model: "Model 3", batteryCapacity: 50)
print(tesla.calculateFuelNeeded(for: 150)) // Output: 30.0 kWh
*/

print("\nTask N5:\n\n")

class Vehicle{
    var make: String;
    var model: String;
    var fuelEfficiency: Double; // km per liter
    
    init(make: String, model: String, fuelEfficiency: Double){
        self.make = make;
        self.model = model;
        self.fuelEfficiency = fuelEfficiency;
    }
    
    func calculateFuelNeeded(for distance: Double) -> Double{
        return distance / fuelEfficiency;
    }
}

class ElectricCar: Vehicle{
    var batteryCapacity: Double; // kWh
    
    init(make: String, model: String, batteryCapacity: Double){
        self.batteryCapacity = batteryCapacity;
        super.init(make: make, model: model, fuelEfficiency: 5.0); // 5 km per kWh
    }
    
    override func calculateFuelNeeded(for distance: Double) -> Double{
        return distance / fuelEfficiency;
    }
}

extension Vehicle{
    func description() -> String{
        return " Make: \(make), Model: \(model)";
    }
}

let car = Vehicle(make: "Toyota", model: "Corolla", fuelEfficiency: 15);
print(car.description());
print(" Fuel needed for 150 km: \(String(format: "%.2f", car.calculateFuelNeeded(for: 150))) liters\n");

let tesla = ElectricCar(make: "Tesla", model: "Model 3", batteryCapacity: 50);
print(tesla.description());
print(" Energy needed for 150 km: \(String(format: "%.2f", tesla.calculateFuelNeeded(for: 150))) kWh\n");
