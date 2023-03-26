import 'package:flutter/material.dart';
import 'finish_phone_donation.dart';

class CheckPhoneInfo extends StatefulWidget {
  String cellPhoneType;
  String cellPhoneMem;
  String serialNumber;

  CheckPhoneInfo({
    required this.cellPhoneMem,
    required this.cellPhoneType,
    required this.serialNumber,
    super.key,
  });

  @override
  State<CheckPhoneInfo> createState() => _CheckPhoneInfo();
}

class _CheckPhoneInfo extends State<CheckPhoneInfo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back_outlined),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: const Color(0xff191919)),
            centerTitle: true,
            elevation: 0.0,
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(48 / 2, 65 / 2, 48 / 2, 0),
            child: Center(
              child: Stack(
                children: [
                  SizedBox(
                    width: 654 / 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        const SizedBox(
                          height: 90 / 2,
                          width: 206 / 2,
                          child: Text(
                            'Phopes',
                            style: TextStyle(
                              color: Color(0xff2079FF),
                              letterSpacing: -1.6 / 2,
                              fontSize: 64 / 2,
                              fontFamily: 'Modak',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 81 / 2,
                          width: 654 / 2,
                          child: Text(
                            'Please Recheck the Input!',
                            style: TextStyle(
                                color: Color(0xff191919),
                                letterSpacing: -1.4 / 2,
                                fontSize: 56 / 2,
                                fontFamily: 'Noto Sans CJK KR, Bold',
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        const SizedBox(
                          height: 76 / 2,
                        ),
                        SizedBox(
                          height: 252 / 2,
                          child: Table(
                            columnWidths: const {
                              0: FlexColumnWidth(),
                              1: FixedColumnWidth(508 / 2)
                            },
                            border: TableBorder.symmetric(
                              inside: BorderSide.none,
                              outside: BorderSide.none,
                            ),
                            children: [
                              TableRow(
                                children: [
                                  const TableCell(
                                    child: SizedBox(
                                      height: 60 / 2,
                                      child: Text(
                                        'Model',
                                        style: TextStyle(
                                          color: Color(0xff999999),
                                          letterSpacing: -0.7 / 2,
                                          fontSize: 28 / 2,
                                          fontFamily:
                                              'Noto Sans CJK KR, Medium',
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Text(
                                      widget.cellPhoneType,
                                      style: const TextStyle(
                                        color: Color(0xff191919),
                                        letterSpacing: -0.8 / 2,
                                        fontSize: 32 / 2,
                                        fontFamily: 'Noto Sans CJK KR, Medium',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const TableRow(children: [
                                SizedBox(height: 20 / 2),
                                SizedBox(height: 20 / 2),
                              ]),
                              TableRow(
                                children: [
                                  const TableCell(
                                    child: SizedBox(
                                      height: 60 / 2,
                                      child: Text(
                                        'Memory',
                                        style: TextStyle(
                                          color: Color(0xff999999),
                                          letterSpacing: -0.7 / 2,
                                          fontSize: 28 / 2,
                                          fontFamily:
                                              'Noto Sans CJK KR, Medium',
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Text(
                                      widget.cellPhoneMem,
                                      style: const TextStyle(
                                        color: Color(0xff191919),
                                        letterSpacing: -0.8 / 2,
                                        fontSize: 32 / 2,
                                        fontFamily: 'Noto Sans CJK KR, Medium',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const TableRow(children: [
                                SizedBox(height: 20 / 2),
                                SizedBox(height: 20 / 2),
                              ]),
                              TableRow(
                                children: [
                                  const TableCell(
                                    child: SizedBox(
                                      height: 60 / 2,
                                      child: Text(
                                        'IMEI',
                                        style: TextStyle(
                                          color: Color(0xff999999),
                                          letterSpacing: -0.7 / 2,
                                          fontSize: 28 / 2,
                                          fontFamily:
                                              'Noto Sans CJK KR, Medium',
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Text(
                                      widget.serialNumber,
                                      style: const TextStyle(
                                        color: Color(0xff191919),
                                        letterSpacing: -0.8 / 2,
                                        fontSize: 32 / 2,
                                        fontFamily: 'Noto Sans CJK KR, Medium',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 76 / 2,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 81 / 2,
                    right: 17 / 2,
                    child: SizedBox(
                      height: 98 / 2,
                      width: 619 / 2,
                      child: FloatingActionButton.extended(
                        elevation: 3,
                        backgroundColor: const Color(0xff2079FF),
                        heroTag: 'next',
                        label: const SizedBox(
                          height: 44 / 2,
                          width: 574 / 2,
                          child: Center(
                            child: Text(
                              "Next step",
                              style: TextStyle(
                                fontSize: 32 / 2,
                                letterSpacing: -0.8 / 2,
                                fontFamily: 'Noto Sans CJK KR, Bold',
                                fontWeight: FontWeight.w700,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const FinishPhoneDontaion()));
                        },
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20 / 2)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
