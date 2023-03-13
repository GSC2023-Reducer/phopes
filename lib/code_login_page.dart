import 'package:flutter/material.dart';
import 'id_login_page.dart';
import 'student_home_page.dart';

class CodeLoginPage extends StatefulWidget {
  const CodeLoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _CodeLoginPage();
}

class _CodeLoginPage extends State<CodeLoginPage>
    with SingleTickerProviderStateMixin {
  TextEditingController? _codeTextController;

  @override
  void initState() {
    super.initState();

    _codeTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 60),
            const SizedBox(
              width: 330,
              child: Text("공기계 코드 입력",
                  style: TextStyle(
                      height: 1.2,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w700,
                      color: Color(0xff191919),
                      fontSize: 30)),
            ),
            const SizedBox(height: 20),
            SizedBox(
                width: 340,
                child: TextField(
                  controller: _codeTextController,
                  maxLines: 1,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffffffff)),
                      ),
                      hintText: ('코드를 입력해주세요'),
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Color(0xff999999),
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w500,
                      ),
                      filled: true,
                      fillColor: Color(0xffF1F1F5)),
                )),
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
                  "로그인",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'NotoSansKR',
                    fontWeight: FontWeight.w700,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
