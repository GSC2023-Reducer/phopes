import 'package:flutter/material.dart';
import 'package:phopes/isar_services.dart';
import 'package:phopes/student_home_page.dart';
import 'package:phopes/widgets/student_home_drawer.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});

  @override
  State<StatefulWidget> createState() => _UpdatePage();
}

class _UpdatePage extends State<UpdatePage> {
  final IsarService service = IsarService();
  //TODO: firebase에서 불러오기
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xffFFFFFF),
        centerTitle: true,
        title: const Text("Phopes",
            style: TextStyle(
                fontFamily: 'Modak',
                fontWeight: FontWeight.w500,
                color: Color(0xff2079FF),
                fontSize: 24)),
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const StudentHomePage(),
              ),
            );
          },
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.black,
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
      ),
      endDrawer: const StudentHomeDrawer(),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: const Text(
              "3월 업데이트 목록",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  fontWeight: FontWeight.w700,
                  color: Color(0xff191919),
                  fontSize: 30),
            ),
          ),
          Card(
            elevation: 0,
            color: Colors.transparent,
            surfaceTintColor: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  decoration: const BoxDecoration(
                    color: Color(0xffF1F1F5),
                  ),
                  child: Image.network(
                      "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791187192596.jpg",
                      height: 220,
                      width: 150),
                ),
                Container(
                  width: 150,
                  margin: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.transparent,
                        child: const Text("어린왕자",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w700,
                                color: Color(0xff191919),
                                fontSize: 15)),
                      ),
                      Checkbox(value: false, onChanged: (value) {}),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  width: 150,
                  color: Colors.transparent,
                  child: const Text(
                    "앙투안 마리 드 생택쥐페리",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                        color: Color(0xff767676),
                        fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
              onPressed: () async {
                await service.loadBooks();
                if (!context.mounted) return;
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Download Done'),
                    content: const Text('Books downloaded'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('선택 도서 다운로드 하기'))
        ],
      ),
    );
  }
}
