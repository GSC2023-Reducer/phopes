import 'package:flutter/material.dart';

class TripRecordCard extends StatelessWidget {
  String city;
  String period;
  TripRecordCard({super.key, required this.city, required this.period});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
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
