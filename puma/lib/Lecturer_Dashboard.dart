// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:final_project/reusable_widgets/reusable_widget.dart';
// import 'package:final_project/screens/Student_Dashboard.dart';
// import 'package:final_project/utils/color.dart';
import 'package:flutter/material.dart';

class Lecture_Dashboard extends StatefulWidget {
  const Lecture_Dashboard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LectureDashboardState(); // Return the state class here
  }
}

class _LectureDashboardState extends State<Lecture_Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lecture Dashboard'),
        backgroundColor: Colors.blue, // Assuming primaryColor is defined in color.dart
      ),
      body: const Center(
        child: Text(
          'Lecturer Dashboard',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
