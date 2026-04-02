import 'dart:io';

class Student {
  String? name;
  int? age;
  StudentType type;

  Student(this.name, this.age) 
  : type = age! >= 18 ? StudentType.adult : StudentType.child;
}


List<Student> students = [];

Future<void> startApp() async{
  await loadStudents();
  print("App started!");
  while (true) {
    //print("----------------------");
    print("\nEnter 1. to Add Student");
    print("Enter 2. to View Students");
    print("Enter 3. to Delete Student");
    print("Enter 4. to Exit");
    String choice = stdin.readLineSync()!;

    if (choice == '1') {
      try {
        stdout.write("Enter the name of the Student: ");
        String name = stdin.readLineSync()!;
        stdout.write("Enter the age of the student: ");
        int age = int.parse(stdin.readLineSync()!);

        await addStudent(name, age);
      } catch (e) {
        print("❌ Invalid input! Please enter a number for the age.");
        print("The error was: $e");
      }

    } else if (choice == '2') {
      viewStudents();
    } else if (choice == '3') {
      stdout.write("Enter the name of Student to be deleted: ");
      String name = stdin.readLineSync()!;

      deleteStudent(name);
    } else if (choice == '4') {
      // await Future.delayed(Duration(seconds: 2));

      stdout.write("Exiting");
      for (int i = 0; i < 5; i++) {
        await Future.delayed(Duration(milliseconds: 500));
        stdout.write(".");
      }
      break;
    } else {
      print("Invalid choice!");
    }
  }
}

// add student function
Future<void> addStudent(String name, int age) async {
  stdout.write("Saving to cloud...");
  await Future.delayed(Duration(seconds: 1));
  students.add(
      Student(name, age)); // the student is cretaed and also added to the list
  print("\nStudent $name is added!");
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

//for instance if we want to filter adult students over 18. Here is how you would print only the students who are older than 20
void viewAdultStudents() {
  // 1. Create a filtered version of the list
  var adults = students.where((s) => s.age! > 18);

  // 2. Loop through ONLY those students
  for (var student in adults) {
    print("Adult student Found - Name: ${student.name}, Age: ${student.age}");
  }
}

//Delete Student function
void deleteStudent(String name) {
  if (students.any((student) => student.name == name)) {
    students.removeWhere((studdent) => studdent.name == name);
    print("$name is deleted!");
  } else {
    print("Error: $name is not in the students list!");
  }
}

//find student function for searcing student
void findStudent(){
  stdout.write("Enter the name to search for: ");
  String target = stdin.readLineSync()!;
  var results = students.where((s) => s.name!.toLowerCase().contains(target.toLowerCase()));
  if (results.isEmpty) {
    print("No sudent found with the name $target.");
  } else{
    print("\n Found ${results.length} match(es):");
    for (var s in results){
      print("Name: ${s.name}, Age: ${s.age}");
    }
  }
}
enum StudentType {
  child,
  adult,
}

Future<void> loadStudents() async{
  Duration twoSeconds = Duration(seconds: 2);
  await Future.delayed(twoSeconds);
  print("✅ Students data synchronized!");
}

