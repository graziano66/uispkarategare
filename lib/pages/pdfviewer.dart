import 'package:flutter/material.dart';
import 'package:uispkarategare/global.dart';
import 'package:uispkarategare/drawer.dart';
// ignore: depend_on_referenced_packages
//import 'package:intl/intl.dart';
//import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'dart:io';

class PdfPage extends StatefulWidget {
  const PdfPage({Key? key, required this.title, required this.pdfName})
      : super(key: key);
  final String title;
  final String pdfName;

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const BarraLaterale(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Row(
          children: [
            if (isDesktop(context))
              const Expanded(
                // flex: 1, (default)
                child: BarraLaterale(),
              ),
            Expanded(
              flex: 5,
//              child: SingleChildScrollView(
//                padding: const EdgeInsets.all(defaultPadding),
              child: SfPdfViewer.file(File(widget.pdfName)),
            ),
            //            ),
          ],
        ),
      ),
    );
  }
}
