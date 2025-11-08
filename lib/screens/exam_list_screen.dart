import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';

class ExamListScreen extends StatelessWidget {
  const ExamListScreen({super.key});

  List<Exam> get exams {
    return [
      Exam(subjectName: "Дискретна Математика", dateTime: DateTime(2026, 1, 12, 9, 0), rooms: ["A1", "A2"], isPassed: false),
      Exam(subjectName: "Структурно Програмирање", dateTime: DateTime(2026, 1, 15, 10, 30), rooms: ["B3"], isPassed: false),
      Exam(subjectName: "Бази на податоци", dateTime: DateTime(2026, 1, 20, 9, 0), rooms: ["Lab 2"], isPassed: false),
      Exam(subjectName: "Напредно Програмирање", dateTime: DateTime(2026, 1, 25, 11, 0), rooms: ["C1", "C2"], isPassed: false),
      Exam(subjectName: "Оперативни системи", dateTime: DateTime(2026, 2, 2, 9, 0), rooms: ["B1"], isPassed: false),
      Exam(subjectName: "Анализа и дизајн на ИС", dateTime: DateTime(2024, 12, 10, 9, 0), rooms: ["A3"], isPassed: true),
      Exam(subjectName: "Калкулус 1", dateTime: DateTime(2024, 12, 15, 10, 0), rooms: ["B2"], isPassed: true),
      Exam(subjectName: "Веб Дизајн", dateTime: DateTime(2026, 2, 10, 9, 0), rooms: ["Lab 1"], isPassed: false),
      Exam(subjectName: "Компјутерски мрежи и безбедност", dateTime: DateTime(2026, 2, 15, 8, 30), rooms: ["C3"], isPassed: false),
      Exam(subjectName: "Објектно Ориентирано Програмирање", dateTime: DateTime(2026, 3, 1, 9, 0), rooms: ["A4"], isPassed: false),
    ]..sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Распоред за испити - 223045"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) => ExamCard(exam: exams[index]),
      ),
      bottomNavigationBar: Container(
        color: Colors.indigo,
        padding: const EdgeInsets.all(12),
        child: Text(
          "Вкупно испити: ${exams.length}",
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
