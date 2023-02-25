import 'package:flutter/src/widgets/framework.dart';
import 'package:classdetailpage/services/api_service.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import './pdf_viewer.dart';

class DetailScreen extends StatelessWidget {
  final String title, asset, author, genre, thumb;
  var isRead;

  DetailScreen({
    super.key,
    required this.title,
    required this.asset,
    required this.author,
    required this.isRead,
    required this.genre,
    required this.thumb,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('${this.title}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 40 / 2,
              letterSpacing: -1.0,
              fontWeight: FontWeight.w200,
              fontFamily: 'Noto Sans CJK KR, Medium',
            )),
        centerTitle: true,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
          weight: 700,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(48 / 2, 25 / 2, 48 / 2, 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: 654 / 2,
                  child: Center(
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image(
                                image: AssetImage(this.thumb),
                                width: 654 / 2,
                                height: 400 / 2,
                                fit: BoxFit.fill)),
                        SizedBox(height: 24 / 2),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text('${this.author}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  letterSpacing: -0.6,
                                  fontSize: 48 / 2,
                                  fontFamily: 'Noto Sans CJK KR, Medium',
                                  fontWeight: FontWeight.w600)),
                          subtitle: Text('${this.genre}',
                              style: TextStyle(
                                  color: Color(0xff767676),
                                  fontSize: 24 / 2,
                                  letterSpacing: -0.6,
                                  fontFamily: 'Noto Sans CJK KR, Medium',
                                  fontWeight: FontWeight.w200)),
                        ),
                      ],
                    ),
                  )),
              SizedBox(height: 24 / 2),
              Container(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => pdf_viewer(asset: indexAsset),
                            fullscreenDialog: true,
                          ),
                        );
                      },
                      child: Text(
                        'Full-Screen Click',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(170, 244, 101, 91),
                        ),
                      ),
                    ),
                    SizedBox(height: 24 / 2),
                    SingleChildScrollView(
                      child: Container(
                        height: 350,
                        child: SfPdfViewer.asset('assets/q656.pdf'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}