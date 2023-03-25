import 'package:flutter/material.dart';
import 'package:phopes/widgets/donation_record_card.dart';
import 'package:phopes/widgets/trip_register_card.dart';
import 'package:phopes/widgets/user_home_drawer.dart';

class SelectRegionPage extends StatefulWidget {
  const SelectRegionPage({super.key});

  @override
  State<StatefulWidget> createState() => _SelectRegionPage();
}

class _SelectRegionPage extends State<SelectRegionPage> {
  List<String> cities = [
    "Jakarta",
    "Ho Chi Minh",
    "Hanoi",
    "Manila",
    "Phnom Penh",
    "Kuala Lumpur",
    "Bangkok",
    "Cebu",
    "Boracay",
    "Cancun"
  ];
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
                backgroundColor: const Color(0xffFFFFFF),
                title: const Text("Search by city or airport name",
                    style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w500,
                        color: Color(0xff999999),
                        fontSize: 15)),
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back_outlined),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: const Color(0xff191919))),
            body: Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 40),
                      width: 330,
                      child: Text("Recent searches",
                          style: TextStyle(
                              height: 1.2,
                              fontFamily: 'NotoSansKR',
                              fontWeight: FontWeight.w700,
                              color: Color(0xff191919),
                              fontSize: 24)),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 30),
                      width: 330,
                      child: Text("a popular destination",
                          style: TextStyle(
                              height: 1.2,
                              fontFamily: 'NotoSansKR',
                              fontWeight: FontWeight.w700,
                              color: Color(0xff191919),
                              fontSize: 24)),
                    ),
                    Wrap(
                      direction: Axis.horizontal, // 나열 방향
                      alignment: WrapAlignment.start, // 정렬 방식
                      spacing: 10, // 좌우 간격
                      runSpacing: 10, // 상하 간격
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                          decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              border: Border.all(color: Color(0xff2079FF)),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(cities[0],
                              style: TextStyle(
                                  height: 1.2,
                                  fontFamily: 'NotoSansKR',
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff191919),
                                  fontSize: 15)),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                          decoration: BoxDecoration(
                              color: const Color(0xff2079FF),
                              border: Border.all(color: Color(0xff2079FF)),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            cities[1],
                            style: TextStyle(
                                height: 1.2,
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 15),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                          decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              border: Border.all(color: Color(0xff2079FF)),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(cities[2],
                              style: TextStyle(
                                  height: 1.2,
                                  fontFamily: 'NotoSansKR',
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff191919),
                                  fontSize: 15)),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                          decoration: BoxDecoration(
                              color: const Color(0xff2079FF),
                              border: Border.all(color: Color(0xff2079FF)),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            cities[3],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                          decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              border: Border.all(color: Color(0xff2079FF)),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(cities[4],
                              style: TextStyle(
                                  height: 1.2,
                                  fontFamily: 'NotoSansKR',
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff191919),
                                  fontSize: 15)),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                          decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              border: Border.all(color: Color(0xff2079FF)),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(cities[5],
                              style: TextStyle(
                                  height: 1.2,
                                  fontFamily: 'NotoSansKR',
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff191919),
                                  fontSize: 15)),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                          decoration: BoxDecoration(
                              color: const Color(0xff2079FF),
                              border: Border.all(color: Color(0xff2079FF)),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            cities[6],
                            style: TextStyle(
                                height: 1.2,
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 15),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                          decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              border: Border.all(color: Color(0xff2079FF)),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(cities[7],
                              style: TextStyle(
                                  height: 1.2,
                                  fontFamily: 'NotoSansKR',
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff191919),
                                  fontSize: 15)),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                          decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              border: Border.all(color: Color(0xff2079FF)),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(cities[8],
                              style: TextStyle(
                                  height: 1.2,
                                  fontFamily: 'NotoSansKR',
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff191919),
                                  fontSize: 15)),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                          decoration: BoxDecoration(
                            color: const Color(0xff2079FF),
                            border: Border.all(color: Color(0xff2079FF)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            cities[9],
                            style: TextStyle(
                                height: 1.2,
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )));
  }
}
