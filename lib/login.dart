import 'package:flutter/material.dart';
import 'id_login_page.dart';
import 'code_login_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Login",
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.w500,
                color: Color(0xff191919),
              )),
          backgroundColor: const Color(0xffffffff),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_outlined),
              onPressed: () {
                Navigator.pop(context);
              },
              color: const Color(0xff191919)),
        ),
        body: Column(
          children: const [
            CodeLoginPage(),
            SizedBox(
              height: 60,
            ),
            SizedBox(
                child: Center(
                    child: Text("Or",
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w700,
                          color: Color(0xff767676),
                          fontSize: 13,
                        )))),
            SizedBox(
              height: 50,
            ),
            IdLoginPage()
          ],
        ));
  }
}
