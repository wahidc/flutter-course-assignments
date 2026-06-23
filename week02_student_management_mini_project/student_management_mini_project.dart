void main() {
  bool isNewStudent = true;

  // Created a List of student names and print it.
  List<String> students_name = [
    "Tonmoy",
    "Sakib",
    "Rahat",
    "Nafis",
    if (isNewStudent) "Rahim", // Used 'Collection if'
  ];
  print("Students: \n ${students_name} \n");


  // Created a Set of enrolled courses and print it.
  Set<String> enrolled_courses = {"Flutter", "Dart", "Git"};
  print("Courses: \n ${enrolled_courses} \n");
  

  // Created a Map where 'Key = Student Name' and 'Value = Student Age' and print it.
  Map<String, int> student_age = {
    "Tonmoy": 22,
    "Sakib": 23,
    "Rahat": 21,
    "Nafis": 24,
    "Rahim": 20,
  };
  print("Student Ages:");
  for (var entry in student_age.entries) {
    print("${entry.key} -> ${entry.value}");
  }
}
