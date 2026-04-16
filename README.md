

```md id="readme_clean_cli_student_grader"
# CLI Student Grader (Dart)

## Project Overview
CLI Student Grader is a command-line application built using Dart.  
It allows teachers to manage students, record scores, calculate grades, and generate report cards.

This project demonstrates fundamental Dart concepts from Weeks 1–2, including variables, collections, loops, null safety, and control flow.

---

## Features

- Add new students  
- Record scores for students  
- Add bonus points (optional)  
- Add teacher comments (optional)  
- View all students  
- Generate detailed report cards  
- View class summary (average, highest, lowest, grades)

---

## Concepts Used

This project includes the following Dart concepts:

- var, final, const  
- List, Set, Map  
- Null safety (int?, String?)  
- Null-aware operators (??, ??=, ?.)  
- Loops (for, for-in, while, do-while)  
- Conditional statements (if / else if / else)  
- switch and switch expressions  
- String interpolation  
- Multi-line strings  
- Collection if and collection for  
- Spread operator (...)  
- Logical and relational operators  

---

## Project Structure

```

cli_student_grader/
│
├── bin/
│   └── cli_student_grader.dart
│
├── pubspec.yaml
└── README.md

```

---

## How to Run

### 1. Clone the repository
```

git clone [https://github.com/your-username/cli-student-grader.git](https://github.com/your-username/cli-student-grader.git)

```

### 2. Navigate to project folder
```

cd cli_student_grader

```

### 3. Run the application
```

dart run

```

---

## Sample Menu

```

===== Student Grader v1.0 =====

1. Add Student
2. Record Score
3. Add Bonus Points
4. Add Comment
5. View All Students
6. View Report Card
7. Class Summary
8. Exit

```

---

## Example Report Card

```

╔══════════════════════════════╗
║       REPORT CARD            ║
╠══════════════════════════════╝
║ Name: Runa
║ Scores: [85, 92, 78]
║ Bonus: +5
║ Average: 90.0
║ Grade: A
║ Comment: GREAT IMPROVEMENT
╚══════════════════════════════╝

```

---

## Git Commit History

- feat: add menu loop and switch routing  
- feat: add student creation with spread operator  
- feat: record scores with validation loop  
- feat: add bonus and comment with null-aware operators  
- feat: generate report card with grade calculation  
- feat: add class summary with collection for/if  

---

## Author

Sumaiya Akter Runa  
Flutter Developer and UX Designer  

---

## Notes

- This project is created for learning purposes  
- It is part of Dart programming coursework  
- All features are implemented in a CLI environment  

---

## Conclusion

This project demonstrates how basic Dart concepts can be used to build a complete CLI application with real-world functionality.
```

---

