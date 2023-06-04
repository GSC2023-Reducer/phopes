import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'student_home_page.dart';

class CodeLoginPage extends StatefulWidget {
  const CodeLoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _CodeLoginPage();
}

class _CodeLoginPage extends State<CodeLoginPage>
    with SingleTickerProviderStateMixin {
  TextEditingController? _codeTextController;
  FirebaseFirestore db = FirebaseFirestore.instance;

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
              child: Text("Input Phone Code",
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
                      hintText: ('Input the code'),
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
                onPressed: () async {
                  DocumentSnapshot studentInfo = await db
                      .collection("students")
                      .doc(_codeTextController!.text)
                      .get();
                  print(studentInfo);
                  if (!studentInfo.exists) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              content: Text("Check your code"),
                              actions: [
                                MaterialButton(
                                  child: Text("confirm"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ]);
                        });
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StudentHomePage()));
                  }
                },
                color: Colors.blueAccent,
                child: const Text(
                  "Login",
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
