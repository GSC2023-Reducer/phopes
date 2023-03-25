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
          title: const Text("Donation travel log",
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
                  "2023/03/25",
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
                  "the firth day of trip",
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
                city: 'Bandung, Indonesia', period: '2023.03.25 ~ 2023.03.27'),
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
                        'Upcoming trips',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        'Past trips',
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
                              "2023",
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
                              "▷ April 12",
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w500,
                                color: Color(0xff767676),
                                fontSize: 18,
                              ),
                            )),
                        TripRecordCard(
                            city: 'Ho Chi Minh, Vietnam',
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
                              "2023",
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
                              "▷ February 28th",
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w500,
                                color: Color(0xff767676),
                                fontSize: 18,
                              ),
                            )),
                        TripRecordCard(
                            city: 'South Sumatra, Indonesia',
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
