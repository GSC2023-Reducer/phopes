import 'package:flutter/material.dart';
import 'package:phopes/user_home_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class IdLoginPage extends StatefulWidget {
  IdLoginPage({super.key});
  Future<UserCredential> googleAuthSignIn() async {
    //구글 Sign in 플로우 오픈!
    final GoogleSignInAccount? googleUser = await GoogleSignIn()?.signIn();

    //구글 인증 정보 읽어왓!
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    //읽어온 인증정보로 파이어베이스 인증 로그인!
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    //파이어 베이스 Signin하고 결과(userCredential) 리턴햇!
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

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
              googleAuthSignIn();
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) =>
              //         UserHomePage(selectedCity: "", selectedPeriod: "")));
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

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
