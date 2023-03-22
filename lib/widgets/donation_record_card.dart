import 'package:flutter/material.dart';

class DonationRecordCard extends StatelessWidget {
  const DonationRecordCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          height: 250,
          margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
          width: 250,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffE2EDFF), Color(0xffF7F5E1)], stops: [0, 1]),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Card(
            elevation: 0,
            color: Colors.transparent,
            surfaceTintColor: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                  width: 150,
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.transparent,
                        child: Text("25Days",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w700,
                                color: Color(0xff191919),
                                fontSize: 20)),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Icon(
                    Icons.local_library_outlined,
                    size: 120,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 8),
                    width: 200,
                    color: Colors.transparent,
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                          text: "인도네시아 남수마트라",
                          style: const TextStyle(
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 17,
                          ),
                          children: [
                            TextSpan(
                                text: "에\n",
                                style: const TextStyle(
                                    fontFamily: 'NotoSansKR',
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey,
                                    fontSize: 17),
                                children: [
                                  TextSpan(
                                      text: "2023년 5월 5일",
                                      style: const TextStyle(
                                          fontFamily: 'NotoSansKR',
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                          fontSize: 17),
                                      children: [
                                        TextSpan(
                                          text: " 기부했어요",
                                          style: const TextStyle(
                                              fontFamily: 'NotoSansKR',
                                              fontWeight: FontWeight.w700,
                                              color: Colors.grey,
                                              fontSize: 17),
                                        )
                                      ]),
                                ]),
                          ]),
                    )),
              ],
            ),
          ),
        ));
  }
}
