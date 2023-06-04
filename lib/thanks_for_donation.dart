import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phopes/models/firebase/user_model.firebase.dart';
import 'package:phopes/provider/user_provider.dart';
import 'package:phopes/resources/firestore_methods.dart';
import 'package:phopes/utils.dart';
import 'package:provider/provider.dart';

class ThanksForDonation extends StatefulWidget {
  String region;
  String email;

  ThanksForDonation({super.key, required this.region, required this.email});

  @override
  State<ThanksForDonation> createState() => _ThanksForDonation();
}

class _ThanksForDonation extends State<ThanksForDonation> {
  Uint8List? _file;
  final TextEditingController _descriptionController = TextEditingController();
  bool _isLoading = false;
  String imageUrl = '';
  String text = '';
  User? user;

  Future<String> getCertificateImageUrl(String userEmail, String region) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userEmail)
        .collection('travels')
        .doc("travel - $region")
        .collection("certificate")
        .doc("image")
        .get();

    if (snapshot.exists) {
      final data = snapshot.data();
      imageUrl = data!['postUrl'].toString();
      text = data['description'].toString();
    } else {
      imageUrl = '';
      text = '';
    }

    return "success";
  }

  void postImage(
    String email,
  ) async {
    setState(() {
      _isLoading = true;
    });

    await FirestoreMethods().uploadPost(
      _descriptionController.text,
      _file!,
      email,
      widget.region,
    );
    setState(() {
      _isLoading = false;
    });
  }

  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('creat a post'),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a photo'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(
                    ImageSource.camera,
                  );
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choose from gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(
                    ImageSource.gallery,
                  );
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Cancel'),
                onPressed: () async {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

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
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<UserProvider>(context).getUser;
    if (user != null) {
      getCertificateImageUrl(widget.email, widget.region);
    }

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffF1F1F5),
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 120 / 2,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_outlined),
              onPressed: () {
                Navigator.pop(context);
              },
              color: const Color(0xff191919)),
          centerTitle: true,
          title: const Text(
            'Donation travel log',
            style: TextStyle(
              color: Color(0xff191919),
              fontSize: 40 / 2,
              fontFamily: 'Noto Sans CJK KR, Medium',
              letterSpacing: -1 / 2,
              fontWeight: FontWeight.w500,
            ),
          ),
          elevation: 0.0,
        ),
        body: user == null
            ? const Center(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: CircularProgressIndicator(
                    color: Color(0xff2079FF),
                  ),
                ),
              )
            : Stack(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              48 / 2, 70 / 2, 99 / 2, 40 / 2),
                          child: SizedBox(
                            height: 134 / 2,
                            width: 603 / 2,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        '${user?.username}, \nthank you for your',
                                    style: const TextStyle(
                                      color: Color(0XFF191919),
                                      fontSize: 44 / 2,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Noto Sans CJK KR, Bold',
                                    ),
                                  ),
                                  const TextSpan(
                                    text: ' Donation',
                                    style: TextStyle(
                                      color: Color(0xff2079FF),
                                      fontSize: 44 / 2,
                                      fontFamily: 'Noto Sans CJK KR, Bold',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: '!',
                                    style: TextStyle(
                                      color: Color(0XFF191919),
                                      fontSize: 44 / 2,
                                      fontFamily: 'Noto Sans CJK KR, Bold',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40 / 2,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0,
                                blurRadius: 7,
                                offset: const Offset(8 / 2, 10 / 2),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.fromLTRB(
                              25 / 2, 39 / 2, 26 / 2, 0),
                          width: 469 / 2,
                          height: 734 / 2,
                          child: Column(
                            children: [
                              GestureDetector(
                                onLongPress: () => _selectImage(context),
                                child: Container(
                                  height: 493 / 2,
                                  width: 418 / 2,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1 / 2,
                                      color: const Color(0xff707070),
                                    ),
                                    image: imageUrl == ''
                                        ? _file == null
                                            ? const DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/2.png'),
                                                fit: BoxFit.cover,
                                              )
                                            : DecorationImage(
                                                image: MemoryImage(
                                                  _file!,
                                                ),
                                                fit: BoxFit.fill,
                                                alignment:
                                                    FractionalOffset.topCenter)
                                        : DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              imageUrl,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10 / 2,
                              ),
                              SizedBox(
                                child: SizedBox(
                                  child: text == ''
                                      ? TextField(
                                          controller: _descriptionController,
                                          decoration: const InputDecoration(
                                            hintText:
                                                'write your description...',
                                            border: InputBorder.none,
                                          ),
                                          style: const TextStyle(
                                            fontSize: 40 / 2,
                                            fontFamily: 'NANUMPEN',
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0,
                                          ),
                                          maxLines: 2,
                                        )
                                      : Container(
                                          margin: const EdgeInsets.only(
                                            top: 20,
                                          ),
                                          child: Text(
                                            text,
                                            style: const TextStyle(
                                              fontSize: 40 / 2,
                                              fontFamily: 'NANUMPEN',
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0,
                                            ),
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20 / 2,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 49 / 2),
                          width: 654 / 2,
                          child: imageUrl == ""
                              ? TextButton(
                                  onPressed: () => postImage(
                                    user!.email,
                                  ),
                                  child: _isLoading
                                      ? const CircularProgressIndicator(
                                          color: Color(0xff2079FF),
                                        )
                                      : const Text(
                                          'UPLOAD',
                                          style: TextStyle(
                                            fontSize: 50 / 2,
                                            fontFamily:
                                                'Noto Sans CJK KR, Medium',
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0,
                                            color: Color(0xff2079FF),
                                          ),
                                        ),
                                )
                              : const Text(''),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 57 / 2),
                          width: 654 / 2,
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'You delivered ',
                                  style: TextStyle(
                                    color: Color(0xff999999),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: 'iPhone 6',
                                  style: TextStyle(
                                    color: Color(0xff2079FF),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: ' to ',
                                  style: TextStyle(
                                    color: Color(0xff999999),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: 'South Sumatra, Indonesia.',
                                  style: TextStyle(
                                    color: Color(0xff2079FF),
                                    fontSize: 32 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Medium',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 50,
                    child: Image.asset(
                      'assets/images/1.png',
                      height: 493 / 2 / 2,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
