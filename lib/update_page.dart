import 'package:flutter/material.dart';
import 'package:phopes/widgets/book_preview_card.dart';
import 'package:phopes/widgets/student_home_drawer.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});

  @override
  State<StatefulWidget> createState() => _UpdatePage();
}

class _UpdatePage extends State<UpdatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: const Color(0xffFFFFFF),
            centerTitle: true,
            title: const Text("Phopes",
                style: TextStyle(
                    fontFamily: 'Modak',
                    fontWeight: FontWeight.w500,
                    color: Color(0xff2079FF),
                    fontSize: 24)),
            leading: Container()),
        endDrawer: const StudentHomeDrawer(),
        body: Column(
          children: [
            Container(
                alignment: Alignment.center,
                child: Text("3월 업데이트 목록",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                        color: Color(0xff191919),
                        fontSize: 30))),
            Card(
              elevation: 0,
              color: Colors.transparent,
              surfaceTintColor: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    decoration: const BoxDecoration(
                      color: Color(0xffF1F1F5),
                    ),
                    child: Image.asset("assets/images/littlePrince.jpg",
                        height: 220, width: 150),
                  ),
                  Container(
                    width: 150,
                    margin: EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: Colors.transparent,
                          child: Text("어린왕자",
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontFamily: 'NotoSansKR',
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff191919),
                                  fontSize: 15)),
                        ),
                        Checkbox(value: false, onChanged: (value) {}),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 5),
                      width: 150,
                      color: Colors.transparent,
                      child: Text("앙투안 마리 드 생택쥐페리",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontFamily: 'NotoSansKR',
                              fontWeight: FontWeight.w700,
                              color: Color(0xff767676),
                              fontSize: 15))),
                ],
              ),
            ),
          ],
        ));
  }
}
