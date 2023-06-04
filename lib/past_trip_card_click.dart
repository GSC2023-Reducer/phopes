import 'package:flutter/material.dart';
import 'package:phopes/check_phone_info_travel.dart';
import 'package:phopes/models/firebase/user_model.firebase.dart';
import 'package:phopes/provider/user_provider.dart';
import 'package:phopes/thanks_for_donation.dart';
import 'package:provider/provider.dart';

class AfterTravelDetails extends StatefulWidget {
  String period;
  String region;

  AfterTravelDetails({
    required this.period,
    required this.region,
    super.key,
  });

  @override
  State<AfterTravelDetails> createState() => _AfterTravelDetails();
}

class _AfterTravelDetails extends State<AfterTravelDetails> {
  User? user;
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider userprovider = Provider.of(context, listen: false);
    await userprovider.refresUser();
  }

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<UserProvider>(context).getUser;
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
                padding: const EdgeInsets.fromLTRB(0, 105 / 2, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.period,
                      style: const TextStyle(
                        color: Color(0xff999999),
                        fontFamily: 'Noto Sans CJK KR',
                        fontWeight: FontWeight.normal,
                        fontSize: 32 / 2,
                      ),
                    ),
                    const SizedBox(
                      height: 20 / 2,
                    ),
                    Text(
                      widget.region,
                      style: const TextStyle(
                        color: Color(0xff2079FF),
                        fontFamily: 'Noto Sans CJK KR',
                        fontWeight: FontWeight.bold,
                        fontSize: 50 / 2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
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
              const SizedBox(
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
                            builder: (context) => ThanksForDonation(
                                  region: widget.region,
                                  email: user!.email,
                                )),
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
