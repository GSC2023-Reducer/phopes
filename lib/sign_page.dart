// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// // import 'models/auth_model.dart';
// // import 'models/sign_model.dart';

// class SignPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//         create: (_) => SignModel(),
//         child: Scaffold(
//             appBar: AppBar(
//               title: const Text("회원가입",
//                   style: TextStyle(
//                     fontFamily: 'NotoSansKR',
//                     fontWeight: FontWeight.w500,
//                     color: Color(0xff191919),
//                   )),
//               backgroundColor: const Color(0xffffffff),
//               leading: IconButton(
//                   icon: const Icon(Icons.arrow_back_outlined),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   color: const Color(0xff191919)),
//             ),
//             body: Column(
//               children: [
//                 EmailInput(),
//                 const SizedBox(height: 10),
//                 PasswordInput(),
//                 const SizedBox(height: 10),
//                 PasswordConfirmInput(),
//                 const SizedBox(height: 10),
//                 RegisterButton(),
//               ],
//             )));
//   }
// }

// class EmailInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final register = Provider.of<SignModel>(context, listen: false);
//     return Column(children: <Widget>[
//       const SizedBox(
//         width: 330,
//         child: Text("아이디 생성",
//             style: TextStyle(
//                 height: 1.2,
//                 fontFamily: 'NotoSansKR',
//                 fontWeight: FontWeight.w700,
//                 color: Color(0xff191919),
//                 fontSize: 20)),
//       ),
//       const SizedBox(height: 10),
//       SizedBox(
//           width: 340,
//           child: TextField(
//             onChanged: (email) {
//               register.setEmail(email);
//             },
//             maxLines: 1,
//             decoration: const InputDecoration(
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Color(0xffffffff)),
//                 ),
//                 labelText: ('이메일을 입력해주세요'),
//                 hintText: 'aaabbb@naver.com',
//                 hintStyle: TextStyle(
//                     fontSize: 15,
//                     color: Color(0xff999999),
//                     fontFamily: 'NotoSansKR',
//                     fontWeight: FontWeight.w500),
//                 filled: true,
//                 fillColor: Color(0xffF1F1F5)),
//           ))
//     ]);
//   }
// }

// class PasswordInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final register = Provider.of<SignModel>(context);
//     return Column(
//       children: [
//         const SizedBox(
//           width: 330,
//           child: Text("비밀번호 생성",
//               style: TextStyle(
//                   height: 1.2,
//                   fontFamily: 'NotoSansKR',
//                   fontWeight: FontWeight.w700,
//                   color: Color(0xff191919),
//                   fontSize: 20)),
//         ),
//         const SizedBox(height: 10),
//         SizedBox(
//             width: 340,
//             child: TextField(
//               onChanged: (password) {
//                 register.setPassword(password);
//               },
//               obscureText: true,
//               maxLines: 1,
//               decoration: const InputDecoration(
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Color(0xffffffff)),
//                 ),
//                 labelText: ('비밀번호를 입력해주세요'),
//                 hintText: '6자 이상 입력해주세요',
//                 hintStyle: TextStyle(
//                     fontSize: 15,
//                     color: Color(0xff999999),
//                     fontFamily: 'NotoSansKR',
//                     fontWeight: FontWeight.w500),
//                 filled: true,
//                 fillColor: Color(0xffF1F1F5),
//                 // errorText: register.password != register.passwordConfirm ? 'Password incorrect' : null
//               ),
//             ))
//       ],
//     );
//   }
// }

// class PasswordConfirmInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final register = Provider.of<SignModel>(context, listen: false);
//     return Column(children: [
//       const SizedBox(
//         width: 330,
//         child: Text("비밀번호 확인",
//             style: TextStyle(
//                 height: 1.2,
//                 fontFamily: 'NotoSansKR',
//                 fontWeight: FontWeight.w700,
//                 color: Color(0xff191919),
//                 fontSize: 20)),
//       ),
//       const SizedBox(height: 10),
//       SizedBox(
//           width: 340,
//           child: TextField(
//             onChanged: (password) {
//               register.setPasswordConfirm(password);
//             },
//             obscureText: true,
//             maxLines: 1,
//             decoration: const InputDecoration(
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Color(0xffffffff)),
//                 ),
//                 labelText: ('비밀번호 확인'),
//                 hintStyle: TextStyle(
//                     fontSize: 15,
//                     color: Color(0xff999999),
//                     fontFamily: 'NotoSansKR',
//                     fontWeight: FontWeight.w500),
//                 filled: true,
//                 fillColor: Color(0xffF1F1F5)),
//           ))
//     ]);
//   }
// }

// class RegisterButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final authClient =
//         Provider.of<FirebaseAuthProvider>(context, listen: false);
//     final register = Provider.of<SignModel>(context);
//     return MaterialButton(
//         onPressed: (register.password != register.passwordConfirm)
//             ? null
//             : () async {
//                 await authClient
//                     .registerWithEmail(register.email, register.password)
//                     .then((registerStatus) {
//                   if (registerStatus == AuthStatus.registerSuccess) {
//                     ScaffoldMessenger.of(context)
//                       ..hideCurrentSnackBar()
//                       ..showSnackBar(SnackBar(content: Text("회원가입이 완료되었습니다")));
//                     Navigator.pop(context);
//                   } else {
//                     ScaffoldMessenger.of(context)
//                       ..hideCurrentSnackBar()
//                       ..showSnackBar(SnackBar(content: Text("다시 시도해주세요")));
//                   }
//                 });
//               },
//         color: Colors.blueAccent,
//         child: const Text('회원가입', style: TextStyle(color: Colors.white)));
//   }
// }
