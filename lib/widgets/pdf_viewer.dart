import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import './detail_screen.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class pdf_viewer extends StatelessWidget {
  final asset;
  const pdf_viewer({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Full-Screen',
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
            child: Container(child: SfPdfViewer.asset('assets/q656.pdf'))));
  }
}
