//import 'dart:typed_data';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
//import 'package:printing/printing.dart';
import 'package:uispkarategare/database/sql.dart';
//import 'package:flutter/material.dart';

//class Kata extends StatelessWidget{
//  const Kata({super.key});
class Kata {
  String _gara = '';
  String _data = '';
  String _citta = '';
  String _categoria = '';
  List pdfDataList = [];

  Widget kataFirstLine() {
    return Expanded(
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Expanded(
          child: Container(
        foregroundDecoration: BoxDecoration(
          border: Border.all(width: 1),
        ),
        child: Text('UISP Area Nazionale Discipline Orientali'),
      )),
      Expanded(
          child: Container(
        foregroundDecoration: BoxDecoration(
          border: Border.all(width: 1),
        ),
        child: Text('GARA: $_gara\nDATA: $_data'),
      )),
      Expanded(
          child: Container(
        foregroundDecoration: BoxDecoration(
          border: Border.all(width: 1),
        ),
        child: Text('CITTA: $_citta'),
      )),
      Expanded(
          child: Container(
        foregroundDecoration: BoxDecoration(
          border: Border.all(width: 1),
        ),
        child: Text('CATEGORIA: $_categoria'),
      )),
      Expanded(
          child: Container(
        foregroundDecoration: BoxDecoration(
          border: Border.all(width: 1),
        ),
        child: Text('Tabellone Gara KATA N.'),
      )),
    ]));
  }

  Widget kataSecondLine() {
    return Expanded(
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Expanded(
          child: Container(
        foregroundDecoration: BoxDecoration(
          border: Border.all(width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text('CLUB\nCITTA'),
        ),
      )),
      Expanded(
          child: Container(
        foregroundDecoration: BoxDecoration(
          border: Border.all(width: 1),
        ),
        child: Text('COGNOME\nNOME'),
      )),
      Expanded(
          child: Container(
        foregroundDecoration: BoxDecoration(
          border: Border.all(width: 1),
        ),
        child: Text('1° KATA   NOTE'),
      )),
      Expanded(
          child: Container(
        foregroundDecoration: BoxDecoration(
          border: Border.all(width: 1),
        ),
        child: Text('2° KATA   NOTE'),
      )),
      Expanded(
          child: Container(
        foregroundDecoration: BoxDecoration(
          border: Border.all(width: 1),
        ),
        child: Text('3° KATA   NOTE'),
      )),
    ]));
  }

  Widget kataBlock() {
    return Expanded(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
          Expanded(
              child: Container(
            foregroundDecoration: BoxDecoration(
              border: Border.all(width: 1),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      flex: 5,
                      child: Container(
                        foregroundDecoration: BoxDecoration(
                          border: Border.all(width: 1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                                child: Container(
                              foregroundDecoration: BoxDecoration(
                                border: Border.all(width: 1),
                              ),
                              child: Text('1'),
                            )),
                            Expanded(
                                child: Container(
                              foregroundDecoration: BoxDecoration(
                                border: Border.all(width: 1),
                              ),
                              child: Text(''),
                            )),
                            Expanded(
                                child: Container(
                              foregroundDecoration: BoxDecoration(
                                border: Border.all(width: 1),
                              ),
                              child: Text(''),
                            )),
                            Expanded(
                                child: Container(
                              foregroundDecoration: BoxDecoration(
                                border: Border.all(width: 1),
                              ),
                              child: Text(''),
                            )),
                            Expanded(
                                child: Container(
                              foregroundDecoration: BoxDecoration(
                                border: Border.all(width: 1),
                              ),
                              child: Text(''),
                            )),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 3,
                      child: Container(
                        foregroundDecoration: BoxDecoration(
                          border: Border.all(width: 1),
                        ),
                        child: Text(''),
                      )),
                ]),
          )),
          Expanded(
              child: Container(
            foregroundDecoration: BoxDecoration(
              border: Border.all(width: 1),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      flex: 5,
                      child: Container(
                        foregroundDecoration: BoxDecoration(
                          border: Border.all(width: 1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                                flex: 3,
                                child: Container(
                                  foregroundDecoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                  ),
                                  child: Text('2'),
                                )),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  foregroundDecoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                  ),
                                  child: Text('3'),
                                )),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 3,
                      child: Container(
                        foregroundDecoration: BoxDecoration(
                          border: Border.all(width: 1),
                        ),
                        child: Text(''),
                      )),
                ]),
          )),
        ]));
  }

  Future<Widget> kataLine(int x) async {
    String club = '';
    String citta = '';
    String cognome = '';
    String nome = '';
//   if (x == 0) print(pdfDataList[0]);

    if (x < pdfDataList.length) {
      club = pdfDataList[x]['SOCIETA'].toString();
      citta = pdfDataList[x]['SOCIETA2'].toString();
      cognome = pdfDataList[x]['COGNOME'].toString();
      nome = pdfDataList[x]['NOME'].toString();
    }
    return Expanded(
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Expanded(
          child: Container(
        foregroundDecoration: BoxDecoration(
          border: Border.all(width: 1),
        ),
        child: Text('$club\n$citta'),
      )),
      Expanded(
          child: Container(
        foregroundDecoration: BoxDecoration(
          border: Border.all(width: 1),
        ),
        child: Text('$cognome\n$nome'),
      )),
      kataBlock(),
      kataBlock(),
      kataBlock(),
    ]));
  }

  Future<Page> testata() async {
    return Page(
      pageTheme: const PageTheme(
        pageFormat: PdfPageFormat.a3,
        orientation: PageOrientation.landscape,
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
              barraLaterale(),
            ]),
          ),
        );
      },
    );
  }

  Widget barraLaterale() {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,

//        mainAxisAlignment: MainAxisAlignment.start,
//        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
              child: Container(
            foregroundDecoration: BoxDecoration(
              border: Border.all(width: 1),
            ),
            child: Text('Numero dei partecipanti\nNumero Società presenti'),
          )),
          Expanded(
              child: Container(
            foregroundDecoration: BoxDecoration(
              border: Border.all(width: 1),
            ),
            child: Text('PIPPO1'),
          )),
          Expanded(child: Text('PIPPO2')),
          Expanded(child: Text('PIPPO3')),
          Expanded(child: Text('PIPPO4')),
          Expanded(child: Text('PIPPO5')),
          Expanded(child: Text('PIPPO6')),
          Expanded(child: Text('PIPPO7')),
          Expanded(child: Text('PIPPO8')),
          Expanded(child: Text('PIPPO9')),
          Expanded(child: Text('PIPPO0')),
          Expanded(child: Text('PIPPO1')),
          Expanded(child: Text('PIPPO2')),
          Expanded(child: Text('PIPPO3')),
          Expanded(child: Text('PIPPO4')),
          Expanded(child: Text('PIPPO5')),
          Expanded(child: Text('PIPPO6')),
          Expanded(child: Text('PIPPO7')),
        ],
      ),
    );
  }

  Future<Page> pagina() async {
    List<Widget> line = [];
    line.add(kataFirstLine());
    line.add(kataSecondLine());
    for (var i = 0; i <= 15; i++) {
      line.add(await kataLine(i));
    }
    return Page(
      pageTheme: const PageTheme(
        pageFormat: PdfPageFormat.a3,
        orientation: PageOrientation.landscape,
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
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: line,
                  )),
              barraLaterale(),
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
          document.addPage(await testata());
          document.addPage(await pagina());
          pdfDataList.clear();
        }
        inPage = true;
        _gara = 'KARATE DONNA';
        _data = '2023';
        _citta = 'Busto Arsizio';
        _categoria =
            '${element['NOME']} ${element['COGNOME']} ${element['SOCIETA']} ${element['SOCIETA2']}';
      } else {
        pdfDataList.add(element);
      }
    }
    document.addPage(await testata());
    document.addPage(await pagina());
    final file = File("example.pdf");
    await file.writeAsBytes(await document.save());
  }
}
