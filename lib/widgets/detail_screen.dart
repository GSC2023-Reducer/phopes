import 'package:flutter/src/widgets/framework.dart';
import 'package:classdetailpage/services/api_service.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title, asset, author;
  var isRead;

  DetailScreen({
    super.key,
    required this.title,
    required this.asset,
    required this.author,
    required this.isRead,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // leading action 등 버튼 아이콘의 위치에 원하는 아이콘을 지정한다.
        title: Text('${this.title}', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
          weight: 700,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.45,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              ClipRRect(
                //둥근 모서리
                borderRadius: BorderRadius.circular(8.0),
                child: Image(
                    image:
                        // 해당 파일의 title과 author 값을 가지고 api 값을 호출한다.
                        AssetImage(this.asset),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.3,
                    fit: BoxFit.fill),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    ListTile(
                      title: Text('${this.title}',
                          style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 2,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.03,
                              fontWeight: FontWeight.bold)),
                      subtitle: Text('${this.author}',
                          style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 2,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.018,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
