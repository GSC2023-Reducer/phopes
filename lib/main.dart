import 'package:classdetailpage/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import './widgets/detail_screen.dart';
import './models/book_model.dart';

void main() {
  runApp(const MyApp());
} // runApp => MyApp => MaterialApp...

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override // 모든 커스텀 함수는 또 다른 위젯을 리턴하는 빌드 함수를 가지고 있다.
  Widget build(BuildContext context) {
    return MaterialApp(
      // myApp의 하위 개념으로 본격적으로 flutter의 디자인과 기능을 사용한다.
      title: 'Phopes',
      theme: ThemeData(primarySwatch: Colors.blue
          // 특정 색을 골라 앱의 기본 음영도로 사용한다.
          ),
      home: const DetailPage(title: 'Phopes_DetailPage'),
      // 앱 실행시 보여지는 화면으로 homepage이다.
    );
  }
}

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.title});
  final String title;

  @override
  State<DetailPage> createState() => _DetailPage();
}

// 빈 화면 방지 기본 값 넣기 각각 대표 이미지 및 제목에 사용될 변수들
var indexTitle = '강의를 선택하세요';
var indexImage = 'assets/images/books.jpg';
var indexIsRead = 'false';
var indexAuthor = 'Ms Jeong';

class _DetailPage extends State<DetailPage> {
  List<OneBook> books = [];
  // bool isLoading = true;

  void waitForBooks() async {
    // api_service 파일로 붙어 가져온 인스턴드 목록을 books에 저장
    books = await dataSerive.getData();
    // isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    waitForBooks();
  }

  @override
  Widget build(BuildContext context) {
    // 앱 화면에 기능을 배치하는 것을 제공하는 위젯 (앱 도화지 같은 역할)
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // leading action 등 버튼 아이콘의 위치에 원하는 아이콘을 지정한다.
        leading: const IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 30,
          ),
          onPressed: null,
        ),
        title: Text('${books[0].genre}', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0.0,
      ),

      // 앱 화면 : center(중앙에 배치하겠다)
      body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),

          /* column으로 선언하면 앱 화면 세로 축 기준으로 무한히 확장하게 된다.
          이런 경우 center를 선언하면 세로 축이 무한하므로 가로를 기준으로만 center 속성이 적용하게 된다. 
          따라서 이때 mainAixAlignment로 세로에 대한 속성을 따로 선언해주어야 한다.*/
          child: Column(
              // child들을 새로축을 기준으로 위치를 배정해준다.
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              // child 아래 새로 정렬된 위젯들을 []에 나열한다는 의미
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                  //둥근 모서리
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                              title: indexTitle,
                                              asset: indexImage,
                                              author: indexAuthor,
                                              isRead: indexIsRead),
                                          fullscreenDialog: true,
                                        ),
                                      );
                                    },
                                    child: Image(
                                        image:
                                            // 해당 파일의 title과 author 값을 가지고 api 값을 호출한다.
                                            AssetImage(indexImage),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                        fit: BoxFit.fill),
                                  )),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              Container(
                                  child: Column(children: <Widget>[
                                ListTile(
                                  title: Text('${indexTitle}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          letterSpacing: 2,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text('나의 학습 진도율',
                                      style: TextStyle(
                                          color: Colors.black,
                                          letterSpacing: 2,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.018,
                                          fontWeight: FontWeight.bold)),
                                ),
                                LinearPercentIndicator(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    animation: true,
                                    animationDuration: 1000,
                                    lineHeight:
                                        MediaQuery.of(context).size.height *
                                            0.02,
                                    percent: books
                                            .where((x) => x.isRead == 'true')
                                            .length /
                                        books.length, // 값 조정
                                    center: Text(
                                        "${((books.where((x) => (x.isRead == 'true')).length / books.length) * 100).toStringAsFixed(2)}%"), // 변수로 받고 문자열로 대입
                                    linearStrokeCap: LinearStrokeCap.roundAll,
                                    progressColor: Colors.lightGreen[600],
                                    backgroundColor:
                                        Color.fromARGB(255, 205, 219, 198))
                              ]))
                            ]))),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: ListView(
                        scrollDirection: Axis.vertical,
                        //where((x) => x.genre == '역사').
                        children: books.map((x) {
                          return GestureDetector(
                            onLongPress: () {
                              setState(() {
                                indexAuthor = x.author;
                                indexTitle = x.title;
                                indexImage =
                                    ('${(books.where((x) => (x.title == indexTitle))).map((x) {
                                  return x.asset;
                                })}')
                                        .replaceAll('(', '')
                                        .replaceAll(')', '');
                                indexIsRead = x.isRead;
                              });
                            },
                            child: CheckboxListTile(
                                title: Text(x.title),
                                subtitle: Text(x.author),
                                activeColor: Color.fromARGB(255, 182, 206, 153),
                                checkColor: Colors.white,
                                secondary: const Icon(Icons.book),
                                value: (x.isRead == 'true'),
                                onChanged: (value) {
                                  setState(() => {
                                        x.isRead = '${value}',
                                      });
                                },
                                selected: (x.isRead == 'true')),
                          );
                        }).toList()))
              ])),
    );
  }
}
