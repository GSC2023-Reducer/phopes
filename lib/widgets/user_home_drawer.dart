import 'package:flutter/material.dart';
import 'package:phopes/trip_record_page.dart';

class UserHomeDrawer extends StatelessWidget {
  const UserHomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0))),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
              ),
            ),
            accountEmail: Text(''),
            accountName: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 26,
                  backgroundColor: Color(0xffF1F1F5),
                ),
                SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 110,
                      child: Text(
                        'Name',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w700,
                          color: Color(0xff767676),
                          fontSize: 24,
                        ),
                      ),
                    ),
                    SizedBox(
                        width: 110,
                        child: Text('2023년 1월 15일부터 함께했어요', //user정보로부터 받아야함
                            style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w500,
                                color: Color(0xff999999),
                                fontSize: 12)))
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: ListTile(
                title: const Text('홈',
                    style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w500,
                        color: Color(0xff767676),
                        fontSize: 20)),
                onTap: () {} /*홈이면 그냥 다른 곳 탭해도 되지않나? 홈 listtile이 굳이 필요?*/
                ),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: ListTile(
                  title: const Text('착한 여행 기록',
                      style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w500,
                          color: Color(0xff767676),
                          fontSize: 20)),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TripRecordPage()));
                  } /*나의 여행기록 창으로 넘어가기*/
                  )),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: ListTile(
                title: const Text('공기계 정보 수정하기',
                    style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w500,
                        color: Color(0xff767676),
                        fontSize: 20)),
                onTap: () {
                  //공기계 정보 수정하는 창으로 넘어가기//
                }),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: ListTile(
                title: const Text('유의사항',
                    style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w500,
                        color: Color(0xff767676),
                        fontSize: 20)),
                onTap: () {
                  //유의사항 보여주는 창으로 넘어가기//
                }),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: ListTile(
                title: const Text('로그아웃',
                    style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w500,
                        color: Color(0xff767676),
                        fontSize: 20)),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/first');
                }),
          )
        ],
      ),
    );
  }
}
