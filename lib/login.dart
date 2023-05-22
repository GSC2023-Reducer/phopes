import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phopes/user_home_page.dart';
import 'code_login_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:phopes/models/user_model.dart' as model;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  Future<UserCredential> googleAuthSignIn() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final user = userCredential.user;

    // 만약 유저 정보가 있으면 실행을 안시키는 것도 효율적인 방법
    model.User userData = model.User(
        email: user!.email!,
        username: user.displayName!,
        joinedAt: user.metadata.creationTime!);

    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    await firestore.collection('users').doc(user.email).set(
          userData.toJson(),
        );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Login",
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
        body: Column(
          children: [
            const CodeLoginPage(),
            const SizedBox(
              height: 60,
            ),
            const SizedBox(
                child: Center(
                    child: Text("Or",
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w700,
                          color: Color(0xff767676),
                          fontSize: 13,
                        )))),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
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
                    onPressed: () async {
                      try {
                        // Sign in with Google
                        UserCredential userCredential =
                            await googleAuthSignIn();

                        // Check if sign-in was successful
                        if (userCredential.user != null) {
                          // Navigate to the next page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserHomePage(
                                      selectedCity: "",
                                      selectedPeriod: "",
                                    )),
                          );
                        }
                      } catch (e) {
                        // Handle sign-in error
                        print(e);
                      }
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
            ))
          ],
        ));
  }
}
