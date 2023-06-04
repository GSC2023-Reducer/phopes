import 'package:flutter/material.dart';

class CheckPhoneDetail extends StatefulWidget {
  const CheckPhoneDetail({
    super.key,
  });

  @override
  State<CheckPhoneDetail> createState() => _CheckPhoneDetail();
}

class _CheckPhoneDetail extends State<CheckPhoneDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List a = ['iPhone 6', 'IMEI xxxxxxx', 'auth code xxxxxxx', '256GB'];
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
              child: SizedBox(
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
                        'Donated Un-lock Phone',
                        style: TextStyle(
                            color: Color(0xff191919),
                            letterSpacing: -1.4 / 2,
                            fontSize: 56 / 2,
                            fontFamily: 'Noto Sans CJK KR, Bold',
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 310 / 2,
                            ),
                            SizedBox(
                              width: 140 / 2,
                              height: 200 / 2,
                              child: Image(
                                image: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDA8HTHt76LPXyJjf6fHtAipZtFS2C1z0nUQ&usqp=CAU'),
                              ),
                            ),
                            SizedBox(
                              height: 70 / 2,
                            ),
                            SizedBox(
                              width: 296 / 2,
                              height: 232 / 2,
                              child: ListView.builder(
                                itemCount: 4,
                                itemBuilder: (BuildContext ctx, int index) {
                                  return SizedBox(
                                    height: 56 / 2,
                                    child: Text(
                                      '${a[index]}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xff999999),
                                        letterSpacing: -0.9 / 2,
                                        fontSize: 36 / 2,
                                        fontFamily: 'Noto Sans CJK KR',
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
