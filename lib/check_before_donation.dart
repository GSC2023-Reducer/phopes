import 'package:flutter/material.dart';
import 'input_phone_info.dart';
import 'package:uuid/uuid.dart';

class CheckBeforeDonation extends StatefulWidget {
  String city;
  String period;
  CheckBeforeDonation({
    required this.city,
    required this.period,
    super.key,
  });

  @override
  State<CheckBeforeDonation> createState() => _CheckBeforeDonation();
}

class _CheckBeforeDonation extends State<CheckBeforeDonation> {
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        width: 700 / 2, // 375 -> 380-
                        child: Text(
                          'Precautions before donation',
                          style: TextStyle(
                              color: Color(0xff191919),
                              letterSpacing: -1.4 / 2,
                              fontSize: 56 / 2,
                              fontFamily: 'Noto Sans CJK KR, Bold',
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      const SizedBox(
                        height: 55 / 2,
                      ),
                      SizedBox(
                        height: 1100 / 2,
                        width: 654 / 2,
                        child: SingleChildScrollView(
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Unlock-phone checklist',
                                  style: TextStyle(
                                    color: Color(0XFF191919),
                                    fontSize: 40 / 2,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                  ),
                                ),
                                TextSpan(
                                  text: '\n1) It is essential to ',
                                  style: TextStyle(
                                    color: Color(0xff707070),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w500,
                                    height: 2,
                                  ),
                                ),
                                TextSpan(
                                  text: 'reset ',
                                  style: TextStyle(
                                    color: Color(0xff2079FF),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w600,
                                    height: 2,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'your phone according to personal information protection. \n2) Severe levels of ',
                                  style: TextStyle(
                                    color: Color(0xff707070),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w500,
                                    height: 2,
                                  ),
                                ),
                                TextSpan(
                                  text: 'mobile phone screen damage',
                                  style: TextStyle(
                                    color: Color(0xff2079FF),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w600,
                                    height: 2,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      ' can be difficult for children to watch.',
                                  style: TextStyle(
                                    color: Color(0xff707070),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w500,
                                    height: 2,
                                  ),
                                ),
                                TextSpan(
                                  text: '\n \nCheck the state of Unlock Phone',
                                  style: TextStyle(
                                    color: Color(0XFF191919),
                                    fontSize: 40 / 2,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                  ),
                                ),
                                TextSpan(
                                  text: '\n1) Please check if it has been ',
                                  style: TextStyle(
                                    color: Color(0xff707070),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w500,
                                    height: 2,
                                  ),
                                ),
                                TextSpan(
                                  text: 'lost ',
                                  style: TextStyle(
                                    color: Color(0xff2079FF),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w600,
                                    height: 2,
                                  ),
                                ),
                                TextSpan(
                                  text: 'or ',
                                  style: TextStyle(
                                    color: Color(0xff707070),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w500,
                                    height: 2,
                                  ),
                                ),
                                TextSpan(
                                  text: 'stolen.',
                                  style: TextStyle(
                                    color: Color(0xff2079FF),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w600,
                                    height: 2,
                                  ),
                                ),
                                TextSpan(
                                  text: '\n2) ...',
                                  style: TextStyle(
                                    color: Color(0xff707070),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w500,
                                    height: 2,
                                  ),
                                ),
                                TextSpan(
                                  text: '\n \nPhopes Promise!',
                                  style: TextStyle(
                                    color: Color(0XFF191919),
                                    fontSize: 40 / 2,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                  ),
                                ),
                                TextSpan(
                                  text: '\n1) It is only used for ',
                                  style: TextStyle(
                                    color: Color(0xff707070),
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w500,
                                    height: 2,
                                    fontSize: 32 / 2,
                                  ),
                                ),
                                TextSpan(
                                  text: 'educational purposes ',
                                  style: TextStyle(
                                    color: Color(0xff2079FF),
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w600,
                                    height: 2,
                                    fontSize: 32 / 2,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'for children in countries where the educational environment is difficult, and it is not used for any other purpose. \n2)...',
                                  style: TextStyle(
                                    color: Color(0xff707070),
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w500,
                                    height: 2,
                                    fontSize: 32 / 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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
                              builder: (context) => InputPhoneInfo(
                                  city: widget.city, period: widget.period)));
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
