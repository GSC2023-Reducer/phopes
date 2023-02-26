import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:intl/intl.dart';
//import 'package:crypto/crypto.dart';
//import 'package:firebase_database/firebase_database.dart';
/*import 'package:phopes_firstpage/data/user_register.dart';*/
import 'package:flutter/material.dart';
import 'code_login_page.dart';
import 'id_login_page.dart';
import 'data/class.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'book_detail_page.dart';
import 'book_view_page.dart';
import 'services/api_services.dart';


class StudentHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _StudentHomePage();
}
class _StudentHomePage extends State<StudentHomePage>{
  List<Class> classList = List.empty(growable: true);
  int maxIndex = 0;
  @override
  void initState(){
    super.initState();
   /* DB에 담겨야할 내용*/
    classList.add(Class(className : "인공지능", finish : false, recentTime: DateTime.utc(2023,2,20), imagePath: "repo/images/dog.png",
        progress: 0.7, startTime: DateTime.utc(2023,2,1)));
    classList.add(Class(className : "컴퓨터시스템설계", finish : false, recentTime: DateTime.utc(2023,2,19), imagePath: "repo/images/dog.png",
        progress: 0.7,startTime: DateTime.utc(2023,2,2)));
    classList.add(Class(className : "데이터베이스", finish : false, recentTime: DateTime.utc(2023,2,21), imagePath: "repo/images/dog.png",
        progress: 0.7,startTime: DateTime.utc(2023,2,3)));
    classList.add(Class(className : "운영체제", finish : false, recentTime: DateTime.utc(2023,2,22), imagePath: "repo/images/dog.png",
        progress: 0.7,startTime: DateTime.utc(2023,2,4)));
    classList.add(Class(className : "임베디드시스템", finish : false, recentTime: DateTime.utc(2023,2,17), imagePath: "repo/images/dog.png",
        progress: 0.7,startTime: DateTime.utc(2023,2,5)));

    DateTime max = classList[0].recentTime;

    for (int i = 0;i< classList.length; i++) {
      if (DateFormat.yMMMd('en_US').format(classList[maxIndex].recentTime).compareTo(DateFormat.yMMMd('en_US').format(classList[i].recentTime)) == 1) {
        maxIndex = i;
        max = classList[i].recentTime;
      }
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation : 0.0,
        backgroundColor: Color(0xff2079FF),
        centerTitle: true,
        title : Text("Phopes",style : TextStyle(fontFamily: 'Modak',
            fontWeight: FontWeight.w500,
            color : Color(0xffFFFFFF),
            fontSize : 24)),
        leading : Container()
      ),
      endDrawer : Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius:BorderRadius.only(
              topLeft: Radius.circular(40.0),
                bottomLeft: Radius.circular(40.0))
          ),
        child : ListView(
          padding : EdgeInsets.zero,
          children: <Widget> [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                ),
              ),
                accountEmail : Text(''),
                accountName: Row(
                  children: <Widget>[
                    Container(
                      child: CircleAvatar(
                        radius : 26,
                        backgroundColor: Color(0xffF1F1F5),
                      ),
                    ),
                    SizedBox(
                      width : 20
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width : 110,
                          child : Text('Name', style : TextStyle(fontFamily: 'NotoSansKR',
                              fontWeight: FontWeight.w700,
                              color : Color(0xff767676),
                              fontSize : 24)),
                        ),
                        SizedBox(
                          width : 110,
                          child : Text('컴퓨터프로그래밍',style : TextStyle(fontFamily: 'NotoSansKR',
                              fontWeight: FontWeight.w500,
                              color : Color(0xff999999),
                              fontSize : 12))
                        )
                      ]
                    )
                  ],
                ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15,0,0,0),
              child : ListTile(
                  title: Text('홈',style : TextStyle(fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w500,
                      color : Color(0xff767676),
                      fontSize : 20)),
                  onTap: () {}/*홈이면 그냥 다른 곳 탭해도 되지않나? 홈 listtile이 굳이 필요?*/
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15,0,0,0),
                child : ListTile(
                    title: Text('학습플랜',style : TextStyle(fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w500,
                        color : Color(0xff767676),
                        fontSize : 20)),
                    onTap: () {Navigator.of(context).pushReplacementNamed('/study_plan');}/*학습플랜 창으로 넘어가기*/
                )
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15,0,0,0),
              child : ListTile(
                  title: Text('로그아웃',style : TextStyle(fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w500,
                      color : Color(0xff767676),
                      fontSize : 20)),
                  onTap: () {Navigator.of(context).pushReplacementNamed('/code');}
              ),
            )
          ],
        )
      ),
      body : Stack(
        children :<Widget>[
          Container(
            height : 200,
            decoration : new BoxDecoration(
              color : Color(0xff2079FF),
              borderRadius: BorderRadius.only(bottomRight : Radius.circular(100)),
            ),
          ),
          Container(
              child : Center(
                  child : ListView.builder(
                    padding : const EdgeInsets.all(20),
                    itemCount: classList.length + 1,
                    itemBuilder: (context, position){
                      if(position == 0){
                        return 
                            GestureDetector(
                              onTap:(){
                                Navigator.push(context,MaterialPageRoute(builder: (context) => BookDetailPage(title: indexTitle,)));
                              },
                              child : Card(
                                  elevation : 0,
                                  color : Colors.transparent,
                                  surfaceTintColor: Colors.white,
                                  child : Column(
                                      children : <Widget>[
                                        Container(
                                            padding : EdgeInsets.only(bottom : 10),
                                            color : Colors.transparent,
                                            width : double.infinity,
                                            child : Text("최근 수강한 강의",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontFamily: 'NotoSansKR',
                                                    fontWeight: FontWeight.w700,
                                                    color : Color(0xffFFFFFF),
                                                    fontSize : 25
                                                ))
                                        ),
                                        Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xffF1F1F5),
                                              borderRadius: BorderRadius.only(topLeft : Radius.circular(20), topRight: Radius.circular(20)),
                                            ),
                                            child : Image.asset(
                                                classList[maxIndex].imagePath,
                                                height: 200,
                                                width : 700
                                            )
                                        ),
                                        Container(
                                          color : Colors.white,
                                          child : Container(
                                              width : double.infinity,
                                              transform: Matrix4.translationValues(0.0, -13.0, 0.0),
                                              child : Text("   "+classList[maxIndex].className,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      fontFamily: 'NotoSansKR',
                                                      fontWeight: FontWeight.w700,
                                                      color : Color(0xff191919),
                                                      fontSize : 20
                                                  ))
                                          ),
                                        ),
                                        Container(
                                            padding : EdgeInsets.only(bottom : 10, left : 4, right : 4),
                                            color: Colors.white,
                                            child : Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children : <Widget>[
                                                  Text("나의 학습 진도율",
                                                      style: TextStyle(
                                                          fontFamily: 'NotoSansKR',
                                                          fontWeight: FontWeight.w500,
                                                          color : Color(0xff767676),
                                                          fontSize : 12
                                                      )),
                                                  Text("${classList[maxIndex].progress * 100}%",
                                                      style: TextStyle(
                                                          fontFamily: 'NotoSansKR',
                                                          fontWeight: FontWeight.w500,
                                                          color : Color(0xff767676),
                                                          fontSize : 12
                                                      ))
                                                ]
                                            )
                                        ),
                                        Container(
                                            padding : EdgeInsets.only(bottom : 10),
                                            color : Colors.white,
                                            child : Container(
                                              child : LinearPercentIndicator(
                                                  padding : EdgeInsets.zero,
                                                  percent: classList[maxIndex].progress,
                                                  lineHeight: 7,
                                                  backgroundColor: Color(0xffF1F1F5),
                                                  progressColor: Color(0x442079ff)
                                              ),
                                            )
                                        ),
                                        Container(
                                            color : Colors.white,
                                            child : Container(
                                                height:1,
                                                color: Color(0xffDBDBDB)
                                            )
                                        ),
                                        Container(
                                            padding: EdgeInsets.only(top : 10, bottom : 10, left : 4, right : 4),
                                            color : Colors.white,
                                            child : Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children : <Widget>[
                                                  Text("학습 시작일 ${DateFormat.yMMMd('en_US').format(classList[maxIndex].startTime)}",
                                                      style: TextStyle(
                                                          fontFamily: 'NotoSansKR',
                                                          fontWeight: FontWeight.w500,
                                                          color : Color(0xff767676),
                                                          fontSize : 12
                                                      )),
                                                  Text("최근 학습일 ${DateFormat.yMMMd('en_US').format(classList[maxIndex].recentTime)}",
                                                      style: TextStyle(
                                                          fontFamily: 'NotoSansKR',
                                                          fontWeight: FontWeight.w500,
                                                          color : Color(0xff2079FF),
                                                          fontSize : 12
                                                      )),
                                                ]
                                            )
                                        ),
                                        Container(
                                            decoration: BoxDecoration(
                                              color : Colors.white,
                                              borderRadius: BorderRadius.only(bottomLeft : Radius.circular(20), bottomRight: Radius.circular(20)),
                                            ),
                                            padding : EdgeInsets.only(bottom : 30),

                                            child : Container(
                                                height:1,
                                                color: Color(0xffDBDBDB)
                                            )
                                        ),
                                      ]
                                  )
                              )
                            );
                      }
                      return Card(
                          elevation : 0,
                          color : Colors.transparent,
                          surfaceTintColor: Colors.white,
                          child : Column(
                              children : <Widget>[
                                Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffF1F1F5),
                                      borderRadius: BorderRadius.only(topLeft : Radius.circular(20), topRight: Radius.circular(20)),
                                    ),
                                    child : Image.asset(
                                        classList[position-1].imagePath,
                                        height: 200,
                                        width : 700
                                    )
                                ),
                                Container(
                                  color : Colors.white,
                                  child : Container(
                                      width : double.infinity,
                                      transform: Matrix4.translationValues(0.0, -13.0, 0.0),
                                      child : Text("   "+classList[position-1].className,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: 'NotoSansKR',
                                              fontWeight: FontWeight.w700,
                                              color : Color(0xff191919),
                                              fontSize : 20
                                          ))
                                  ),
                                ),
                                Container(
                                    padding : EdgeInsets.only(bottom : 10, left : 4, right : 4),
                                    color: Colors.white,
                                    child : Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children : <Widget>[
                                          Text("나의 학습 진도율",
                                              style: TextStyle(
                                                  fontFamily: 'NotoSansKR',
                                                  fontWeight: FontWeight.w500,
                                                  color : Color(0xff767676),
                                                  fontSize : 12
                                              )),
                                          Text("${classList[position-1].progress * 100}%",
                                              style: TextStyle(
                                                  fontFamily: 'NotoSansKR',
                                                  fontWeight: FontWeight.w500,
                                                  color : Color(0xff767676),
                                                  fontSize : 12
                                              ))
                                        ]
                                    )
                                ),
                                Container(
                                    padding : EdgeInsets.only(bottom : 10),
                                    color : Colors.white,
                                    child : Container(
                                      child : LinearPercentIndicator(
                                          padding : EdgeInsets.zero,
                                          percent: classList[position-1].progress,
                                          lineHeight: 7,
                                          backgroundColor: Color(0xffF1F1F5),
                                          progressColor: Color(0x442079ff)
                                      ),
                                    )
                                ),
                                Container(
                                    color : Colors.white,
                                    child : Container(
                                        height:1,
                                        color: Color(0xffDBDBDB)
                                    )
                                ),
                                Container(
                                    padding: EdgeInsets.only(top : 10, bottom : 10, left : 4, right : 4),
                                    color : Colors.white,
                                    child : Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children : <Widget>[
                                          Text("학습 시작일 ${DateFormat.yMMMd('en_US').format(classList[position-1].startTime)}",
                                              style: TextStyle(
                                                  fontFamily: 'NotoSansKR',
                                                  fontWeight: FontWeight.w500,
                                                  color : Color(0xff767676),
                                                  fontSize : 12
                                              )),
                                          Text("최근 학습일 ${DateFormat.yMMMd('en_US').format(classList[position-1].recentTime)}",
                                              style: TextStyle(
                                                  fontFamily: 'NotoSansKR',
                                                  fontWeight: FontWeight.w500,
                                                  color : Color(0xff2079FF),
                                                  fontSize : 12
                                              )),
                                        ]
                                    )
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                      color : Colors.white,
                                      borderRadius: BorderRadius.only(bottomLeft : Radius.circular(20), bottomRight: Radius.circular(20)),
                                    ),
                                    padding : EdgeInsets.only(bottom : 30),
                                    child : Container(
                                        height:1,
                                        color: Color(0xffDBDBDB)
                                    )
                                ),
                              ]
                          )
                      );
                    },
                  )
              )
          )
        ]
      )
      );

  }
}

