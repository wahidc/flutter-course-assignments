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
        addStudent(studentList, subject);
        break;
      case 2:
        recordScore(studentList, subject);
        break;
      case 3:
        //addBonus(studentList);
        break;
      case 4:
        //addComment(studentList);
        break;
      case 5:
        viewAllStudent(studentList);
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

void addStudent(studentList, subject) {
  stdout.write("Enter Student Name :");
  String? name = stdin.readLineSync();
  studentList.add({
    "name": name,
    "score": [],
    "subject": subject,
    "bonus": null,
    "comment": "NO COMMENT PROVIDED.",
  });
  stdout.write("The student named ${name}, added sucessfully \n\n");
}

void recordScore(studentList, subject) {
  viewAllStudent(studentList);
  stdout.write("\n Pick a Student to Record Score: ");
  int teacherPick = int.parse(stdin.readLineSync()!);

  while (studentList[teacherPick - 1]["score"].length <
      subject.toList().length) {
    stdout.write(
      "Enter score for ${subject.toList()[studentList[teacherPick - 1]["score"].length]} : ",
    );
    int score = int.parse(stdin.readLineSync()!);

    if (score <= 100 && score >= 0) {
      studentList[teacherPick - 1]["score"].add(score);
    } else {
      print("Mark out of Range (0-100), Try Again !");
    }
  }

  print(
    "Score recorded sucessfully for ${studentList[teacherPick - 1]["name"]}",
  );
}

void viewAllStudent(studentList) {
  stdout.write("Here is the student list : \n");
  for (int i = 0; i < studentList.length; i++) {
    if (studentList[i]["bonus"] != null) {
      print(
        "${i + 1}. name: ${studentList[i]["name"]}, score: ${studentList[i]["score"]}, ⭐Has Bonus, ${studentList[i]["comment"]}",
      );
    } else {
      print(
        "${i + 1}. name: ${studentList[i]["name"]}, score: ${studentList[i]["score"]}, comment: ${studentList[i]["comment"]}",
      );
    }
  }
}

void addBonus(studentList) {
  viewAllStudent(studentList);
  stdout.write("Pick a student to add bonus points (0-10) :");
  int teacherPick = int.parse(stdin.readLineSync()!);
  stdout.write(
    "Enter bonus points for ${studentList[teacherPick - 1]["name"]} :",
  );
  var bonus = int.parse(stdin.readLineSync()!);

  if (studentList[teacherPick - 1]["bonus"] == null) {
    if (bonus >= 1 && bonus <= 10) {
      studentList[teacherPick - 1]["bonus"] = bonus;
      stdout.write(
        "$bonus points given successfully as bonus to ${studentList[teacherPick - 1]["name"]}. \n",
      );
    } else {
      stdout.write("Invalid Bonus Score. \n");
    }
  } else {
    stdout.write(
      "Bonus point allready given to ${studentList[teacherPick - 1]["name"]} \n",
    );
  }
}

void addComment(studentList) {
  viewAllStudent(studentList);
  stdout.write("Pick a student to add comment : ");
  int teacherPick = int.parse(stdin.readLineSync()!);

  stdout.write("Add comment for ${studentList[teacherPick - 1]["name"]} : ");
  String? comment = stdin.readLineSync()?.toUpperCase();
  studentList[teacherPick - 1]["comment"] = comment;
}





















