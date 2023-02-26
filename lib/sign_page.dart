import 'dart:convert';
import 'package:flutter/material.dart';
import 'id_login_page.dart';
import 'code_login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:crypto/crypto.dart';
//import 'package:firebase_database/firebase_database.dart';
/*import 'package:phopes_firstpage/data/user_register.dart';*/

class SignPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SignPage();
}

class _SignPage extends State<SignPage>{
  //FirebaseDatabase? _database;
  //DatabaseReference? reference;
  //String _databaseURL = "https://phopescjw-default-rtdb.firebaseio.com/";

  TextEditingController? _idTextController;
  TextEditingController? _pwTextController;
  TextEditingController? _pwCheckTextController;

  @override
  void initState(){
    super.initState();
    _idTextController = TextEditingController();
    _pwTextController = TextEditingController();
    _pwCheckTextController = TextEditingController();

    /*_database = FirebaseDatabase(databaseURL : _databaseURL);
    reference = _database.reference().child('user');*/
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar : AppBar(
          title: Text("회원가입",
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.w500,
                color : Color(0xff191919),
              )),
          backgroundColor: Color(0xffffffff),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_outlined),
              onPressed: () {Navigator.pop(context);},
              color : Color(0xff191919)
          ),
        ),
      body : Container(
        child : Center(
          child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children : <Widget>[
              SizedBox(
                width : 330,
                child : Text("아이디 생성",
                    style: TextStyle(
                        height: 1.2,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                        color : Color(0xff191919),
                        fontSize : 20
                    )
                ),
              ),
              SizedBox(height : 10),
              SizedBox(
                  width : 340,
                  child : TextField(
                    controller : _idTextController,
                    maxLines: 1,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffffffff)),
                        ),
                        labelText: ('아이디 또는 이메일을 입력해주세요'),
                        hintText: '4자 이상 입력해주세요',
                        hintStyle: TextStyle(fontSize: 15, color: Color(0xff999999),fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w500),
                        filled: true,
                        fillColor: Color(0xffF1F1F5)
                    ),
                  )
              ),
              SizedBox(height : 20),
              SizedBox(
                width : 330,
                child : Text("비밀번호 생성",
                    style: TextStyle(
                        height: 1.2,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                        color : Color(0xff191919),
                        fontSize : 20
                    )
                ),
              ),
              SizedBox(height : 10),
              SizedBox(
                  width : 340,
                  child : TextField(
                    controller : _pwTextController,
                    maxLines: 1,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffffffff)),
                        ),
                        labelText: ('비밀번호를 입력해주세요'),
                        hintText: '6자 이상 입력해주세요',
                        hintStyle: TextStyle(fontSize: 15, color: Color(0xff999999),fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w500),
                        filled: true,
                        fillColor: Color(0xffF1F1F5)
                    ),
                  )
              ),
              SizedBox(height : 20),
              SizedBox(
                width : 330,
                child : Text("비밀번호 확인",
                    style: TextStyle(
                        height: 1.2,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                        color : Color(0xff191919),
                        fontSize : 20
                    )
                ),
              ),
              SizedBox(height : 10),
              SizedBox(
                  width : 340,
                  child : TextField(
                    controller : _pwCheckTextController,
                    maxLines: 1,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffffffff)),
                        ),
                        labelText: ('비밀번호 확인'),
                        hintStyle: TextStyle(fontSize: 15, color: Color(0xff999999),fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w500),
                        filled: true,
                        fillColor: Color(0xffF1F1F5)
                    ),
                  )
              ),
              SizedBox(height : 20),
              MaterialButton(onPressed: (){
                if(_idTextController!.value.text.length >= 4 && _pwTextController!.value.text.length >= 6){
                  if(_pwTextController!.value.text == _pwCheckTextController!.value.text){
                    /*db에 들어가는 것 추가*/
                    Navigator.of(context).pushReplacementNamed('/code');
                  }
                  else{
                    makeDialog("비밀번호가 다릅니다");
                  }
                }
                else{
                  makeDialog("아이디 또는 비밀번호의 길이가 짧습니다");
                }
              }, child :Text('회원가입', style : TextStyle(color : Colors.white)),
              color : Colors.blueAccent)
            ],
          )
        )
      )
    );
  }
  void makeDialog(String text){
    showDialog(context: context, builder: (context){
      return AlertDialog(
          content: Text(text)
      );
    });
  }
}