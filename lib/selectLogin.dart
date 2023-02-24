import 'dart:async';
import 'dart:convert';
import 'dart:math';

//import 'package:crypto/crypto.dart';
//import 'package:firebase_database/firebase_database.dart';
/*import 'package:phopes_firstpage/data/user_register.dart';*/
import 'package:flutter/material.dart';
import 'codeLogin.dart';
import 'idLogin.dart';
import 'package:flutter/gestures.dart';
import "SignPage.dart";

class SelectPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SelectPage();
}

class _SelectPage extends State<SelectPage> with SingleTickerProviderStateMixin{
  //FirebaseDatabase? _database;
  //DatabaseReference? reference;
  //String _databaseURL = "https://phopescjw-default-rtdb.firebaseio.com/";

  double opacity = 0;
  AnimationController? _animationController;
  Animation? _animation;
  TextEditingController? _idTextController;
  TextEditingController? _pwTextController;

  @override
  void initState(){
    super.initState();

    _idTextController = TextEditingController();
    _pwTextController = TextEditingController();

    _animationController = AnimationController(duration : Duration(seconds : 3), vsync: this);
    _animation = Tween<double>(begin: 0, end : pi*2).animate(_animationController!);
    _animationController!.repeat();
    Timer(Duration(seconds : 2), (){
      setState(() {
        opacity = 1;
      });
    });

    //_database = FirebaseDatabase(databaseURL : _databaseURL);
    //reference = _database?.reference().child('user');
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body : Container(
            child : Center(
                child : Column(
                    children : <Widget>[
                      AnimatedBuilder(
                          animation: _animationController!,
                          builder: (context, widget){
                            return Transform.rotate(angle : _animation?.value, child : widget);},
                          child : Icon(
                              Icons.phone_android,
                              color : Colors.blueAccent,
                              size : 80
                          )),
                      SizedBox(
                        height : 100,
                        child : Center(
                          child : Text("Phopes",
                          style : TextStyle(fontSize : 30))
                        )
                      ),
                      SizedBox(
                          child : ElevatedButton(
                              onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => IdLoginPage()));
                              },
                              child : Text("일반 휴대폰용 로그인")
                          )
                      ),
                      SizedBox(
                          height : 10
                      ),
                      SizedBox(
                          child : ElevatedButton(
                              onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CodeLoginPage()));
                              },
                              child : Text("공기계용 로그인")
                          )
                      ),
                      SizedBox(
                          height : 50
                      ),
                      SizedBox(
                        child : RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: '아직 회원이 아니신가요?',
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                                text: ' 회원가입',
                                //텍스트를 클릭시 이벤트를 발생시키기 위함
                                recognizer: TapGestureRecognizer()
                                //클래스 생성과 동시에 '선언부..함수명'을 입력하면 클래스 변수 없이 함수를 바로 호출 가능함
                                  ..onTapDown = (details) {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignPage()));
                                  },
                                style: TextStyle(color : Colors.black, fontWeight: FontWeight.bold)),
                          ]),
                        ),
                      )
                    ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )
            )
        )
    );
  }
}