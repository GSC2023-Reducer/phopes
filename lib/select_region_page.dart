import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:phopes/user_home_page.dart';

class SelectRegionPage extends StatefulWidget {
  const SelectRegionPage({super.key});
  @override
  State<StatefulWidget> createState() => _SelectRegionPage();
}

class _SelectRegionPage extends State<SelectRegionPage> {
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
            body: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                    width: 330,
                    child: const Text("Recent searches",
                        style: TextStyle(
                            height: 1.2,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w700,
                            color: Color(0xff191919),
                            fontSize: 24)),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                    width: 330,
                    child: const Text("A popular destination",
                        style: TextStyle(
                            height: 1.2,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w700,
                            color: Color(0xff191919),
                            fontSize: 24)),
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('destinations')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Text('Loading...');
                        }

                        final List<DocumentSnapshot> destinations =
                            snapshot.data!.docs;

                        return Wrap(
                            direction: Axis.horizontal, // 나열 방향
                            alignment: WrapAlignment.start, // 정렬 방식
                            spacing: 10, // 좌우 간격
                            runSpacing: 10, // 상하 간격
                            children: [
                              for (var data in destinations)
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 6, 10, 6),
                                  decoration:
                                      data.get('city').toString().length % 2 ==
                                              1
                                          ? BoxDecoration(
                                              color: const Color(0xffffffff),
                                              border: Border.all(
                                                color: const Color(0xff2079FF),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            )
                                          : BoxDecoration(
                                              color: const Color(0xff2079FF),
                                              border: Border.all(
                                                color: const Color(0xffffffff),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => UserHomePage(
                                              selectedCity: data.get('city'),
                                              selectedPeriod: ""),
                                        ),
                                      );
                                    },
                                    child: IntrinsicWidth(
                                      child: Row(
                                        children: [
                                          Text(
                                            data.get('city'),
                                            style: TextStyle(
                                              height: 1.2,
                                              fontFamily: 'NotoSansKR',
                                              fontWeight: FontWeight.w500,
                                              color: data
                                                              .get('city')
                                                              .toString()
                                                              .length %
                                                          2 ==
                                                      1
                                                  ? const Color(0xff191919)
                                                  : const Color(0xffffffff),
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            ]);
                      }),
                ],
              ),
            )));
  }
}
