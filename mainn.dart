import 'dart:io';

class Student {
  String name;
  String age;
  String course;
  double gwa;
  String status;

  Student(this.name, this.age, this.course, this.gwa, this.status);
}

class StudentSystem {
  List<Student> students = [];

  void addStudent() {
    stdout.write("Enter your name: ");
    String? name = stdin.readLineSync();
    stdout.write("Enter your Age: ");
    String? age = stdin.readLineSync();
    stdout.write("Enter your Course: ");
    String? course = stdin.readLineSync();
    stdout.write("Your GWA: ");
    double gwa = double.parse(stdin.readLineSync()!);

    String status = "";
    if (gwa <= 1.75) {
      print("Excellent");
      status = "Excellent";
    } else if (gwa <= 2.75) {
      print("Very Good");
      status = "Very Good";
    } else if (gwa <= 3.75) {
      print("Passed");
      status = "Passed";
    } else {
      print("Probation");
      status = "Probation";
    }

    students.add(Student(name ?? '', age ?? '', course ?? '', gwa, status));
    print("Added Successful");
  }

  void viewStudents() {
    if (students.isEmpty) {
      print("Wala pa pong student na naka-save.");
      return;
    }

    print("\n--- LIST OF STUDENTS ---");
    for (int i = 0; i < students.length; i++) {
      print("[$i] Name: ${students[i].name} | Age: ${students[i].age} | Course: ${students[i].course} | GWA: ${students[i].gwa} | Status: ${students[i].status}");
    }
  }

  void searchStudent() {
    if (students.isEmpty) {
      print("Empty pa po yung list.");
      return;
    }

    stdout.write("Enter name to search: ");
    String? searchKey = stdin.readLineSync();
    bool found = false;

    for (int i = 0; i < students.length; i++) {
      if (students[i].name.toLowerCase() == searchKey?.toLowerCase()) {
        print("Found! Name: ${students[i].name}, Age: ${students[i].age}, Course: ${students[i].course}, GWA: ${students[i].gwa}, Status: ${students[i].status}");
        found = true;
      }
    }

    if (!found) {
      print("Student not found.");
    }
  }

  void updateStudent() {
    viewStudents();
    if (students.isEmpty) return;

    stdout.write("Enter index to update: ");
    int index = int.parse(stdin.readLineSync()!);

    if (index >= 0 && index < students.length) {
      stdout.write("Enter new name: ");
      String? name = stdin.readLineSync();
      stdout.write("Enter new Age: ");
      String? age = stdin.readLineSync();
      stdout.write("Enter new Course: ");
      String? course = stdin.readLineSync();
      stdout.write("New GWA: ");
      double gwa = double.parse(stdin.readLineSync()!);

      String status = "";
      if (gwa <= 1.75) {
        status = "Excellent";
      } else if (gwa <= 2.75) {
        status = "Very Good";
      } else if (gwa <= 3.75) {
        status = "Passed";
      } else {
        status = "Probation";
      }

      students[index] = Student(name ?? '', age ?? '', course ?? '', gwa, status);
      print("Update Successful");
    } else {
      print("Invalid index po.");
    }
  }

  void deleteStudent() {
    viewStudents();
    if (students.isEmpty) return;

    stdout.write("Enter index to delete: ");
    int index = int.parse(stdin.readLineSync()!);

    if (index >= 0 && index < students.length) {
      students.removeAt(index);
      print("Delete Successful");
    } else {
      print("Invalid index po.");
    }
  }

  void computeClassAverage() {
    if (students.isEmpty) {
      print("Walang students para ma-compute.");
      return;
    }

    double total = 0;
    for (int i = 0; i < students.length; i++) {
      total += students[i].gwa;
    }

    double average = total / students.length;
    print("Class Average GWA: ${average.toStringAsFixed(2)}");
  }

  void displayHighestLowestGrade() {
    if (students.isEmpty) {
      print("Walang students pa.");
      return;
    }

    Student highest = students[0];
    Student lowest = students[0];

    for (int i = 1; i < students.length; i++) {
      if (students[i].gwa < highest.gwa) {
        highest = students[i];
      }
      if (students[i].gwa > lowest.gwa) {
        lowest = students[i];
      }
    }

    print("Highest Grade (Lowest GWA): ${highest.name} (${highest.gwa})");
    print("Lowest Grade (Highest GWA): ${lowest.name} (${lowest.gwa})");
  }
}

void main() {
  StudentSystem system = StudentSystem();
  String? menu;

  do {
    print("\n<---STUDENT INFORMATION SYSTEM (OOP)--->");
    print("0. Search Student");
    print("1. Add Student");
    print("2. View Student List");
    print("3. Update Student Info");
    print("4. Delete Student Info");
    print("5. Compute Class Average");
    print("6. Display Student with Highest/Lowest Grade");
    print("8. Exit");
    stdout.write("Enter your choice: ");

    menu = stdin.readLineSync();
    
    switch (menu) {
      case "0":
        print("Search Student");
        system.searchStudent();
        break;

      case "1":
        print("Add Student");
        system.addStudent();
        break;

      case "2":
        print("View Student List");
        system.viewStudents();
        break;

      case "3":
        print("Update Student Info");
        system.updateStudent();
        break;

      case "4":
        print("Delete Student Info");
        system.deleteStudent();
        break;

      case "5":
        print("Compute Class Average");
        system.computeClassAverage();
        break;

      case "6":
        print("Display Student with Highest/Lowest Grade");
        system.displayHighestLowestGrade();
        break;

      case "8":
        print("Exiting program...");
        break;
        
      default:
        print("Invalid Input");
    }
  } while (menu != "8");
}