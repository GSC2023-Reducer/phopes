import 'package:classdetailpage/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/services.dart';
import './widgets/detail_screen.dart';
import './models/book_model.dart';

/*WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]); */

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phopes',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DetailPage(title: 'Phopes_DetailPage'),
    );
  }
}

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.title});
  final String title;

  @override
  State<DetailPage> createState() => _DetailPage();
}

var indexTitle = '강의를 선택하세요';
var indexThumb = 'assets/images/books.jpg';
var indexIsRead = '';
var indexAuthor = '';
var indexGenre = '';
var indexAsset = '';

class _DetailPage extends State<DetailPage> {
  List<OneBook> books = [];

  void waitForBooks() async {
    books = await dataSerive.getData();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    waitForBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 30,
          ),
          onPressed: null,
        ),
        title: Text(
          '${books[0].genre}',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 40 / 2,
            letterSpacing: -1.0,
            fontWeight: FontWeight.w200,
            fontFamily: 'Noto Sans CJK KR, Medium',
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(48 / 2, 25 / 2, 48 / 2, 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: 654 / 2,
                  height: 648 / 2,
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                        title: indexTitle,
                                        asset: indexAsset,
                                        author: indexAuthor,
                                        isRead: indexIsRead,
                                        thumb: indexThumb,
                                        genre: indexGenre),
                                    fullscreenDialog: true,
                                  ),
                                );
                              },
                              child: Image(
                                  image: AssetImage(indexThumb),
                                  width: 654 / 2,
                                  height: 400 / 2,
                                  fit: BoxFit.fill),
                            ),
                          ),
                          SizedBox(height: 24 / 2),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              '${indexTitle}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  letterSpacing: -0.6,
                                  fontSize: 48 / 2,
                                  fontFamily: 'Noto Sans CJK KR, Medium',
                                  fontWeight: FontWeight.w600),
                            ),
                            subtitle: const Text(
                              '나의 학습 진도율',
                              style: TextStyle(
                                  color: Color(0xff767676),
                                  fontSize: 24 / 2,
                                  letterSpacing: -0.6,
                                  fontFamily: 'Noto Sans CJK KR, Medium',
                                  fontWeight: FontWeight.w200),
                            ),
                          ),
                          SizedBox(height: 24 / 2),
                          LinearPercentIndicator(
                            width: 654 / 2,
                            animation: true,
                            animationDuration: 1000,
                            lineHeight: 36 / 2,
                            percent:
                                books.where((x) => x.isRead == 'true').length /
                                    books.length,
                            center: Text(
                              "${((books.where((x) => (x.isRead == 'true')).length / books.length) * 100).toStringAsFixed(2)}%",
                              style: const TextStyle(
                                  fontSize: 35 / 2,
                                  color: Colors.black,
                                  letterSpacing: 0,
                                  fontFamily: 'Noto Sans CJK KR, Medium',
                                  fontWeight: FontWeight.w100),
                            ), // 변수로 받고 문자열로 대입
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: Color(0xff2079FF),
                            backgroundColor: Color(0xffF1F1F5),
                          )
                        ]),
                  )),
              SizedBox(height: 40 / 2),
              Container(
                width: 654 / 2,
                height: 720 / 2,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: books.map(
                    (x) {
                      return GestureDetector(
                        onLongPress: () {
                          setState(
                            () {
                              indexAuthor = x.author;
                              indexTitle = x.title;
                              indexThumb =
                                  ('${(books.where((x) => (x.title == indexTitle))).map((x) {
                                return x.thumb;
                              })}')
                                      .replaceAll('(', '')
                                      .replaceAll(')', '');
                              indexIsRead = x.isRead;
                              indexGenre = x.genre;
                              indexAsset = x.asset;
                            },
                          );
                        },
                        child: CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            x.title,
                            style: const TextStyle(
                              color: Color(0xff767676),
                              fontSize: 16,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Noto Sans CJK KR, Medium',
                            ),
                          ),
                          subtitle: Text(
                            x.author,
                            style: const TextStyle(
                              color: Color(0xff767676),
                              fontSize: 13,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w100,
                              fontFamily: 'Noto Sans CJK KR, Medium',
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          activeColor: Color(0xff2079FF),
                          checkColor: Colors.white,
                          secondary: const Icon(
                            Icons.book,
                            size: 24,
                          ),
                          value: (x.isRead == 'true'),
                          onChanged: (value) {
                            setState(
                              () => {
                                x.isRead = '${value}',
                              },
                            );
                          },
                          selected: (x.isRead == 'true'),
                        ),
                      );
                    },
                  ).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
