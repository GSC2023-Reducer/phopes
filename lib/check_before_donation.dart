import 'package:flutter/material.dart';
import 'input_phone_info.dart';

class CheckBeforeDonation extends StatefulWidget {
  const CheckBeforeDonation({
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
                        width: 380 / 2, // 375 -> 380-
                        child: Text(
                          '기부 전 유의사항',
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
                        height: 1100 / 2, //1154하면 화면 넘침
                        width: 654 / 2,
                        child: SingleChildScrollView(
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: '공기계 체크사항',
                                  style: TextStyle(
                                    color: Color(0XFF191919),
                                    fontSize: 40 / 2,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                  ),
                                ),
                                TextSpan(
                                  text: '\n1) 개인정보보호에 따라 ',
                                  style: TextStyle(
                                    color: Color(0xff707070),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w500,
                                    height: 2,
                                  ),
                                ),
                                TextSpan(
                                  text: '초기화',
                                  style: TextStyle(
                                    color: Color(0xff2079FF),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w600,
                                    height: 2,
                                  ),
                                ),
                                TextSpan(
                                  text: '는 필수입니다. \n2) 심한 수준의 ',
                                  style: TextStyle(
                                    color: Color(0xff707070),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w500,
                                    height: 2,
                                  ),
                                ),
                                TextSpan(
                                  text: '액정 손상',
                                  style: TextStyle(
                                    color: Color(0xff2079FF),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w600,
                                    height: 2,
                                  ),
                                ),
                                TextSpan(
                                  text: '은 아이들의 시청이 어려울 수 있습니다.',
                                  style: TextStyle(
                                    color: Color(0xff707070),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w500,
                                    height: 2,
                                  ),
                                ),
                                TextSpan(
                                  text: '\n \n공기계 정상 여부 확인',
                                  style: TextStyle(
                                    color: Color(0XFF191919),
                                    fontSize: 40 / 2,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                  ),
                                ),
                                TextSpan(
                                  text: '\n1) ',
                                  style: TextStyle(
                                    color: Color(0xff707070),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w500,
                                    height: 2,
                                  ),
                                ),
                                TextSpan(
                                  text: '분실 ',
                                  style: TextStyle(
                                    color: Color(0xff2079FF),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w600,
                                    height: 2,
                                  ),
                                ),
                                TextSpan(
                                  text: '또는 ',
                                  style: TextStyle(
                                    color: Color(0xff707070),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w500,
                                    height: 2,
                                  ),
                                ),
                                TextSpan(
                                  text: '도난',
                                  style: TextStyle(
                                    color: Color(0xff2079FF),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w600,
                                    height: 2,
                                  ),
                                ),
                                TextSpan(
                                  text: ' 되지 않았는지 확인 부탁드립니다. \n2) ...',
                                  style: TextStyle(
                                    color: Color(0xff707070),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w500,
                                    height: 2,
                                  ),
                                ),
                                TextSpan(
                                  text: '\n \nPhopes에서는 이렇게 사용됩니다.',
                                  style: TextStyle(
                                    color: Color(0XFF191919),
                                    fontSize: 40 / 2,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                  ),
                                ),
                                TextSpan(
                                  text: '\n1) 교육 환경이 어려운 국가의 아이들을 위한 ',
                                  style: TextStyle(
                                    color: Color(0xff707070),
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w500,
                                    height: 2,
                                    fontSize: 32 / 2,
                                  ),
                                ),
                                TextSpan(
                                  text: '교육적 목적',
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
                                      '으로 쓰일 뿐, 다른 의도로는 일체 사용되지 않습니다. \n2)...',
                                  style: TextStyle(
                                    color: Color(0xff707070),
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w500,
                                    height: 2,
                                    fontSize: 32 / 2,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      '으로 쓰일 뿐, 다른 의도로는 일체 사용되지 않습니다. \n2)...',
                                  style: TextStyle(
                                    color: Color(0xff707070),
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w500,
                                    height: 2,
                                    fontSize: 32 / 2,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      '으로 쓰일 뿐, 다른 의도로는 일체 사용되지 않습니다. \n2)...',
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
                              "다음 단계",
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
                              builder: (context) => const InputPhoneInfo()));
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
