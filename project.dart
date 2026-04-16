import 'dart:io';

void main() {
  // 3. const - App title
  const String appTitle = "STUDENT GRADER v1.0";
  
  // 2. final - Available subjects (at least 4)
  final Set<String> availableSubjects = {"Math", "English", "Science", "History"};

  // 1. var - Mutable state
  var students = <Map<String, dynamic>>[];
  var isRunning = true;

  // 18. do-while loop
  do {
    // 12. Multi-line strings & 11. String interpolation
    print('''
\n===== $appTitle =====
1. Add Student
2. Record Score
3. Add Bonus Points
4. Add Comment
5. View All Students
6. View Report Card
7. Class Summary
8. Exit
Choose an option:''');

    var input = stdin.readLineSync() ?? "";

    // 14. switch statement for menu routing
    switch (input) {
      case '1': // Add Student
        print("Enter student name:");
        var name = stdin.readLineSync() ?? "Unknown";
        // 21. Map, 24. Spread operator, 4. Nullable fields
        var newStudent = <String, dynamic>{
          "name": name,
          "scores": <int>[],
          "subjects": {...availableSubjects}, // Spread operator
          "bonus": null,
          "comment": null
        };
        students.add(newStudent);
        print("Student '$name' added successfully!");
        break;

      case '2': // Record Score
        if (students.isEmpty) {
          print("No students found. Add one first.");
          break;
        }
        // 15. Indexed for loop
        for (int i = 0; i < students.length; i++) {
          print("$i. ${students[i]["name"]}");
        }
        print("Select student index:");
        int idx = int.tryParse(stdin.readLineSync() ?? "") ?? -1;
        
        if (idx < 0 || idx >= students.length) {
          print("Invalid index selection.");
          break;
        }

        print("Enter score (0-100):");
        int score = -1;
        // 17. while loop for validation & 9. Relational operators
        while (score < 0 || score > 100) {
          score = int.tryParse(stdin.readLineSync() ?? "") ?? -1;
          if (score < 0 || score > 100) print("Invalid! Must be 0-100:");
        }
        // 19. List .add()
        students[idx]["scores"].add(score);
        break;

      case '3': // Add Bonus Points
        print("Enter student index:");
        int idxB = int.tryParse(stdin.readLineSync() ?? "") ?? -1;
        if (idxB < 0 || idxB >= students.length) break;

        print("Enter bonus (1-10):");
        int bonusValue = int.tryParse(stdin.readLineSync() ?? "") ?? 0;
        
        // 6. ??= null-aware assignment
        if (students[idxB]["bonus"] == null) {
          students[idxB]["bonus"] ??= bonusValue;
          print("Bonus assigned.");
        } else {
          // 13. if/else
          print("Bonus was already set to ${students[idxB]["bonus"]}");
        }
        break;

      case '4': // Add Comment
        print("Enter student index:");
        int idxC = int.tryParse(stdin.readLineSync() ?? "") ?? -1;
        if (idxC < 0 || idxC >= students.length) break;
        print("Enter comment:");
        students[idxC]["comment"] = stdin.readLineSync();
        break;

      case '5': // View All Students
        // 16. for-in loop
        for (var s in students) {
          // 22. Collection if
          var tags = [
            s["name"],
            "${s["scores"].length} scores",
            if (s["bonus"] != null) "⭐ Has Bonus",
          ];
          print(tags.join(" | "));
        }
        break;

      case '6': // View Report Card
        print("Enter student index:");
        int idxR = int.tryParse(stdin.readLineSync() ?? "") ?? -1;
        if (idxR < 0 || idxR >= students.length) break;
        var s = students[idxR];
        
        // 8. Arithmetic & 15. for loop
        double totalSum = 0;
        for (var sc in s["scores"]) { totalSum += sc; }
        
        double rawAvg = s["scores"].isEmpty ? 0 : totalSum / s["scores"].length;
        // 5. ?? (if-null)
        double finalAvg = (rawAvg + (s["bonus"] ?? 0)).clamp(0, 100);

        String grade = (finalAvg >= 90) ? "A" : (finalAvg >= 80) ? "B" : (finalAvg >= 70) ? "C" : (finalAvg >= 60) ? "D" : "F";

        String feedback = switch (grade) {
          "A" => "Outstanding performance!",
          "B" => "Good work, keep it up!",
          "C" => "Satisfactory. Room to improve.",
          "D" => "Needs improvement.",
          "F" => "Failing. Please seek help.",
          _   => "Unknown grade.",
        };

        // 7. ?. and 5. ??
        String displayComment = s["comment"]?.toUpperCase() ?? "NO COMMENT PROVIDED";

        // Right-side alignment formatting
        String nLine = " Name:    ${s["name"]}".padRight(35);
        String sLine = " Scores:  ${s["scores"]}".padRight(35);
        String bLine = " Bonus:   +${s["bonus"] ?? 0}".padRight(35);
        String aLine = " Average: ${finalAvg.toStringAsFixed(1)}".padRight(35);
        String gLine = " Grade:   $grade".padRight(35);
        String cLine = " Comment: $displayComment".padRight(35);

        print('''
  ╔════════════════════════════════════╗
  ║            REPORT CARD             ║
  ╠════════════════════════════════════╣
  ║$nLine║
  ║$sLine║
  ║$bLine║
  ║$aLine║
  ║$gLine║
  ║$cLine║
  ╚════════════════════════════════════╝
  $feedback''');
        break;

      case '7': // Class Summary
        if (students.isEmpty) {
          print("No students recorded.");
          break;
        }
        
        // 23. Collection for
        var summaryLines = [
          for (var s in students) "${s["name"]}: ${s["scores"].isEmpty ? 0 : (s["scores"].reduce((a, b) => a + b) / s["scores"].length).toStringAsFixed(1)}",
        ];
        print("\nClass Progress:\n${summaryLines.join('\n')}");

        int passCount = 0;
        Set<String> uniqueGrades = {}; // 20. Set
        double classTotal = 0;

        for (var s in students) {
          List<int> scs = List<int>.from(s["scores"]);
          if (scs.isEmpty) continue;

          double avg = scs.reduce((a, b) => a + b) / scs.length;
          double finalAvg = (avg + (s["bonus"] ?? 0)).clamp(0, 100);
          
          // Calculate Letter for Set
          String g = finalAvg >= 90 ? "A" : finalAvg >= 80 ? "B" : finalAvg >= 70 ? "C" : finalAvg >= 60 ? "D" : "F";
          uniqueGrades.add(g);
          classTotal += finalAvg;

          // 10. Logical operators
          if (scs.isNotEmpty && finalAvg >= 60) {
            passCount++;
          }
        }
        
        print("--- Statistics ---");
        print("Total Students: ${students.length}");
        print("Passing Students: $passCount");
        print("Unique Grades in Class: $uniqueGrades");
        print("Class Average: ${(classTotal / students.length).toStringAsFixed(1)}");
        break;

      case '8':
        print("Exiting application... Goodbye!");
        isRunning = false;
        break;
      default:
        print("Invalid choice.");
    }
  } while (isRunning);
}