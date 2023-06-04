import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phopes/isar_services.dart';
import 'package:phopes/provider/reading_progress_provider.dart';
import 'package:phopes/provider/user_provider.dart';
import 'package:provider/provider.dart';

import '/study_plan_page.dart';
import 'check_before_donation.dart';
import 'check_phone_info.dart';
import 'checklist_before_start.dart';
import 'finish_phone_donation.dart';
import 'firebase_options.dart';
import 'first_page.dart';
import 'input_phone_info.dart';
import 'student_home_page.dart';
import "update_page.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (Firebase.apps.isEmpty) {
    Firebase.initializeApp(
        name: 'name-here', options: DefaultFirebaseOptions.currentPlatform);
  } else {
    Firebase.app(); // if already initialized, use that one
  }
  IsarService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ReadingProgressProvider>(
          create: (_) => ReadingProgressProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "login",
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/first',
        routes: {
          '/first': (context) => FirstPage(),
          '/main': (context) => const StudentHomePage(),
          '/study_plan': (context) => const StudyPlanPage(),
          '/update': (context) => const UpdatePage(),
          '/check_before_donation': (context) => CheckBeforeDonation(
                city: "",
                period: "",
              ),
          '/input_phone_info': (context) =>
              InputPhoneInfo(city: "", period: ""),
          '/check_phone_info': (context) => CheckPhoneInfo(
                city: "",
                period: "",
                cellPhoneMem: '',
                cellPhoneType: '',
                serialNumber: '',
              ),
          '/finish_phone_donation': (context) =>
              FinishPhoneDontaion(authcode: ""),
          '/checklist_before_start': (context) => const CheckListBeforeStart(),
        },
      ),
    );
  }
}
