import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'package:intl/intl.dart';


class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  String _timeUntilExam() {
    final now = DateTime.now();
    final difference = exam.dateTime.difference(now);

    if (difference.isNegative) {
      return "Испитот веќе е одржан";
    } else {
      final days = difference.inDays;
      final hours = difference.inHours % 24;
      return "$days дена, $hours часа до испитот";
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy');
    final timeFormat = DateFormat('HH:mm');

    return Scaffold(
      appBar: AppBar(
        title: Text(exam.subjectName),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Предмет: ${exam.subjectName}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.calendar_today),
                    const SizedBox(width: 8),
                    Text("Датум: ${dateFormat.format(exam.dateTime)}"),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.access_time),
                    const SizedBox(width: 8),
                    Text("Време: ${timeFormat.format(exam.dateTime)}"),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.location_on),
                    const SizedBox(width: 8),
                    Expanded(child: Text("Простории: ${exam.rooms.join(', ')}")),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  _timeUntilExam(),
                  style: const TextStyle(fontSize: 16, color: Colors.indigo),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
