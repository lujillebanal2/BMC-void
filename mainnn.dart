import 'dart:io';

// Global list to store the student maps
List<Map<String, dynamic>> students = [];

void main() {
  String? menu;

  // Using a do-while loop as specified on the whiteboard so the menu keeps looping
  do {
    // Switch Statements & Menu Display
    print("\n<---STUDENT INFORMATION SYSTEM--->");
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
    
    // Switch statement to handle menu choices
    switch (menu) {
      case "0":
        print("Search Student");
        searchStudent();
        break;

      case "1":
        print("Add Student");
        addStudent();
        break;

      case "2":
        print("View Student List");
        viewStudents();
        break;

      case "3":
        print("Update Student Info");
        updateStudent();
        break;

      case "4":
        print("Delete Student Info");
        deleteStudent();
        break;

      case "5":
        print("Compute Class Average");
        computeClassAverage();
        break;

      case "6":
        print("Display Student with Highest/Lowest Grade");
        displayHighestLowestGrade();
        break;

      case "8":
        print("Exiting program...");
        break;
        
      default:
        print("Invalid Input");
    }
  } while (menu != "8"); // Keeps running until choice 8 is selected
}

// Method to add a student record
void addStudent() {
  // User Input (Console)
  stdout.write("Enter your name:");
  String? name = stdin.readLineSync();
  stdout.write("Enter your Age:");
  String? age = stdin.readLineSync();
  stdout.write("Enter your Course:");
  String? course = stdin.readLineSync();
  stdout.write("Your GWA: ");
  double gwa = double.parse (stdin.readLineSync()!);

  var status = gwa;
  
  // Control Flow (If Else) for GWA status
  if (gwa <=1.75){
      print("Excellent");
      status = "Excellent";
  } else if (gwa <=2.75){
      print("Very Good");
      status = "Very Good";
  } else if (gwa <=3.75){
      print("Passed");
      status = "Passed";
  } else{
      print("Probation");
      status = "Probation";
  }

  // Adding inputs into our List and Map structure
  students.add({
    "name": name,
    "age": age,
    "course": course,
    "gwa" : gwa,
    "status" : status
  });
  
  print ("Added Successful");
}

// Method to view all students using a for loop
void viewStudents() {
  if (students.isEmpty) {
    print("Wala pa pong student na naka-save.");
    return;
  }

  print("\n--- LIST OF STUDENTS ---");
  for (int i = 0; i < students.length; i++) {
    print("[$i] Name: ${students[i]['name']} | Age: ${students[i]['age']} | Course: ${students[i]['course']} | GWA: ${students[i]['gwa']} | Status: ${students[i]['status']}");
  }
}

// Method to search a student by name
void searchStudent() {
  if (students.isEmpty) {
    print("Empty pa po yung list.");
    return;
  }

  stdout.write("Enter name to search: ");
  String? searchKey = stdin.readLineSync();
  bool found = false;

  for (int i = 0; i < students.length; i++) {
    if (students[i]['name'].toLowerCase() == searchKey?.toLowerCase()) {
      print("Found! Name: ${students[i]['name']}, Age: ${students[i]['age']}, Course: ${students[i]['course']}, GWA: ${students[i]['gwa']}");
      found = true;
    }
  }

  if (!found) {
    print("Student not found.");
  }
}

// Method to update student information using index
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

    students[index] = {
      "name": name,
      "age": age,
      "course": course,
      "gwa": gwa,
      "status": status
    };
    print("Update Successful");
  } else {
    print("Invalid index po.");
  }
}

// Method to delete a student from the list
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

// Method to compute the class average GWA
void computeClassAverage() {
  if (students.isEmpty) {
    print("Walang students para ma-compute.");
    return;
  }

  double total = 0;
  for (int i = 0; i < students.length; i++) {
    total += students[i]['gwa'];
  }

  double average = total / students.length;
  print("Class Average GWA: ${average.toStringAsFixed(2)}");
}

// Method to find highest and lowest grade (lowest GWA is highest grade)
void displayHighestLowestGrade() {
  if (students.isEmpty) {
    print("Walang students pa.");
    return;
  }

  Map<String, dynamic> highest = students[0];
  Map<String, dynamic> lowest = students[0];

  for (int i = 1; i < students.length; i++) {
    if (students[i]['gwa'] < highest['gwa']) {
      highest = students[i];
    }
    if (students[i]['gwa'] > lowest['gwa']) {
      lowest = students[i];
    }
  }

  print("Highest Grade (Lowest GWA): ${highest['name']} (${highest['gwa']})");
  print("Lowest Grade (Highest GWA): ${lowest['name']} (${lowest['gwa']})");
}