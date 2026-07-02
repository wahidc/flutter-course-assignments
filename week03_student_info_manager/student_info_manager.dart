import 'dart:io';

// Abstract Class (Person)
abstract class Person {
  String _name; // Private Field
  int _age; // Private Field
  int _roll; // Private Field

  // Constructor
  Person(this._name, this._age, this._roll);

  // Getter function that returns the value of private fiels
  String get name => _name;
  int get age => _age;
  int get roll => _roll;

  // Method Calling
  void displayInfo();
}

// Student CLass
class Student extends Person {
  Student(String name, int age, int roll) : super(name, age, roll);

  void displayInfo() =>
    print("Name: $name | Age: $age | Roll: $roll"); // Arrow Function
}

void addStudent(List<Student> student) {
  stdout.write("Enter name: ");
  String name = stdin.readLineSync()!;

  stdout.write("Enter age : ");
  int age = int.parse(stdin.readLineSync()!);

  stdout.write("Enter roll: ");
  int roll = int.parse(stdin.readLineSync()!);

  student.add(Student(name, age, roll));

  print("Student ($name) added Successfully. \n");
}

void viewStudent(List<Student> student) {
  if (student.isEmpty) {
    print("No Student Found.");
    return;
  }
  print("\n Student List : \n");

  student.forEach((element) => element.displayInfo()); // Anonymous function
}

void searchStudent(List<Student> student) {
  stdout.write("Enter name to search : ");
  String searchName = stdin.readLineSync()!;
  bool found = false;

  for (var value in student) {
    if (value.name.toLowerCase() == searchName.toLowerCase()) {
      found = true;
      print("Student Found! Here is the Details : ");
      value.displayInfo();
    }
  }
  if (!found) {
    print("$searchName not found.");
  }
}

void deleteStudent(List<Student> student) {
  stdout.write("Enter name to Delete : ");
  String deleteName = stdin.readLineSync()!;
  student.removeWhere(
    (value) => value.name.toLowerCase() == deleteName.toLowerCase(),
  );
  print("Student deleted successfully.");
}

void main() {
  List<Student> student = [];

  while (true) {
    print("""
      ======== STUDENT INFORMATION MANAGER ========
      1. Add Student
      2. View Student
      3. Search Student
      4. Delete Student
      5. Exit
      """);

    stdout.write("Enter your choice : ");
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        addStudent(student);
        break;
      case 2:
        viewStudent(student);
        break;
      case 3:
        searchStudent(student);
        break;
      case 4:
        deleteStudent(student);
        break;
      case 5:
        print("Program Terminated.");
        return;
      default:
        print("Invalid Choice!");
    }
  }
}
