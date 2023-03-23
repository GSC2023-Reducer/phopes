import 'package:flutter/material.dart';
import 'package:phopes/widgets/donation_record_card.dart';
import 'package:phopes/widgets/trip_register_card.dart';
import 'package:phopes/widgets/user_home_drawer.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _UserHomePage();
}

class _UserHomePage extends State<UserHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
            appBar: AppBar(
                elevation: 0.0,
                backgroundColor: const Color(0xff2079FF),
                centerTitle: true,
                title: const Text("Phopes",
                    style: TextStyle(
                        fontFamily: 'Modak',
                        fontWeight: FontWeight.w500,
                        color: Color(0xffFFFFFF),
                        fontSize: 24)),
                leading: Container()),
            endDrawer: const UserHomeDrawer(),
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff2079FF),
                    Color(0xff2079FF),
                    Colors.white,
                    Colors.white,
                  ],
                  stops: [0.0, 0.35, 0.35, 1.0],
                ),
              ),
              child: Column(children: [
                Container(
                    child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(5, 20, 110, 10),
                        child: Text("여행 가는 김에\n공기계 기부, 어떠세요?",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w700,
                                color: Color(0xffFFFFFF),
                                fontSize: 25))),
                    TripRegisterCard(),
                  ],
                )),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                  width: 500,
                  child: const Text("벌써 3개나 \n기부하셨네요!",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'NotoSansCJKKR',
                          fontWeight: FontWeight.w700,
                          color: Color(0xff191919),
                          fontSize: 25)),
                ),
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(20),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, position) {
                        return DonationRecordCard();
                      }),
                )
              ]),
            )));
  }
}
