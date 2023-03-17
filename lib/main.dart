import 'package:flutter/material.dart';
import 'package:phopes/book_loader.dart';
import 'code_login_page.dart';
import '/study_plan_page.dart';
import 'student_home_page.dart';
import 'first_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import "update_page.dart";
import 'book_detail_page.dart';
import 'check_before_donation.dart';
import 'input_phone_info.dart';
import 'check_phone_info.dart';
import 'finish_phone_donation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    loadBooks();
    return MaterialApp(
      title: "login",
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/check_before_donation',
      routes: {
        '/first': (context) => const FirstPage(),
        '/main': (context) => const StudentHomePage(),
        '/code': (context) => const CodeLoginPage(),
        '/study_plan': (context) => const StudyPlanPage(),
        '/book_detail_page': (context) => BookDetailPage(),
        '/update': (context) => const UpdatePage(),
        '/check_before_donation': (context) => const CheckBeforeDonation(),
        '/input_phone_info': (context) => const InputPhoneInfo(),
        '/check_phone_info': (context) => CheckPhoneInfo(
              cellPhoneMem: '',
              cellPhoneType: '',
              serialNumber: '',
            ),
        '/finish_phone_donation': (context) => const FinishPhoneDontaion(),
      },
    );
  }
}
