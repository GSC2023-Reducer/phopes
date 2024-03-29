import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'user_home_page.dart';

class FinishPhoneDontaion extends StatefulWidget {
  String authcode;
  FinishPhoneDontaion({
    required this.authcode,
    super.key,
  });
  @override
  State<FinishPhoneDontaion> createState() => _FinishPhoneDontaion();
}

class _FinishPhoneDontaion extends State<FinishPhoneDontaion> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String phoneCode = widget.authcode.substring(24);
    FirebaseFirestore db = FirebaseFirestore.instance;
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
                        Column(
                          children: [
                            const SizedBox(
                              height: 345 / 2,
                            ),
                            SizedBox(
                              height: 112 / 2,
                              width: 112 / 2,
                              child: Transform.scale(
                                scale: 3.1,
                                child: Checkbox(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3)),
                                  activeColor: const Color(0xff2079FF),
                                  value: true,
                                  onChanged: (value) {},
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  visualDensity:
                                      VisualDensity.adaptivePlatformDensity,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 28 / 2,
                            ),
                            const SizedBox(
                              height: 81 / 2,
                              width: 654 / 2,
                              child: Text(
                                'Donation completed!',
                                style: TextStyle(
                                    color: Color(0xff191919),
                                    letterSpacing: -1.05 / 2,
                                    fontSize: 42 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Bold',
                                    fontWeight: FontWeight.w900),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 36 / 2,
                            ),
                            SizedBox(
                              height: 80 / 2,
                              width: 654 / 2,
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Unlock-Phone Code : ' + phoneCode,
                                      style: const TextStyle(
                                        color: Color(0xff999999),
                                        fontSize: 28 / 2,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.7 / 2,
                                        fontFamily: 'Noto Sans CJK KR, Medium',
                                      ),
                                    ),
                                    const TextSpan(
                                      text:
                                          '\nPlease install the app and download the book!',
                                      style: TextStyle(
                                        color: Color(0xff999999),
                                        fontSize: 28 / 2,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.7 / 2,
                                        fontFamily: 'Noto Sans CJK KR, Medium',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
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
                              "Donation complete",
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
                          final data = <String, String>{
                            /*student에 필요한 데이터*/
                          };
                          /*phoneCode firebase - student collection에 넣기 */
                          db.collection("students").doc(phoneCode).set(data);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => UserHomePage(
                                  selectedCity: "", selectedPeriod: "")));
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
