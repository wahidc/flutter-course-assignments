void main() {
  bool isNewStudent = true;

  // Created a List of student names and print it.
  List<String> studentNames = [
    "Tonmoy",
    "Sakib",
    "Rahat",
    "Nafis",
    if (isNewStudent) "Rahim", // Used 'Collection if'
  ];
  print("Students: \n ${studentNames} \n");

  // Created a Set of enrolled courses and print it.
  Set<String> enrolledCourses = {"Flutter", "Dart", "Git"};
  print("Courses: \n ${enrolledCourses} \n");

  // Created a Map where 'Key = Student Name' and 'Value = Student Age' and print it.
  Map<String, int> studentAge = {
    "Tonmoy": 22,
    "Sakib": 23,
    "Rahat": 21,
    "Nafis": 24,
    "Rahim": 20,
  };
  print("Student Ages:");
  for (var entry in studentAge.entries) {
    print("${entry.key} -> ${entry.value}");
  }

  // Used the Spread operator to combine 2 lists.
  List<String> list1 = ["Vermithor", "Vhagar", "Moondancer"];
  List<String> list2 = ["Sheepstealer", "Vermax", ...list1];
  
}
