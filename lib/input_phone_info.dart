import 'package:flutter/material.dart';
import 'check_phone_info.dart';

class InputPhoneInfo extends StatefulWidget {
  const InputPhoneInfo({
    super.key,
  });

  @override
  State<InputPhoneInfo> createState() => _InputPhoneInfo();
}

class _InputPhoneInfo extends State<InputPhoneInfo> {
  bool inputDadaCheck = false;
  String cellPhoneType = '';
  String cellPhoneMem = '';
  String serialNumber = '';

  final TextEditingController textEditingController = TextEditingController();
  bool isTextFieldVisible = false;

  TextEditingController _textEditingController = TextEditingController();
  List<String> _memoNotes = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          setState(() {
            isTextFieldVisible = false;
          });
        },
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
                child: Stack(
                  children: [
                    SizedBox(
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
                            width: 380 / 2, // 375 -> 380-
                            child: Text(
                              '공기계 정보 입력',
                              style: TextStyle(
                                  color: Color(0xff191919),
                                  letterSpacing: -1.4 / 2,
                                  fontSize: 56 / 2,
                                  fontFamily: 'Noto Sans CJK KR, Bold',
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          const SizedBox(
                            height: 76 / 2,
                          ),
                          SizedBox(
                            height: 252 / 2,
                            child: Table(
                              columnWidths: const {
                                0: FlexColumnWidth(),
                                1: FixedColumnWidth(508 / 2)
                              },
                              border: TableBorder.symmetric(
                                inside: BorderSide.none,
                                outside: BorderSide.none,
                              ),
                              children: [
                                TableRow(
                                  children: [
                                    const TableCell(
                                      child: SizedBox(
                                        height: 60 / 2,
                                        child: Text(
                                          '기종',
                                          style: TextStyle(
                                            color: Color(0xff999999),
                                            letterSpacing: -0.7 / 2,
                                            fontSize: 28 / 2,
                                            fontFamily:
                                                'Noto Sans CJK KR, Medium',
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 60 / 2,
                                        child: TextField(
                                          textAlignVertical:
                                              TextAlignVertical.bottom,
                                          decoration: InputDecoration(
                                            hintText: 'ex ) iphone 11 …',
                                            hintStyle: TextStyle(
                                              color: const Color(0xff999999)
                                                  .withOpacity(0.5),
                                              letterSpacing: -0.7 / 2,
                                              fontSize: 28 / 2,
                                              fontFamily:
                                                  'Noto Sans CJK KR, Medium',
                                            ),
                                            border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.zero,
                                            ),
                                          ),
                                          onChanged: (value) {
                                            cellPhoneType = value;
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const TableRow(children: [
                                  SizedBox(height: 36 / 2),
                                  SizedBox(height: 36 / 2),
                                ]),
                                TableRow(
                                  children: [
                                    const TableCell(
                                      child: Text(
                                        '메모리',
                                        style: TextStyle(
                                          color: Color(0xff999999),
                                          letterSpacing: -0.7 / 2,
                                          fontSize: 28 / 2,
                                          fontFamily:
                                              'Noto Sans CJK KR, Medium',
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 60 / 2,
                                        child: TextField(
                                          textAlignVertical:
                                              TextAlignVertical.bottom,
                                          decoration: InputDecoration(
                                            hintText: 'ex ) 64GB …',
                                            hintStyle: TextStyle(
                                              color: const Color(0xff999999)
                                                  .withOpacity(0.5),
                                              letterSpacing: -0.7 / 2,
                                              fontSize: 28 / 2,
                                              fontFamily:
                                                  'Noto Sans CJK KR, Medium',
                                            ),
                                            border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.zero,
                                            ),
                                          ),
                                          onChanged: (value) {
                                            cellPhoneMem = value;
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const TableRow(children: [
                                  SizedBox(height: 36 / 2),
                                  SizedBox(height: 36 / 2),
                                ]),
                                TableRow(
                                  children: [
                                    const TableCell(
                                      child: Text(
                                        '고유번호',
                                        style: TextStyle(
                                          color: Color(0xff999999),
                                          letterSpacing: -0.7 / 2,
                                          fontSize: 28 / 2,
                                          fontFamily:
                                              'Noto Sans CJK KR, Medium',
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: SizedBox(
                                        height: 60 / 2,
                                        child: TextField(
                                          textAlignVertical:
                                              TextAlignVertical.bottom,
                                          decoration: InputDecoration(
                                            hintText: 'ex ) 00000 …',
                                            hintStyle: TextStyle(
                                              color: const Color(0xff999999)
                                                  .withOpacity(0.5),
                                              letterSpacing: -0.7 / 2,
                                              fontSize: 28 / 2,
                                              fontFamily:
                                                  'Noto Sans CJK KR, Medium',
                                            ),
                                            border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.zero,
                                            ),
                                          ),
                                          onChanged: (value) {
                                            serialNumber = value;
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 76 / 2,
                          ),
                          const SizedBox(
                            height: 45 / 2,
                            width: 654 / 2,
                            child: Text(
                              '화면이 보이지 않을 정도의 액정 파손은 기부가 어렵습니다.',
                              style: TextStyle(
                                  color: Color(0xff191919),
                                  letterSpacing: -0.7 / 2,
                                  fontSize: 28 / 2,
                                  fontFamily: 'Noto Sans CJK KR, Medium',
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: 45 / 2,
                            width: 654 / 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.zero,
                                  height: 45 / 2,
                                  width: 550 / 2,
                                  child: const Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '위의 내용을 확인했습니다.',
                                      style: TextStyle(
                                          color: Color(0xff999999),
                                          letterSpacing: -0.7 / 2,
                                          fontSize: 28 / 2,
                                          fontFamily:
                                              'Noto Sans CJK KR, Medium',
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 14 / 2,
                                ),
                                SizedBox(
                                  height: 40 / 2,
                                  width: 40 / 2,
                                  child: Checkbox(
                                    side: const BorderSide(
                                      width: 1 / 2,
                                      color: Color(0xff707070),
                                    ),
                                    value: inputDadaCheck,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          inputDadaCheck = value!;
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 81 / 2,
                      right: 17 / 2,
                      child: SizedBox(
                          height: 98 / 2,
                          width: 619 / 2,
                          child: FloatingActionButton.extended(
                            elevation: 3,
                            backgroundColor: (inputDadaCheck == true &&
                                    ((cellPhoneType != '') &&
                                        (cellPhoneMem != '') &&
                                        (serialNumber != '')))
                                ? const Color(0xff2079FF)
                                : const Color(0xffF1F1F5),
                            heroTag: 'next',
                            label: SizedBox(
                              height: 44 / 2,
                              width: 574 / 2,
                              child: Center(
                                child: Text(
                                  "다음 단계",
                                  style: TextStyle(
                                    fontSize: 32 / 2,
                                    letterSpacing: -0.8 / 2,
                                    fontFamily: 'Noto Sans CJK KR, Bold',
                                    fontWeight: FontWeight.w700,
                                    color: (inputDadaCheck == true &&
                                            ((cellPhoneType != '') &&
                                                (cellPhoneMem != '') &&
                                                (serialNumber != '')))
                                        ? const Color(0xffffffff)
                                        : const Color(0xff767676),
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (cellPhoneType == '') {
                                showDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: const Text('핸드폰 기종을 입력하세요.'),
                                      actions: [
                                        TextButton(
                                          child: const Text('확인'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else if (cellPhoneMem == '') {
                                showDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: const Text('핸드폰 메모리를 입력하세요.'),
                                      actions: [
                                        TextButton(
                                          child: const Text('확인'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else if (serialNumber == '') {
                                showDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: const Text('핸드폰 고유번호를 입력하세요.'),
                                      actions: [
                                        TextButton(
                                          child: const Text('확인'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else if (inputDadaCheck == false) {
                                showDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: const Text('체크 박스를 확인하세요.'),
                                      actions: [
                                        TextButton(
                                          child: const Text('확인'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CheckPhoneInfo(
                                          cellPhoneType: cellPhoneType,
                                          cellPhoneMem: cellPhoneMem,
                                          serialNumber: serialNumber,
                                        )));
                              }
                            },
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20 / 2)),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
