import 'dart:io';

class Student {
  String? name;
  int? age;

  Student(this.name, this.age);
}

List<Student> students = [];

void startApp() {
  print("App started!");
}

// add student function
void addStudent(String name, int age) {
  students.add(
      Student(name, age)); // the student is cretaed and also added to the list
  print("Student is added!");
}

// View Students function
void viewStudents() {
  if (students.isEmpty) {
    print("No students found.");
    return;
  }
  // for(int i = 0; i<students.length; i++){
  //   print("Name: ${students[i].name}, Age: ${students[i].age}");
  // }
  for (Student student in students) {
    print("Name: ${student.name}, Age: ${student.age}");
  }
}

//for instance if we want to filter adult students over 20. Here is how you would print only the students who are older than 20
void viewAdultStudents() {
  // 1. Create a filtered version of the list
  var adults = students.where((s) => s.age! > 20);

  // 2. Loop through ONLY those students
  for (var student in adults) {
    print("Adult student Found - Name: ${student.name}, Age: ${student.age}");
  }
}


