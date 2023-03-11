//import 'dart:typed_data';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
//import 'package:printing/printing.dart';
import 'package:uispkarategare/database/sql.dart';
//import 'package:flutter/material.dart';

//class Kata extends StatelessWidget{
//  const Kata({super.key});
class PrKataTabelloni {
  String _gara = '';
  String _data = '';
  String _citta = '';
  String _categoria = '';
  String _classe = '';
  String _cintura = '';
  List pdfDataList = [];

  Widget kataFirstLine() {
    return Expanded(
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Expanded(
          child: Container(
              foregroundDecoration: BoxDecoration(
                border: Border.all(width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text('UISP Area Nazionale Discipline Orientali'),
              ))),
      Expanded(
          child: Container(
              foregroundDecoration: BoxDecoration(
                border: Border.all(width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text('GARA: $_gara\nDATA: $_data'),
              ))),
      Expanded(
          child: Container(
              foregroundDecoration: BoxDecoration(
                border: Border.all(width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text('CITTA: $_citta'),
              ))),
      Expanded(
          child: Container(
              foregroundDecoration: BoxDecoration(
                border: Border.all(width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text('CATEGORIA: $_categoria'),
              ))),
      Expanded(
          child: Container(
              foregroundDecoration: BoxDecoration(
                border: Border.all(width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text('Tabellone Gara KATA N.'),
              ))),
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
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text('COGNOME\nNOME'),
              ))),
      Expanded(
          child: Container(
              foregroundDecoration: BoxDecoration(
                border: Border.all(width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  '\n\n1° KATA            NOTE',
                  textAlign: TextAlign.center,
                ),
              ))),
      Expanded(
          child: Container(
              foregroundDecoration: BoxDecoration(
                border: Border.all(width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  '\n\n2° KATA            NOTE',
                  textAlign: TextAlign.center,
                ),
              ))),
      Expanded(
          child: Container(
              foregroundDecoration: BoxDecoration(
                border: Border.all(width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  '\n\n3° KATA            NOTE',
                  textAlign: TextAlign.center,
                ),
              ))),
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
                              child: Text(
                                '1',
                                style: const TextStyle(
                                  fontSize: 8,
                                ),
                              ),
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
                                  child: Text(
                                    '2',
                                    style: const TextStyle(
                                      fontSize: 8,
                                    ),
                                  ),
                                )),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  foregroundDecoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                  ),
                                  child: Text(
                                    '3',
                                    style: const TextStyle(
                                      fontSize: 8,
                                    ),
                                  ),
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
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  '$club\n$citta',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
                ),
              ))),
      Expanded(
          child: Container(
              foregroundDecoration: BoxDecoration(
                border: Border.all(width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  '$cognome\n$nome',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
              ))),
      kataBlock(),
      kataBlock(),
      kataBlock(),
    ]));
  }

  Future<Page> testata() async {
    Widget r = await retro();
    Widget f = await fronte();

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
              r,
              Container(width: 200, child: Text('')),
              f,
            ]),
          ),
        );
      },
    );
  }

  Future<Widget> retro() async {
    final logo1 = MemoryImage(
      File('logo1.png').readAsBytesSync(),
    );
//    final logo2 = MemoryImage(
//      File('logo2.png').readAsBytesSync(),
//    );
    final logo3 = MemoryImage(
      File('logo3.jpg').readAsBytesSync(),
    );

    var l1 = 50.0;
    var l2 = 200.0;
    var l3 = 150.0;
    var l4 = 50.0;
    var h1 = 30.0;

    return Expanded(
        flex: 1,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,

//        mainAxisAlignment: MainAxisAlignment.start,
//        mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                  child: Row(children: [
                Container(
                  width: 100,
                  height: 100,
                  child: Image(logo1),
                ),
                Text(
                    textAlign: TextAlign.center,
                    'AREA DISCIPLINE ORIENTALI UISP\nENTE DI PROMOZIONE SPORTIVA\nRICONOSCIUTO DAL C.O.N.I.\nVia Riva di Reno 75 III - 40121 Bologna\ne-mail disc.orientali@uisp.it'),
                Container(
                  width: 100,
                  height: 100,
                  child: Image(logo3),
                ),
              ])),
              Expanded(
                child: Column(children: [
                  Text(
                      style: TextStyle(
                          height: 16,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      'CLASSIFICA INDIVIDUALE DELLA CATEGORIA'),
                  Text(
                      style: TextStyle(
                          height: 16,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      _categoria),
                  Text(textAlign: TextAlign.center, '.'),
                  Container(
//                    foregroundDecoration: BoxDecoration(
//                      border: Border.all(width: 1),
//                    ),
                    child: Column(children: [
                      Row(children: [
                        Container(
                            width: l1,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text('CLASS.', textAlign: TextAlign.center)),
                        Container(
                            width: l2,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text('ATLETA', textAlign: TextAlign.center)),
                        Container(
                            width: l3,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child:
                                Text('SOCIETA', textAlign: TextAlign.center)),
                        Container(
                            width: l4,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text('PUNTI', textAlign: TextAlign.center))
                      ]),
                      Row(children: [
                        Container(
                            width: l1,
                            height: h1,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text('1°', textAlign: TextAlign.center)),
                        Container(
                            width: l2,
                            height: h1,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text('')),
                        Container(
                            width: l3,
                            height: h1,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text('')),
                        Container(
                            width: l4,
                            height: h1,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text(''))
                      ]),
                      Row(children: [
                        Container(
                            width: l1,
                            height: h1,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text('2°', textAlign: TextAlign.center)),
                        Container(
                            width: l2,
                            height: h1,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text('')),
                        Container(
                            width: l3,
                            height: h1,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text('')),
                        Container(
                            width: l4,
                            height: h1,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text(''))
                      ]),
                      Row(children: [
                        Container(
                            width: l1,
                            height: h1,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text('3°', textAlign: TextAlign.center)),
                        Container(
                            width: l2,
                            height: h1,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text('')),
                        Container(
                            width: l3,
                            height: h1,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text('')),
                        Container(
                            width: l4,
                            height: h1,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text(''))
                      ]),
                      Row(children: [
                        Container(
                            width: l1,
                            height: h1,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text('4°', textAlign: TextAlign.center)),
                        Container(
                            width: l2,
                            height: h1,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text('')),
                        Container(
                            width: l3,
                            height: h1,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text('')),
                        Container(
                            width: l4,
                            height: h1,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text(''))
                      ]),
                      Row(children: [
                        Container(
                            width: l1,
                            height: h1,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text('5°', textAlign: TextAlign.center)),
                        Container(
                            width: l2,
                            height: h1,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text('')),
                        Container(
                            width: l3,
                            height: h1,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text('')),
                        Container(
                            width: l4,
                            height: h1,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text(''))
                      ]),
                      Row(children: [
                        Container(
                            width: l1,
                            height: h1,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text('6°', textAlign: TextAlign.center)),
                        Container(
                            width: l2,
                            height: h1,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text('')),
                        Container(
                            width: l3,
                            height: h1,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text('')),
                        Container(
                            width: l4,
                            height: h1,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text(''))
                      ]),
                      Row(children: [
                        Container(
                            width: l1,
                            height: h1,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text('7°')),
                        Container(
                            width: l2,
                            height: h1,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text('')),
                        Container(
                            width: l3,
                            height: h1,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text('')),
                        Container(
                            width: l4,
                            height: h1,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(width: 1),
                            ),
                            child: Text(''))
                      ]),
                    ]),
                  )
                ]),
              )
            ]));
  }

  Future<Widget> fronte() async {
    final logo1 = MemoryImage(
      File('logo1.png').readAsBytesSync(),
    );
    final logo2 = MemoryImage(
      File('logo2.png').readAsBytesSync(),
    );
    final logo3 = MemoryImage(
      File('logo3.jpg').readAsBytesSync(),
    );

    return Expanded(
        flex: 1,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,

//        mainAxisAlignment: MainAxisAlignment.start,
//        mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Container(
                      width: 100,
                      height: 100,
                      child: Image(logo1),
                    ),
                    Container(
                      width: 20,
                      height: 100,
                      child: Text(''),
                    ),
                    Container(
                      width: 140,
                      height: 140,
                      child: Image(logo2),
                    ),
                    Container(
                      width: 20,
                      height: 100,
                      child: Text(''),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child: Image(logo3),
                    ),
                  ])),
              Expanded(
                child: Column(children: [
                  Text(
                      style: TextStyle(
                          height: 30,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      'AREA DISCIPLINE ORIENTALI'),
                  Text(
                      style: TextStyle(
                          height: 20,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      'VERBALE DELLA GARA DI KATA'),
                  Text(textAlign: TextAlign.center, '.'),
                  Container(
                    width: 550,
                    height: 150,
                    foregroundDecoration: BoxDecoration(
                      border: Border.all(width: 1),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Classe   $_classe',
                            style: TextStyle(
                                height: 16,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Cintura   $_cintura',
                            style: TextStyle(
                                height: 16,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  )
                ]),
              )
            ]));
  }

  Widget barraLaterale() {
    return Expanded(
        flex: 1,
        child: Container(
          foregroundDecoration: BoxDecoration(
            border: Border.all(width: 1),
          ),
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
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                            'Numero dei partecipanti\nNumero Società presenti'),
                      ))),
              Expanded(
                  child: Container(
                foregroundDecoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Text(
                  'PRESIDENTI DI GIURIA',
                  textAlign: TextAlign.center,
                ),
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
                child: Text(
                  'CLASSIFICA FINALE',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              )),
              Expanded(
                  child: Container(
                foregroundDecoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Text(
                  ' 1°',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
              Expanded(
                  child: Container(
                foregroundDecoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Text(
                  ' 2°',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
              Expanded(
                  child: Container(
                foregroundDecoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Text(
                  ' 3°',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
              Expanded(
                  child: Container(
                foregroundDecoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Text(
                  ' 4°',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
              Expanded(
                  child: Container(
                foregroundDecoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Text(
                  'GIURIA DI KATA',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              )),
              Expanded(
                  child: Container(
                foregroundDecoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Text(' 1'),
              )),
              Expanded(
                  child: Container(
                foregroundDecoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Text(' 2'),
              )),
              Expanded(
                  child: Container(
                foregroundDecoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Text(' 3'),
              )),
              Expanded(
                  child: Container(
                foregroundDecoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Text(' 4'),
              )),
              Expanded(
                  child: Container(
                foregroundDecoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Text(' 5'),
              )),
              Expanded(
                  child: Container(
                child: Text(' NOTE\n 1 Punteggio del Kata'),
              )),
              Expanded(
                  child: Container(
                child: Text(' 2 Nome del Kata\n 3 Totale del Kata'),
              )),
              Expanded(
                  child: Container(
//            foregroundDecoration: BoxDecoration(
//              Border.all(width: 1),
//            ),
//                child: Text(
//                    '4 Totale delle note del 1° e 2° Kata\n5 Class. dopo i Kata'),
                child: Text(''),
              )),
            ],
          ),
        ));
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
        _data = '12-03-2023';
        _citta = 'Busto Arsizio';
        _categoria =
            '${element['NOME']} ${element['COGNOME']} ${element['SOCIETA']} ${element['SOCIETA2']}';
        _classe =
            '${element['NOME']} ${element['SOCIETA']} ${element['SOCIETA2']}';
        _cintura = '${element['COGNOME']}';
      } else {
        pdfDataList.add(element);
      }
    }
    document.addPage(await testata());
    document.addPage(await pagina());
    final file = File("kata-tabelloni.pdf");
    await file.writeAsBytes(await document.save());
  }
}
