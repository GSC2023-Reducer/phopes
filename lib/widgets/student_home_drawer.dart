import 'package:flutter/material.dart';
import 'package:phopes/student_home_page.dart';
import 'package:phopes/study_plan_page.dart';
import 'package:phopes/update_page.dart';

class StudentHomeDrawer extends StatelessWidget {
  const StudentHomeDrawer({super.key});

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
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
              ),
            ),
            accountEmail: const Text(''),
            accountName: Row(
              children: <Widget>[
                const CircleAvatar(
                  radius: 26,
                  backgroundColor: Color(0xffF1F1F5),
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
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
                        child: Text('Since 2023. 01. 15.', //user정보로부터 받아야함
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
                title: const Text('Home',
                    style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w500,
                        color: Color(0xff767676),
                        fontSize: 20)),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StudentHomePage(),
                    ),
                  );
                }),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: ListTile(
              title: const Text('Study Plan',
                  style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w500,
                      color: Color(0xff767676),
                      fontSize: 20)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StudyPlanPage(),
                  ),
                );
              } /*학습플랜 창으로 넘어가기*/,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: ListTile(
              title: const Text('Update',
                  style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w500,
                      color: Color(0xff767676),
                      fontSize: 20)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdatePage(),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: ListTile(
                title: const Text('Logout',
                    style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w500,
                        color: Color(0xff767676),
                        fontSize: 20)),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed('/first');
                }),
          )
        ],
      ),
    );
  }
}
