import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'code_login_page.dart';
import "sign_page.dart";
import 'student_home_page.dart';
import 'data/user.dart';
/*import 'package:firebase_auth/firebase_auth.dart';*/

class IdLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IdLoginPage();
}

class _IdLoginPage extends State<IdLoginPage>
    with SingleTickerProviderStateMixin {
  /*FirebaseDatabase? _database;
  DatabaseReference? reference;
  String _databaseURL = 'https://phopescjw-43128-default-rtdb.firebaseio.com/';*/

  TextEditingController? _idTextController;
  TextEditingController? _pwTextController;
  List<User> userList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    /* signPage에서 DB에 담겨야할 내용*/
    userList.add(User(
        userName: "호날두",
        id: "ronaldo",
        password: "cr7",
        createTime: DateTime.utc(2023, 2, 20)));
    userList.add(User(
        userName: "메시",
        id: "messi",
        password: "lm10",
        createTime: DateTime.utc(2023, 2, 19)));
    userList.add(User(
        userName: "음바페",
        id: "mbappe",
        password: "km10",
        createTime: DateTime.utc(2023, 2, 18)));

    _idTextController = TextEditingController();
    _pwTextController = TextEditingController();
    /*_database = FirebaseDatabase(databaseURL : _databaseURL);
    reference = _database?.reference().child("user");*/
  }

  @override
  Widget build(BuildContext context) {
    bool? _isChecked = false;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("로그인",
            style: TextStyle(
              fontFamily: 'NotoSansKR',
              fontWeight: FontWeight.w500,
              color: Color(0xff191919),
            )),
        backgroundColor: Color(0xffffffff),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Color(0xff191919)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 80),
            SizedBox(
              width: 330,
              child: Text("일반회원\n로그인",
                  style: TextStyle(
                      height: 1.3,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w700,
                      color: Color(0xff191919),
                      fontSize: 30)),
            ),
            SizedBox(height: 20),
            SizedBox(
                width: 340,
                child: TextField(
                  controller: _idTextController,
                  maxLines: 1,
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffffffff)),
                      ),
                      hintText: ('아이디 또는 이메일을 입력해주세요'),
                      hintStyle: TextStyle(
                          fontSize: 15,
                          color: Color(0xff999999),
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w500),
                      filled: true,
                      fillColor: Color(0xffF1F1F5)),
                )),
            SizedBox(
                width: 340,
                child: TextField(
                  controller: _pwTextController,
                  maxLines: 1,
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffffffff)),
                      ),
                      hintText: ('비밀번호를 입력해주세요'),
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Color(0xff999999),
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w500,
                      ),
                      filled: true,
                      fillColor: Color(0xffF1F1F5)),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    child: Checkbox(
                  activeColor: Color(0xff2079FF),
                  checkColor: Colors.white,
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value;
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: MaterialStateBorderSide.resolveWith(
                    (states) =>
                        BorderSide(width: 1.0, color: Color(0xffDBDBDB)),
                  ),
                )),
                SizedBox(
                    child: Text("자동 로그인",
                        style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w500,
                            color: Color(0xff191919),
                            fontSize: 15))),
                SizedBox(
                    child: Checkbox(
                  activeColor: Color(0xff2079FF),
                  checkColor: Colors.white,
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value;
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  side: MaterialStateBorderSide.resolveWith(
                    (states) =>
                        BorderSide(width: 1.0, color: Color(0xffDBDBDB)),
                  ),
                )),
                SizedBox(
                    child: Text("아이디 저장",
                        style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w500,
                            color: Color(0xff191919),
                            fontSize: 15))),
                SizedBox(width: 120),
              ],
            ),
            MaterialButton(
                minWidth: 340,
                height: 50,
                onPressed: () {
                  /*userlist에서 아이디, 비번을 조회하는 것이 아니라 db에서 조회해야함*/
                  if (_idTextController?.value.text.length == 0 ||
                      _pwTextController?.value.text.length == 0) {
                    makeDialog("아이디와 비밀번호를 입력하세요");
                  } else {
                    if (idCheck(_idTextController?.value.text) == -1) {
                      print(_idTextController?.value.text);
                      makeDialog('아이디가 없습니다');
                    } else {
                      if (_pwTextController?.value.text ==
                          userList[idCheck(_idTextController?.value.text)]) {
                        Navigator.of(context).pushReplacementNamed('/main',
                            arguments: _idTextController!.value.text);
                      } else {
                        makeDialog("비밀번호가 틀립니다");
                      }
                    }
                  }
                },
                child: Text("로그인",
                    style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w500,
                        color: Color(0xffFFFFFF),
                        fontSize: 17)),
                color: Colors.blueAccent),
            SizedBox(height: 10),
            SizedBox(
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: '계정을 잊으셨나요?',
                      style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: ' ID찾기',
                      recognizer: TapGestureRecognizer()
                        ..onTapDown = (details) {
                          print(details.globalPosition);
                        },
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  TextSpan(text: ' 또는', style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: ' 비밀번호 찾기',
                      recognizer: TapGestureRecognizer()
                        ..onTapDown = (details) {
                          print(details.globalPosition);
                        },
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                ]),
              ),
            ),
            SizedBox(height: 140),
            SizedBox(
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: '아직 회원이 아니신가요?',
                      style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w500,
                          color: Color(0xff767676),
                          fontSize: 13)),
                  TextSpan(
                      text: ' 회원가입 >',
                      recognizer: TapGestureRecognizer()
                        ..onTapDown = (details) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignPage()));
                        },
                      style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w500,
                          color: Color(0xff191919),
                          fontSize: 13)),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  void makeDialog(String text) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(content: Text(text));
        });
  }

  int idCheck(String? id) {
    for (int i = 0; i < userList.length; i++) {
      if (id == userList[i].id) {
        print(i);
        return i;
      }
    }
    return -1;
  }
}
