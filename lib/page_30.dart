import 'package:flutter/material.dart';
import 'package:phopes/page_28.dart';
import 'package:phopes/thanks_for_donation.dart';

class BeforeTravelDetails extends StatefulWidget {
  String period;
  String region;

  BeforeTravelDetails({
    required this.period,
    required this.region,
    super.key,
  });

  @override
  State<BeforeTravelDetails> createState() => _BeforeTravelDetails();
}

class _BeforeTravelDetails extends State<BeforeTravelDetails> {
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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: const Text("Donation Travel Log",
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.w500,
                color: Color(0xff191919),
              )),
          backgroundColor: const Color(0xffffffff),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_outlined),
              onPressed: () {
                Navigator.pop(context);
              },
              color: const Color(0xff191919)),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 654 / 2,
                padding: EdgeInsets.fromLTRB(0, 105 / 2, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.period,
                      style: TextStyle(
                        color: Color(0xff999999),
                        fontFamily: 'Noto Sans CJK KR',
                        fontWeight: FontWeight.normal,
                        fontSize: 32 / 2,
                      ),
                    ),
                    SizedBox(
                      height: 20 / 2,
                    ),
                    Text(
                      widget.region,
                      style: TextStyle(
                        color: Color(0xff2079FF),
                        fontFamily: 'Noto Sans CJK KR',
                        fontWeight: FontWeight.bold,
                        fontSize: 50 / 2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 279 / 2,
              ),
              SizedBox(
                width: 654 / 2,
                child: MaterialButton(
                    elevation: 14,
                    minWidth: 340,
                    height: 104 / 2,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CheckPhoneDetail()),
                      );
                    },
                    color: Colors.blueAccent,
                    child: const Text(
                      "Un-lock Phone Info",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                      ),
                    )),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 654 / 2,
                child: MaterialButton(
                    elevation: 14,
                    minWidth: 340,
                    height: 104 / 2,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ThanksForDonation()),
                      );
                    },
                    color: Colors.blueAccent,
                    child: const Text(
                      "Donation Travel Log",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
