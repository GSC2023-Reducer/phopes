import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phopes/select_region_page.dart';
import 'package:phopes/select_date_page.dart';
import 'package:phopes/check_before_donation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class TripRegisterCard extends StatelessWidget {
  String city;
  String period;
  TripRegisterCard({super.key, required this.city, required this.period});
  FirebaseFirestore db = FirebaseFirestore.instance;
  // Future getCurrentUser() async{
  //   FirebaseUser _user;
  //   _user = await FirebaseAuth.instance.currentUser()

  // }
  FirebaseAuth auth = FirebaseAuth.instance;
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
            offset: const Offset(0, 3),
          ),
        ],
      ),
      width: 350,
      height: 170,
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: 200,
        height: 60,
        child: Column(children: [
          Container(
            height: 45,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff707070))),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SelectRegionPage()));
                },
                child: Container(
                  child: Row(
                    children: [
                      const Icon(Icons.location_on_outlined),
                      Text(city),
                    ],
                  ),
                )),
          ),
          Container(
            height: 45,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff707070))),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SelectDatePage(city: city)));
                },
                child: Container(
                  child: Row(
                    children: [
                      const Icon(Icons.event_available_outlined),
                      Text(period),
                    ],
                  ),
                )),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            width: 400,
            height: 40,
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                onPressed: () {
                  var travelId = Uuid().v4();
                  final data = <String, String>{
                    "destination": city,
                    "period": period,
                    "owner": auth.currentUser!.displayName!,
                    "pid": travelId
                  };
                  db
                      .collection("users")
                      .doc(auth.currentUser!.email!)
                      .collection("travels")
                      .doc("travel - " + city)
                      .set(data)
                      .onError((e, _) => print("Error writing document: $e"));
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          CheckBeforeDonation(city: city, period: period)));
                },
                color: Colors.blueAccent,
                child: const Text(
                  "Register your donation schedule",
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
