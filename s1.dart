class Student {
  String studentId;
  String name;
  String email;

  Student({
    required this.studentId,
    required this.name,
    required this.email,
  });

  void displayStudent() {
    print('Student Information');
    print('------------------------------');
    print('ID: $studentId');
    print('Name: $name');
    print('Email: $email');
  }

  void enrollCourse(Course course) {
    print('Enrolled Course');
    print('------------------------------');
    course.displayCourse();
  }
}

class Course {
  String courseCode;
  String courseName;
  int units;

  Course({
    required this.courseCode,
    required this.courseName,
    required this.units,
  });

  void displayCourse() {
    print('Code: $courseCode');
    print('Course: $courseName');
    print('Units: $units');
  }
}

class MobileApp {
  String appName;
  String version;

  MobileApp({
    required this.appName,
    required this.version,
  });

  void displayAppInfo() {
    print('==============================');
    print('STUDENT MOBILE APP');
    print('==============================');
    print('Application: $appName');
    print('Version: $version');
    print('');
  }
}
      
void main() {
  MobileApp app = MobileApp(
    appName: 'Student Portal',
    version: '1.0',
  );

  Student student = Student(
    studentId: '2026-001',
    name: 'Juan Dela Cruz',
    email: 'juan@email.com',
  );

  Course course = Course(
    courseCode: 'IT101',
    courseName: 'Basic Mobile Development',
    units: 3,
  );

  app.displayAppInfo();
  student.displayStudent();
  print('');
  student.enrollCourse(course);
}