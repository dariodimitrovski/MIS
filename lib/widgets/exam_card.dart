import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../screens/exam_detail_screen.dart';
import 'package:intl/intl.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy');
    final timeFormat = DateFormat('HH:mm');

    return Card(
      color: exam.isPassed ? Colors.green[100] : Colors.blue[100],
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ListTile(
        leading: const Icon(Icons.school, color: Colors.indigo),
        title: Text(
          exam.subjectName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16),
                const SizedBox(width: 5),
                Text('${dateFormat.format(exam.dateTime)} - ${timeFormat.format(exam.dateTime)}'),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16),
                const SizedBox(width: 5),
                Text(exam.rooms.join(', ')),
              ],
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ExamDetailScreen(exam: exam),
            ),
          );
        },
      ),
    );
  }
}
