import 'package:flutter/material.dart';
import 'package:phopes/user_home_page.dart';

class IdLoginPage extends StatelessWidget {
  const IdLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      children: [
        const SizedBox(
          width: 330,
          child: Text("Doner Login",
              style: TextStyle(
                  height: 1.3,
                  fontFamily: 'NotoSansKR',
                  fontWeight: FontWeight.w700,
                  color: Color(0xff191919),
                  fontSize: 30)),
        ),
        const SizedBox(height: 20),
        MaterialButton(
            minWidth: 340,
            height: 50,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      UserHomePage(selectedCity: "", selectedPeriod: "")));
            },
            color: Colors.blueAccent,
            child: const Text(
              "Google Account Login",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.w700,
              ),
            )),
      ],
    ));
  }
}
