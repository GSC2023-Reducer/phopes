import 'package:flutter/material.dart';
import 'package:phopes/widgets/donation_record_card.dart';
import 'package:phopes/widgets/trip_register_card.dart';
import 'package:phopes/widgets/user_home_drawer.dart';
import 'package:phopes/select_region_page.dart';

class UserHomePage extends StatefulWidget {
  final String selectedCity;
  final String selectedPeriod;
  UserHomePage(
      {super.key, required this.selectedCity, required this.selectedPeriod});

  @override
  State<StatefulWidget> createState() => _UserHomePage();
}

class _UserHomePage extends State<UserHomePage> {
  late String cityName = "";
  late String periodName = "";
  @override
  void initState() {
    super.initState();
    cityName = widget.selectedCity;
    periodName = widget.selectedPeriod;
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
                        width: 654 / 2,
                        margin: EdgeInsets.fromLTRB(30, 20, 90, 20),
                        child: Text(
                            "How about donation \non your way to travel?",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w700,
                                color: Color(0xffFFFFFF),
                                fontSize: 25))),
                    TripRegisterCard(city: cityName, period: periodName),
                  ],
                )),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                  width: 500,
                  child: const Text("You already have donated\n3 phones!",
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
