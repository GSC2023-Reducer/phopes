import 'package:flutter/material.dart';
import 'package:phopes/widgets/trip_record_card.dart';

class TripRecordPage extends StatefulWidget {
  @override
  _TripRecordPage createState() => _TripRecordPage();
}

class _TripRecordPage extends State<TripRecordPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color(0xffFFFFFF),
          centerTitle: true,
          title: const Text("착한 여행 기록",
              style: TextStyle(
                  fontFamily: 'NotoSansCJKKR',
                  fontWeight: FontWeight.w500,
                  color: Color(0xff191919),
                  fontSize: 20)),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_outlined),
              onPressed: () {
                Navigator.pop(context);
              },
              color: const Color(0xff191919)),
        ),
        body: Column(
          children: [
            Column(children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                width: MediaQuery.of(context).size.width / 1,
                child: const Text(
                  "2023년 05월 31일",
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    fontWeight: FontWeight.w700,
                    color: Color(0xff767676),
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
                width: MediaQuery.of(context).size.width / 1,
                child: const Text(
                  "여행 2일차",
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    fontWeight: FontWeight.w700,
                    color: Color(0xff2079FF),
                    fontSize: 24,
                  ),
                ),
              )
            ]),
            TripRecordCard(
                city: '반둥, 인도네시아', period: '2023.03.22 ~ 2023.03.27'),
            const SizedBox(height: 10),
            Material(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                height: 50,
                decoration: BoxDecoration(),
                child: TabBar(
                  tabs: [
                    Container(
                      child: Text(
                        '다가오는 여행',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        '지난 여행',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                  indicatorWeight: 10.0,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Color(0xff2079FF),
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.black,
                  controller: _tabController,
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                            width: MediaQuery.of(context).size.width / 1,
                            child: const Text(
                              "2023년",
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            )),
                        Container(
                            margin: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                            width: MediaQuery.of(context).size.width / 1,
                            child: const Text(
                              "▷ 4월 12일",
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w500,
                                color: Color(0xff767676),
                                fontSize: 18,
                              ),
                            )),
                        TripRecordCard(
                            city: '호치민, 베트남',
                            period: '2023.04.12 ~ 2023.04.15'),
                      ],
                    ),
                    alignment: Alignment.center,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                            width: MediaQuery.of(context).size.width / 1,
                            child: const Text(
                              "2023년",
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            )),
                        Container(
                            margin: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                            width: MediaQuery.of(context).size.width / 1,
                            child: const Text(
                              "▷ 2월 28일",
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w500,
                                color: Color(0xff767676),
                                fontSize: 18,
                              ),
                            )),
                        TripRecordCard(
                            city: '남수마트라, 인도네시아',
                            period: '2023.02.24 ~ 2023.02.28'),
                      ],
                    ),
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
