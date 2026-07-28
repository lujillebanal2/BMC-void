import 'dart:io';
List<Map<String,dynamic>>students=[];
void main(){
  print("---------------------------------");
  print("|                               |");
  print("|  STUDENT INFORMATION  SYSYEM  |");
  print("|                               |");
  print("---------------------------------");
  print("   0. SEARCH STUDENT");
  print("   1. ADD STUDENT");
  print("   2. VIEW STUDENT INFO");
  print("   3. UPDATE STUDENT INFO");
  print("   4. DELETE STUDENT INFO");

  stdout.write("STUDENT INFO: ");
  String? menu = stdin.readLineSync();
  switch(menu){
  case "0":
    print("SEARCH STUDENT");
    break;

  case "1":
    print("ADD STUDENT");
    addStudent();
    break;

  case "2":
    print("VIEW STUDENT INFO");
    break;

  case "3":
    print("UPDATE STUDENT INFO");
    break;

  case "4":
    print("DELETE STUDENT INFO");
    break;

  default:
    print("CHOOSE AGAIN");
  }
}

void addStudent(){

stdout.write("Enter your name: ");
String? name = stdin.readLineSync();

stdout.write("Enter your age: ");
int age = int.parse(stdin.readLineSync()!);

stdout.write("Enter your couse: ");
String? course = stdin.readLineSync();

stdout.write("Enter your GWA: ");
double gwa = double.parse(stdin.readLineSync()!);


// print("");
// print("-----STUDENT PROFILE-----");
// print("Hello $name");
// print("Age: $age");
// print("Couse: $course");
// print("GWA: $gwa");


  if (gwa <=1.75){
    print("You are Excellent");
    }
  else if (gwa <=2.75) {
    print("You are Verygood");
    }
  else if (gwa <=3.0) {
    print("You are Passed");
    }
  else{
    print("Probation");
  }

  students.add({
    "name" : name,
    "age" : age,
    "course" : course,
    "gwa" : gwa
  });
  print("Added successfully");
}