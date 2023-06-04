import 'package:flutter/material.dart';

class CheckListBeforeStart extends StatefulWidget {
  const CheckListBeforeStart({
    super.key,
  });

  @override
  State<CheckListBeforeStart> createState() => _CheckListBeforeStart();
}

class _CheckListBeforeStart extends State<CheckListBeforeStart> {
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
                        // height: 81 / 2,
                        width: 450 / 2,
                        child: Text(
                          'Checklist before start',
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
                        // height: 1154 / 2,
                        width: 654 / 2,
                        child: SingleChildScrollView(
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: '\n',
                                  style: TextStyle(
                                    height: 2,
                                  ),
                                ),
                                TextSpan(
                                  text: '1) Did you pack your',
                                  style: TextStyle(
                                    color: Color(0xff707070),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.8 / 2,
                                    height: 3,
                                  ),
                                ),
                                TextSpan(
                                  text: ' phone',
                                  style: TextStyle(
                                    color: Color(0xff2079FF),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w600,
                                    height: 3,
                                    letterSpacing: 0.8 / 2,
                                  ),
                                ),
                                TextSpan(
                                  text: ' well? \n2) Did you download the',
                                  style: TextStyle(
                                    color: Color(0xff707070),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.8 / 2,
                                    height: 3,
                                  ),
                                ),
                                TextSpan(
                                  text: ' book?',
                                  style: TextStyle(
                                    color: Color(0xff2079FF),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w600,
                                    height: 3,
                                    letterSpacing: 0.8 / 2,
                                  ),
                                ),
                                TextSpan(
                                  text: '\n3) Is it a book that contains',
                                  style: TextStyle(
                                    color: Color(0xff707070),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w500,
                                    height: 3,
                                    letterSpacing: 0.8 / 2,
                                  ),
                                ),
                                TextSpan(
                                  text: ' the language of the country',
                                  style: TextStyle(
                                    color: Color(0xff2079FF),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w600,
                                    height: 3,
                                    letterSpacing: 0.8 / 2,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      ' you want to donate? \n4) Are you ready to tell the ',
                                  style: TextStyle(
                                    color: Color(0xff707070),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w500,
                                    height: 3,
                                    letterSpacing: 0.8 / 2,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Unlock-Phone Code',
                                  style: TextStyle(
                                    color: Color(0xff2079FF),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w600,
                                    height: 3,
                                    letterSpacing: 0.8 / 2,
                                  ),
                                ),
                                TextSpan(
                                  text: ' to Recipient?',
                                  style: TextStyle(
                                    color: Color(0xff707070),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w500,
                                    height: 3,
                                    letterSpacing: 0.8 / 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
