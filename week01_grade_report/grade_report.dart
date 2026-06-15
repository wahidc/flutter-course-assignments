void main() {
  // Assignment: Student Report Generator
  String studentName = "Rahim";
  int marks = 75;
  String grade = "";
  String description = "";

  // Using if-else to determine grade
  if (marks <= 100 && marks >= 80) {
    grade = 'A';
  } else if (marks <= 79 && marks >= 70) {
    grade = 'B';
  } else if (marks <= 69 && marks >= 60) {
    grade = 'C';
  } else if (marks < 60 && marks >= 0) {
    grade = 'F';
  } else {
    print("Invalid");
  }

  // Using switch-case to print grade description
  switch (grade) {
    case 'A':
      description = 'Excellent';
      break;
    case 'B':
      description = 'Good Job';
      break;
    case 'C':
      description = 'Keep Improving';
      break;
    case 'F':
      description = 'Need more practice';
      break;
    default:
      print('Invalid Grade');
  }

  // Printing Grade Report
  print('Student Report \n');
  print('Name: $studentName');
  print('Marks: $marks');
  print('Grade: $grade \n');
  print(description);

}
