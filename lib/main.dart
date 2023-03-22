import 'package:flutter/material.dart';
import 'package:phopes/isar_services.dart';
import '/study_plan_page.dart';
import 'student_home_page.dart';
import 'first_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import "update_page.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  IsarService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "login",
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/first',
      routes: {
        '/first': (context) => const FirstPage(),
        '/main': (context) => const StudentHomePage(),
        '/study_plan': (context) => const StudyPlanPage(),
        '/update': (context) => const UpdatePage()
      },
    );
  }
}
