import 'package:flutter/material.dart';

class ThanksForDonation extends StatefulWidget {
  const ThanksForDonation({
    super.key,
  });

  @override
  State<ThanksForDonation> createState() => _ThanksForDonation();
}

class _ThanksForDonation extends State<ThanksForDonation> {
  final String userName = 'Name';
  String imageUrl =
      'https://media.istockphoto.com/id/1078297298/ko/%EC%82%AC%EC%A7%84/%EC%8A%A4%EB%A7%88%ED%8A%B8%ED%8F%B0-%EB%B6%81%EB%B6%80-%EB%9D%BC%EC%98%A4%EC%8A%A4%EC%97%90%EC%84%9C-%EB%B9%8C%EB%A6%AC%EC%A7%80%EC%97%90-%EB%9D%BC%EC%98%A4%EC%8A%A4-%EC%9E%91%EC%9D%80-%EC%86%8C%EB%85%84.jpg?s=1024x1024&w=is&k=20&c=yUxf6sVBsdXnw1FVWK00oy4c5NIMYaWmJ8-bxeW2hbA=';
  TextEditingController _textEditingController = TextEditingController();
  String textMemo = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: const Color(0xffF1F1F5),
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 120 / 2,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_outlined),
              onPressed: () {
                Navigator.pop(context);
              },
              color: const Color(0xff191919)),
          centerTitle: true,
          title: const Text(
            '착한 여행 기록',
            style: TextStyle(
              color: Color(0xff191919),
              fontSize: 40 / 2,
              fontFamily: 'Noto Sans CJK KR, Medium',
              letterSpacing: -1 / 2,
              fontWeight: FontWeight.w500,
            ),
          ),
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                        48 / 2, 70 / 2, 99 / 2, 40 / 2),
                    child: SizedBox(
                      height: 134 / 2,
                      width: 603 / 2,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '$userName 님, \n나눔에',
                              style: const TextStyle(
                                color: Color(0XFF191919),
                                fontSize: 44 / 2,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Noto Sans CJK KR, Bold',
                              ),
                            ),
                            const TextSpan(
                              text: ' 참여',
                              style: TextStyle(
                                color: Color(0xff2079FF),
                                fontSize: 44 / 2,
                                fontFamily: 'Noto Sans CJK KR, Bold',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const TextSpan(
                              text: '해주셔서 감사합니다!',
                              style: TextStyle(
                                color: Color(0XFF191919),
                                fontSize: 44 / 2,
                                fontFamily: 'Noto Sans CJK KR, Bold',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0,
                          blurRadius: 7,
                          offset: const Offset(8 / 2, 10 / 2),
                        ),
                      ],
                    ),
                    padding:
                        const EdgeInsets.fromLTRB(25 / 2, 39 / 2, 26 / 2, 0),
                    width: 469 / 2,
                    height: 734 / 2,
                    child: Column(
                      children: [
                        GestureDetector(
                          onLongPress: () {
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: const Text('앨범에서 사진을 선택하세요.'),
                                  actions: [
                                    TextButton(
                                      child: const Text('확인'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 493 / 2,
                            width: 418 / 2,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1 / 2,
                                color: const Color(0xff707070),
                              ),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/2.png'),
                                // image: (changeImage == false)
                                //     ?  AssetImage('assets/images/2.png')
                                //     :  NetworkImage(imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 78 / 2,
                        ),
                        GestureDetector(
                          onLongPress: () {
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: const Text('원하는 글을 입력하세요.'),
                                  actions: [
                                    TextButton(
                                      child: const Text('확인'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const SizedBox(
                            width: 256 / 2,
                            height: 57 / 2,
                            child: Text(
                              '문구를 입력해주세요',
                              style: TextStyle(
                                fontSize: 50 / 2,
                                fontFamily: 'NANUMPEN',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 57 / 2),
                    width: 654 / 2,
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: '인도네시아 남수마트라',
                            style: TextStyle(
                              color: Color(0xff2079FF),
                              fontSize: 32 / 2,
                              fontFamily: 'Noto Sans CJK KR, Medium',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0,
                            ),
                          ),
                          TextSpan(
                            text: '에, ',
                            style: TextStyle(
                              color: Color(0xff999999),
                              fontSize: 32 / 2,
                              fontFamily: 'Noto Sans CJK KR, Medium',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'iphone6',
                            style: TextStyle(
                              color: Color(0xff2079FF),
                              fontSize: 32 / 2,
                              fontFamily: 'Noto Sans CJK KR, Medium',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0,
                            ),
                          ),
                          TextSpan(
                            text: '를 전달했어요',
                            style: TextStyle(
                              color: Color(0xff999999),
                              fontSize: 32 / 2,
                              fontFamily: 'Noto Sans CJK KR, Medium',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 49 / 2),
                    width: 654 / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 135 / 2,
                          height: 40 / 2,
                          child: Text(
                            '메모 남기기',
                            style: TextStyle(
                              color: Color(0xff999999),
                              fontSize: 28 / 2,
                              fontFamily: 'Noto Sans CJK KR, Medium',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40 / 2,
                          height: 40 / 2,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            // {
                            //   setState(() {
                            //     textMemo = _textEditingController.text;
                            //   });
                            // },
                            icon: const Icon(
                              Icons.add,
                              color: Color(0xff999999),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 27 / 2),
                    width: 654 / 2,
                    child: Image.asset('assets/images/3.png'),
                  )
                ],
              ),
            ),
            Positioned(
              top: 100,
              left: 50,
              child: Image.asset(
                'assets/images/1.png',
                height: 493 / 2 / 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
