import 'package:flutter/material.dart';
import 'code_login_page.dart';
import '/study_plan_page.dart';
import 'student_home_page.dart';
import 'first_page.dart';
import 'book_detail_page.dart';
import 'book_view_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'models/auth_model.dart';
import "update_page.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirebaseAuthProvider())
      ],
      child: MaterialApp(
        title: "login",
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/first',
        routes: {
          '/first': (context) => const FirstPage(),
          '/main': (context) => const StudentHomePage(),
          '/code': (context) => const CodeLoginPage(),
          '/study_plan': (context) => const StudyPlanPage(),
          '/book_detail_page': (context) => const BookDetailPage(),
          '/update': (context) => const UpdatePage()
        },
      ),
    );
  }
}
