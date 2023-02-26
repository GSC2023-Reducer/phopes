import 'dart:async';
import 'dart:convert';
import 'dart:math';

//import 'package:crypto/crypto.dart';
//import 'package:firebase_database/firebase_database.dart';
/*import 'package:phopes_firstpage/data/user_register.dart';*/
import 'package:flutter/material.dart';
import 'id_login_page.dart';
import 'student_home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CodeLoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _CodeLoginPage();
}

class _CodeLoginPage extends State<CodeLoginPage> with SingleTickerProviderStateMixin{
  TextEditingController? _codeTextController;

  @override
  void initState(){
    super.initState();

    _codeTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context){
    bool? _isChecked = false;
    return Scaffold(
        resizeToAvoidBottomInset : false,
        appBar : AppBar(
            title: Text("로그인",
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
                  children: <Widget>[
                    SizedBox(
                        height : 60
                    ),
                    SizedBox(
                        width : 330,
                        child : Text("공기계 코드 입력",
                            style: TextStyle(
                                height: 1.2,
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w700,
                                color : Color(0xff191919),
                                fontSize : 30
                            )
                        ),
                    ),
                    SizedBox(
                      height : 20
                    ),
                    SizedBox(
                        width : 340,
                        child : TextField(
                          controller : _codeTextController,
                          maxLines: 1,
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffffffff)),
                              ),
                              hintText: ('코드를 입력해주세요'),
                              hintStyle: TextStyle(fontSize: 15, color: Color(0xff999999),fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w500,),
                              filled: true,
                              fillColor: Color(0xffF1F1F5)
                          ),
                        )
                    ),
                    SizedBox(
                        height : 20
                    ),
                    MaterialButton(
                      minWidth : 340,
                        height : 50,

                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => StudentHomePage()));
                        },
                        child: Text("로그인", style : TextStyle(color : Colors.white,fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w700,),),
                        color : Colors.blueAccent
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    SizedBox(
                      child : Center(
                          child : Text("또는",
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w700,
                                color : Color(0xff767676),
                                fontSize : 13,
                              )
                          )
                      )
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      margin : EdgeInsets.all(30),
                      child : Row(
                          children: <Widget>[
                            SizedBox(
                              width : 220,
                                child: Text("일반회원 로그인 바로가기",
                                    style: TextStyle(
                                        height: 1.2,
                                        fontFamily: 'NotoSansKR',
                                        fontWeight: FontWeight.w700,
                                        color : Color(0xff191919),
                                        fontSize : 30
                                    ))
                            ),
                            IconButton(onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => IdLoginPage()));
                            }, icon: Icon(Icons.arrow_forward_ios))
                          ],
                      ),
                    ),
                  ],
                )
            )
        )
    );
  }
}