import 'package:flutter/material.dart';
import 'student_home_page.dart';

class IdLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      children: [
        const SizedBox(
          width: 330,
          child: Text("일반회원 로그인",
              style: TextStyle(
                  height: 1.3,
                  fontFamily: 'NotoSansKR',
                  fontWeight: FontWeight.w700,
                  color: Color(0xff191919),
                  fontSize: 30)),
        ),
        const SizedBox(height: 20),
        MaterialButton(
            minWidth: 340,
            height: 50,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const StudentHomePage()));
            },
            color: Colors.blueAccent,
            child: const Text(
              "Google 계정으로 로그인",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.w700,
              ),
            )),
      ],
    ));
  }
}
