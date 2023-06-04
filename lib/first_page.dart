import 'package:flutter/material.dart';
import 'package:phopes/login.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
            backgroundColor: const Color(0xffE6E5E5),
            body: Stack(
              children: <Widget>[
                const Positioned(
                  top: 340,
                  left: 25,
                  child: SizedBox(
                      width: 654 / 2,
                      height: 300,
                      child: Text(
                          "Give an\nopportunity of learning\nThrough your\nUnlock-Phone",
                          style: TextStyle(
                              height: 1.2,
                              fontFamily: 'NotoSansKR',
                              fontWeight: FontWeight.w700,
                              color: Color(0xff707070),
                              fontSize: 35))),
                ),
                const Positioned(
                  top: 575,
                  left: 25,
                  child: SizedBox(
                      width: 250,
                      height: 100,
                      child: Text("Be the Hope of global friends",
                          style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              fontWeight: FontWeight.w500,
                              color: Color(0xff707070),
                              fontSize: 15))),
                ),
                Positioned(
                  top: 575,
                  right: 25,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                    },
                    backgroundColor: const Color(0xff2079FF),
                    child: const Icon(Icons.arrow_forward_rounded),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
