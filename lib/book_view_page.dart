import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookViewPage extends StatelessWidget {
  final String title, asset, author, genre, thumb;
  var isRead;

  BookViewPage({
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
        title: Text(title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 40 / 2,
              letterSpacing: -1.0,
              fontWeight: FontWeight.w200,
              fontFamily: 'Noto Sans CJK KR, Medium',
            )),
        centerTitle: true,
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: Colors.black,
          weight: 700,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(48 / 2, 25 / 2, 48 / 2, 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 654 / 2,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 24 / 2),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(author,
                            style: const TextStyle(
                                color: Colors.black,
                                letterSpacing: -0.6,
                                fontSize: 48 / 2,
                                fontFamily: 'Noto Sans CJK KR, Medium',
                                fontWeight: FontWeight.w600)),
                        subtitle: Text(genre,
                            style: const TextStyle(
                                color: Color(0xff767676),
                                fontSize: 24 / 2,
                                letterSpacing: -0.6,
                                fontFamily: 'Noto Sans CJK KR, Medium',
                                fontWeight: FontWeight.w200)),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24 / 2),
              Container(
                child: Column(
                  children: [
                    const SizedBox(height: 24 / 2),
                    SingleChildScrollView(
                      child: SizedBox(
                        height: 600,
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
