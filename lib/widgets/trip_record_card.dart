import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../page_29.dart';
import '../page_30.dart';

class TripRecordCard extends StatelessWidget {
  String city;
  String period;
  TripRecordCard({super.key, required this.city, required this.period});
  DateTime now = DateTime.now();
  DateFormat format = DateFormat('yyyy.MM.dd');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          (now.isBefore(format.parse(period.split('~')[0])))
              ? Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AfterTravelDetails(
                        period: this.period,
                        region: this.city,
                      )))
              : Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BeforeTravelDetails(
                        period: this.period,
                        region: this.city,
                      )));
        },
        child: Container(
            height: 200,
            margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
            width: MediaQuery.of(context).size.width / 1,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 25,
                  offset: Offset(0, 8), // changes position of shadow
                ),
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffF7F5E1),
                    Color(0xffE2EDFF),
                  ],
                  stops: [
                    0.7,
                    1
                  ]),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children: [
                Container(
                  height: 120,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      image: DecorationImage(
                          image: AssetImage("repo/images/artikelbandung1.jpg"),
                          fit: BoxFit.fitWidth)),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 10, 0, 5),
                  width: MediaQuery.of(context).size.width / 1,
                  child: Text(
                    city,
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Text(
                    period,
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w700,
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            )));
  }
}
