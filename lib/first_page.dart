import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'code_login_page.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
        onWillPop: () async => false,
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Scaffold(
            backgroundColor: Color(0xffE6E5E5),
            body: Container(
                child: Stack(
              children: <Widget>[
                Positioned(
                  top: 430,
                  left: 25,
                  child: Container(
                      width: 220,
                      height: 150,
                      child: Text("나의 공기계가\n아이들에게\n교육의 기회를",
                          style: TextStyle(
                              height: 1.2,
                              fontFamily: 'NotoSansKR',
                              fontWeight: FontWeight.w700,
                              color: Color(0xff707070),
                              fontSize: 36))),
                ),
                Positioned(
                  top: 575,
                  left: 25,
                  child: Container(
                      width: 250,
                      height: 100,
                      child: Text("나눔의 주인공이 되어보세요",
                          style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              fontWeight: FontWeight.w500,
                              color: Color(0xff707070),
                              fontSize: 15))),
                ),
                Positioned(
                  top: 575,
                  right: 25,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CodeLoginPage()));
                    },
                    child: Icon(Icons.arrow_forward_rounded),
                    backgroundColor: Color(0xff2079FF),
                  ),
                ),
              ],
            )),
          ),
        ));
  }
}
