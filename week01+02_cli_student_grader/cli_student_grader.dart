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
        addBonus(studentList);
        break;
      case 4:
        addComment(studentList);
        break;
      case 5:
        viewAllStudent(studentList);
        break;
      case 6:
        viewReportCard(studentList);
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

double avgCalculator(studentList, teacherPick) {
  int sum = 0;
  for (int element in studentList[teacherPick - 1]["score"]) {
    sum += element;
  }
  double rawAvg = double.parse(
    (sum / studentList[teacherPick - 1]["score"].length).toStringAsFixed(2),
  );
  double finalAvg = rawAvg + (studentList[teacherPick - 1]["bonus"] ?? 0);

  return finalAvg;
}

String gradeCalculator(studentList, teacherPick) {
  String grade = "";
  double avg = avgCalculator(studentList, teacherPick);

  switch (avg) {
    case double n when n >= 90 && n <= 100:
      grade = "A";
    case double n when n >= 80 && n <= 89:
      grade = "B";
    case double n when n >= 70 && n <= 79:
      grade = "C";
    case double n when n >= 60 && n <= 69:
      grade = "D";
    case double n when n >= 0 && n <= 59:
      grade = "F";
    default:
      grade = "Unknown";
  }
  return grade;
}

String sufixGenerator(int prefixLength) {
  String suffix = "";
  for (int i = 0; i < 48 - prefixLength; i++) {
    suffix += " ";
  }
  return suffix;
}

void viewReportCard(studentList) {
  viewAllStudent(studentList);
  stdout.write("\n Pick a Student to view Report Card : ");
  int teacherPick = int.parse(stdin.readLineSync()!);

  double avg = avgCalculator(studentList, teacherPick);
  String grade = gradeCalculator(studentList, teacherPick);

  var namePrefix = "║   Name : ${studentList[teacherPick - 1]["name"]}";
  var scorePrefix = "║   Score : ${studentList[teacherPick - 1]["score"]}";
  var bonusPrefix =
      "║   Bonus : +${studentList[teacherPick - 1]["bonus"] ?? 0}";
  var averagePrefix = "║   Average : $avg";
  var gradePrefix = "║   Grade : $grade";
  var commentPrefix =
      "║   Comment : ${studentList[teacherPick - 1]["comment"]}";

  var nameSuffix = sufixGenerator(namePrefix.length);
  var scoreSuffix = sufixGenerator(scorePrefix.length);
  var bonusSuffix = sufixGenerator(bonusPrefix.length);
  var averageSuffix = sufixGenerator(averagePrefix.length);
  var gradeSuffix = sufixGenerator(gradePrefix.length);
  var commentSuffix = sufixGenerator(commentPrefix.length);
  //var Suffix = sufixGenerator(Prefix.length);

  print("╔═════════════════════════════════════════════════╗");
  print("║                 REPORT CARD                     ║");
  print("╠═════════════════════════════════════════════════║");
  print("$namePrefix $nameSuffix ║");
  print("$scorePrefix $scoreSuffix ║");
  print("$bonusPrefix $bonusSuffix ║");
  print("$averagePrefix $averageSuffix ║");
  print("$gradePrefix $gradeSuffix ║");
  print("$commentPrefix $commentSuffix ║");
  print("╚═════════════════════════════════════════════════╝");
  print("\n");
}



















