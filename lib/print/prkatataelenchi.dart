//import 'dart:typed_data';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
//import 'package:printing/printing.dart';
import 'package:uispkarategare/database/sql.dart';
//import 'package:flutter/material.dart';

//class Kata extends StatelessWidget{
//  const Kata({super.key});
class PrKataElenchi {
  String _gara = '';
  String _data = '';
//  String _citta = '';
  String _categoria = '';
//  String _classe = '';
//  String _cintura = '';
  List pdfDataList = [];

  Future<Widget> kataLine(int x) async {
    String club = '';
//    String citta = '';
    String cognome = '';
    String nome = '';

    if (x < pdfDataList.length) {
      club = pdfDataList[x]['SOCIETA'].toString();
//      citta = pdfDataList[x]['SOCIETA2'].toString();
      cognome = pdfDataList[x]['COGNOME'].toString();
      nome = pdfDataList[x]['NOME'].toString();
    }
    return Expanded(
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Expanded(
          child: Container(
        child: Text('$club '),
      )),
      Expanded(
          child: Container(
        child: Text('$cognome $nome'),
      )),
    ]));
  }

  Future<Page> pagina() async {
    List<Widget> line = [];
    line.add(Text(
      '$_gara   $_data',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    ));
    line.add(Text(
      'CATEGORIA:',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    ));
    line.add(Text(
      _categoria,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    ));
    line.add(Spacer());
    for (var i = 0; i <= 15; i++) {
      line.add(await kataLine(i));
    }
    return Page(
      pageTheme: const PageTheme(
        pageFormat: PdfPageFormat.a4,
        orientation: PageOrientation.portrait,
//        theme: ThemeData.withFont(
//          base: await PdfGoogleFonts.openSansRegular(),
//          bold: await PdfGoogleFonts.openSansBold(),
//        ),
      ),
      build: (context) {
        return Padding(
          padding: const EdgeInsets.only(right: 0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Row(children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
//                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: line,
              )),
            ]),
          ),
        );
      },
    );
  }

  void stampa() async {
    final Document document = Document();
    bool inPage = false;
    pdfDataList.clear();
    for (var element in data) {
      if (element['CFSOCIETA'] == '*') {
        if (inPage) {
          document.addPage(await pagina());
          pdfDataList.clear();
        }
        inPage = true;
        _gara = 'KARATE DONNA';
        _data = '12-03-2023';
//        _citta = 'Busto Arsizio';
        _categoria =
            '${element['NOME']} ${element['COGNOME']} ${element['SOCIETA']} ${element['SOCIETA2']}';
//        _classe =
//            '${element['NOME']} ${element['SOCIETA']} ${element['SOCIETA2']}';
//        _cintura = '${element['COGNOME']}';
      } else {
        pdfDataList.add(element);
      }
    }
    document.addPage(await pagina());
    final file = File("kata-elenchi.pdf");
    await file.writeAsBytes(await document.save());
  }
}
