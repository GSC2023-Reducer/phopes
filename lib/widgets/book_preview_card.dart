import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:phopes/data/class.dart';

class BookPreviewCard extends StatelessWidget {
  final Class singleBook;

  const BookPreviewCard(this.singleBook, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      surfaceTintColor: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.only(bottom: 10),
              color: Colors.transparent,
              width: double.infinity,
              child: const Text("최근 수강한 강의",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w700,
                      color: Color(0xffFFFFFF),
                      fontSize: 25))),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffF1F1F5),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Image.asset(singleBook.imagePath, height: 200, width: 700),
          ),
          Container(
            color: Colors.white,
            child: Container(
                width: double.infinity,
                transform: Matrix4.translationValues(0.0, -13.0, 0.0),
                child: Text("   ${singleBook.className}",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                        color: Color(0xff191919),
                        fontSize: 20))),
          ),
          Container(
              padding: const EdgeInsets.only(bottom: 10, left: 4, right: 4),
              color: Colors.white,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text("나의 학습 진도율",
                        style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w500,
                            color: Color(0xff767676),
                            fontSize: 12)),
                    Text("${singleBook.progress * 100}%",
                        style: const TextStyle(
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w500,
                            color: Color(0xff767676),
                            fontSize: 12))
                  ])),
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            color: Colors.white,
            child: LinearPercentIndicator(
              padding: EdgeInsets.zero,
              percent: singleBook.progress,
              lineHeight: 7,
              backgroundColor: const Color(0xffF1F1F5),
              progressColor: const Color(0x442079ff),
            ),
          ),
          Container(
              color: Colors.white,
              child: Container(height: 1, color: const Color(0xffDBDBDB))),
          Container(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 4, right: 4),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                    "학습 시작일 ${DateFormat.yMMMd('en_US').format(singleBook.startTime)}",
                    style: const TextStyle(
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w500,
                        color: Color(0xff767676),
                        fontSize: 12)),
                Text(
                    "최근 학습일 ${DateFormat.yMMMd('en_US').format(singleBook.recentTime)}",
                    style: const TextStyle(
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w500,
                        color: Color(0xff2079FF),
                        fontSize: 12)),
              ],
            ),
          ),
          Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              padding: const EdgeInsets.only(bottom: 30),
              child: Container(height: 1, color: const Color(0xffDBDBDB))),
        ],
      ),
    );
  }
}
