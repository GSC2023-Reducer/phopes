import 'package:flutter/material.dart';
import 'package:phopes/select_region_page.dart';
import 'package:phopes/select_date_page.dart';
import 'package:phopes/check_before_donation.dart';

class TripRegisterCard extends StatelessWidget {
  String city;
  String period;
  TripRegisterCard({super.key, required this.city, required this.period});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.transparent),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      width: 350,
      height: 170,
      padding: EdgeInsets.all(10),
      child: Container(
        width: 200,
        height: 60,
        child: Column(children: [
          Container(
            height: 45,
            decoration:
                BoxDecoration(border: Border.all(color: Color(0xff707070))),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SelectRegionPage()));
                },
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text(city),
                    ],
                  ),
                )),
          ),
          Container(
            height: 45,
            decoration:
                BoxDecoration(border: Border.all(color: Color(0xff707070))),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SelectDatePage(city: city)));
                },
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.event_available_outlined),
                      Text(period),
                    ],
                  ),
                )),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
            width: 400,
            height: 40,
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CheckBeforeDonation()));
                },
                color: Colors.blueAccent,
                child: const Text(
                  "Registering a donation schedule",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'NotoSansKR',
                    fontWeight: FontWeight.w700,
                  ),
                )),
          )
        ]),
      ),
    );
  }
}
