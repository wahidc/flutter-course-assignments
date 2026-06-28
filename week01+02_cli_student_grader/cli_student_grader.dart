import 'dart:io';

void main() {
  const appTitle = "Student Grader v6.0";
  int choise;
  List<Map<String, dynamic>> studentList = [];
  Set<String> subject = {"English", "Bangla", "Mathematics"};

  do {
    print("""
  ╔═════════════════════════════════════════════════╗
  ║              $appTitle                ║ 
  ╠═════════════════════════════════════════════════║
  ║    1. Add Student                               ║
  ║    2. Record Score                              ║
  ║    3. Add Bonus Points                          ║ 
  ║    4. Add Comment                               ║
  ║    5. View All Students                         ║
  ║    6. View Report Card                          ║
  ║    7. Class Summary                             ║
  ║    8. Exit                                      ║
  ╚═════════════════════════════════════════════════╝
  """);

    stdout.write("Enter an option: ");
    choise = int.parse(stdin.readLineSync()!);
    

    switch (choise) {
      case 1:
        //addStudent(studentList, subject);
        break;
      case 2:
        //recordScore(studentList, subject);
        break;
      case 3:
        //addBonus(studentList);
        break;
      case 4:
        //addComment(studentList);
        break;
      case 5:
        //viewAllStudent(studentList);
        break;
      case 6:
        //viewReportCard(studentList);
        break;
      case 7:
        //classSummary(studentList);
        break;
      default:
        //print("Program Terminated.");
        break;
    }
  } while (choise != 8);
}