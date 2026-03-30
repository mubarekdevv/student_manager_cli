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

