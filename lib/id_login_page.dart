import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import "sign_page.dart";
import 'data/user.dart';
import 'models/auth_model.dart';
import 'models/login_model.dart';
import 'package:provider/provider.dart';

class IdLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => LoginModel(),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text("로그인",
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
            body: Column(children: [
              EmailInput(),
              PasswordInput(),
              AutoLogin(),
              LoginButton(),
              const SizedBox(height: 10),
              FindIdpw(),
              const SizedBox(height: 140),
              GotoSign()
            ])));
  }
}

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final login = Provider.of<LoginModel>(context, listen: false);
    return Column(
      children: [
        const SizedBox(
          width: 330,
          child: Text("일반회원\n로그인",
              style: TextStyle(
                  height: 1.3,
                  fontFamily: 'NotoSansKR',
                  fontWeight: FontWeight.w700,
                  color: Color(0xff191919),
                  fontSize: 30)),
        ),
        const SizedBox(height: 20),
        SizedBox(
            width: 340,
            child: TextField(
              onChanged: (email) {
                login.setEmail(email);
              },
              maxLines: 1,
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffffffff)),
                  ),
                  hintText: ('아이디 또는 이메일을 입력해주세요'),
                  hintStyle: TextStyle(
                      fontSize: 15,
                      color: Color(0xff999999),
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w500),
                  filled: true,
                  fillColor: Color(0xffF1F1F5)),
            )),
      ],
    );
  }
}

class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final login = Provider.of<LoginModel>(context, listen: false);
    return SizedBox(
        width: 340,
        child: TextField(
          onChanged: (password) {
            login.setPassword(password);
          },
          maxLines: 1,
          decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffffffff)),
              ),
              hintText: ('비밀번호를 입력해주세요'),
              hintStyle: TextStyle(
                fontSize: 15,
                color: Color(0xff999999),
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.w500,
              ),
              filled: true,
              fillColor: Color(0xffF1F1F5)),
        ));
  }
}

class FindIdpw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: RichText(
        text: TextSpan(children: [
          const TextSpan(
              text: '계정을 잊으셨나요?', style: TextStyle(color: Colors.black)),
          TextSpan(
              text: ' ID찾기',
              recognizer: TapGestureRecognizer()
                ..onTapDown = (details) {
                  //ID찾기로 넘어감
                },
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold)),
          const TextSpan(text: ' 또는', style: TextStyle(color: Colors.black)),
          TextSpan(
              text: ' 비밀번호 찾기',
              recognizer: TapGestureRecognizer()
                ..onTapDown = (details) {
                  //PW찾기로 넘어감
                },
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold)),
        ]),
      ),
    );
  }
}

class AutoLogin extends StatelessWidget {
  @override
  bool isChecked = false;
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
            child: Text("자동 로그인",
                style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    fontWeight: FontWeight.w500,
                    color: Color(0xff191919),
                    fontSize: 15))),
        SizedBox(
            child: Checkbox(
          activeColor: const Color(0xff2079FF),
          checkColor: Colors.white,
          value: isChecked,
          onChanged: (value) {
            isChecked = value!;
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          side: MaterialStateBorderSide.resolveWith(
            (states) => const BorderSide(width: 1.0, color: Color(0xffDBDBDB)),
          ),
        ))
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authClient =
        Provider.of<FirebaseAuthProvider>(context, listen: false);
    final login = Provider.of<LoginModel>(context, listen: false);

    return MaterialButton(
        minWidth: 340,
        height: 50,
        onPressed: () async {
          await authClient
              .loginWithEmail(login.email, login.password)
              .then((loginStatus) {
            if (loginStatus == AuthStatus.loginSuccess) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                  content: Text("환영합니다!"),
                ));
              Navigator.pushReplacementNamed(context, '/main');
            } else {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                  content: Text("로그인 실패"),
                ));
            }
          });
        },
        color: Colors.blueAccent,
        child: const Text("로그인",
            style: TextStyle(
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.w500,
                color: Color(0xffFFFFFF),
                fontSize: 17)));
  }
}

class GotoSign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: RichText(
        text: TextSpan(children: [
          const TextSpan(
              text: '아직 회원이 아니신가요?',
              style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  fontWeight: FontWeight.w500,
                  color: Color(0xff767676),
                  fontSize: 13)),
          TextSpan(
              text: ' 회원가입 >',
              recognizer: TapGestureRecognizer()
                ..onTapDown = (details) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignPage()));
                },
              style: const TextStyle(
                  fontFamily: 'NotoSansKR',
                  fontWeight: FontWeight.w500,
                  color: Color(0xff191919),
                  fontSize: 13)),
        ]),
      ),
    );
  }
}
