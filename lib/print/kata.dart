import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
//import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'dart:io';

//Create a PDF document.
late PdfDocument document;
late PdfSection section;
late PdfFont mainFont;
late PdfFont noteFont;
late PdfFont asdFont;
late PdfFont atletaFont;
late PdfFont titleFont;
late PdfFont subTitleFont;

late PdfPage page;
late Size pageSize;
late Uint8List fontDataMain;
late Uint8List fontDataNote;

late Uint8List imageData1;
late Uint8List imageData2;
late PdfBitmap image1;
late PdfBitmap image2;

String pdfTitolo1 = '11° TROFEO di KARATE';
String pdfTitolo2 = 'Città di ARCISATE';
String pdfGara = '';
String pdfData = '';
String pdfCitta = '';
String pdfCategoria = '';
String pdfTipo = '';

createPdfStart() {
  // Create a PDF section and set A3 Landscape.
  document = PdfDocument();
  section = document.sections!.add();
  section.pageSettings.size = PdfPageSize.a3;
  section.pageSettings.orientation = PdfPageOrientation.landscape;
  // font principale

  fontDataMain = File('arial.ttf').readAsBytesSync();
  mainFont = PdfTrueTypeFont(fontDataMain, 9);
  fontDataNote = File('calibri.ttf').readAsBytesSync();
  noteFont = PdfTrueTypeFont(fontDataMain, 7);

//  fontDataNote = File('calibri.ttf').readAsBytesSync();
  asdFont = PdfTrueTypeFont(fontDataMain, 12, style: PdfFontStyle.bold);

  mainFont = PdfStandardFont(PdfFontFamily.timesRoman, 12);
  noteFont = PdfStandardFont(PdfFontFamily.courier, 8);
  asdFont = PdfStandardFont(PdfFontFamily.courier, 12);
  atletaFont = PdfStandardFont(PdfFontFamily.courier, 14);
  titleFont = PdfStandardFont(PdfFontFamily.courier, 24);
  subTitleFont = PdfStandardFont(PdfFontFamily.courier, 14);

  imageData1 = File('uisp.png').readAsBytesSync();
  imageData2 = File('ado.jpg').readAsBytesSync();
  image1 = PdfBitmap(imageData1);
  image2 = PdfBitmap(imageData2);
}

createPdfEnd() async {
  List<int> bytes = await document.save();
  //Dispose the document.
  document.dispose();
  File('kata.pdf').writeAsBytes(bytes);
}

createPdfAddPageTestata() {
  //Add page to the PDF
//  print('11111');
  page = section.pages.add();
  //Get page client size
//  print('2222');
  pageSize = page.getClientSize();
//  print('33333');
  pdfExternalPageKata();
}

createPdfAddPage(List pdfDataList) {
  //Add page to the PDF
//  print('11111');
  page = section.pages.add();
  //Get page client size
//  print('2222');
  pageSize = page.getClientSize();
//  print('33333');
  pdfInternalPageKata(pdfDataList);
}

pdfInternalPageKata(List pdfDataList) {
//  print('eeeee');
//  print(page);
//  print(pageSize);
  page.graphics.drawRectangle(
      bounds: Rect.fromLTWH(0, 0, pageSize.width, pageSize.height),
      pen: PdfPens.black);
  // Calcolo del numero di righe nella pagina
//  print('fff');
  var rowHeight = pageSize.height / 17.5;
  // disegna la prima riga
  page.graphics.drawLine(
      PdfPens.black, Offset(0, rowHeight), Offset(pageSize.width, rowHeight));
  // disegna la seconda riga
  page.graphics.drawLine(PdfPens.black, Offset(0, rowHeight + rowHeight / 2),
      Offset(pageSize.width / 6 * 5, rowHeight + rowHeight / 2));
  // disegna le altre righe
  for (var i = 2; i < 17; i++) {
    page.graphics.drawLine(
        PdfPens.black,
        Offset(0, i * rowHeight + rowHeight / 2),
        Offset(pageSize.width / 6 * 5, i * rowHeight + rowHeight / 2));
  }

  // disegna le righe verticali
  for (var i = 1; i < 6; i++) {
    page.graphics.drawLine(PdfPens.black, Offset(pageSize.width / 6 * i, 0),
        Offset(pageSize.width / 6 * i, pageSize.height));
  }
  // disegna le righe orizzontali sul lato destro
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5, 4 * rowHeight / 2),
      Offset(pageSize.width / 6 * 6, 4 * rowHeight / 2));
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5, 5 * rowHeight / 2),
      Offset(pageSize.width / 6 * 6, 5 * rowHeight / 2));
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5, 6 * rowHeight / 2),
      Offset(pageSize.width / 6 * 6, 6 * rowHeight / 2));
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5, 8 * rowHeight / 2),
      Offset(pageSize.width / 6 * 6, 8 * rowHeight / 2));
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5, 10 * rowHeight / 2),
      Offset(pageSize.width / 6 * 6, 10 * rowHeight / 2));
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5, 11 * rowHeight / 2),
      Offset(pageSize.width / 6 * 6, 11 * rowHeight / 2));
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5, 12 * rowHeight / 2),
      Offset(pageSize.width / 6 * 6, 12 * rowHeight / 2));
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5, 13 * rowHeight / 2),
      Offset(pageSize.width / 6 * 6, 13 * rowHeight / 2));
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5, 14 * rowHeight / 2),
      Offset(pageSize.width / 6 * 6, 14 * rowHeight / 2));
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5, 16 * rowHeight / 2),
      Offset(pageSize.width / 6 * 6, 16 * rowHeight / 2));
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5, 17 * rowHeight / 2),
      Offset(pageSize.width / 6 * 6, 17 * rowHeight / 2));
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5, 18 * rowHeight / 2),
      Offset(pageSize.width / 6 * 6, 18 * rowHeight / 2));
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5, 19 * rowHeight / 2),
      Offset(pageSize.width / 6 * 6, 19 * rowHeight / 2));
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5, 20 * rowHeight / 2),
      Offset(pageSize.width / 6 * 6, 20 * rowHeight / 2));
  // TODO: SPAREGGI

//  print('STAMPA OK');

// Disegna i quadrati del kata e delle note
  var squareWidth = pageSize.width / 6 / 8;
  var squareHeight = rowHeight / 2;

  for (var row = 1; row < 17; row++) {
    for (var col = 0; col < 3; col++) {
      page.graphics.drawRectangle(
          bounds: Rect.fromLTWH(pageSize.width / 6 * (col + 2),
              row * rowHeight + rowHeight / 2, squareWidth, squareHeight),
          pen: PdfPens.black);
      page.graphics.drawRectangle(
          bounds: Rect.fromLTWH(
              squareWidth * 1 + pageSize.width / 6 * (col + 2),
              row * rowHeight + rowHeight / 2,
              squareWidth,
              squareHeight),
          pen: PdfPens.black);
      page.graphics.drawRectangle(
          bounds: Rect.fromLTWH(
              squareWidth * 2 + pageSize.width / 6 * (col + 2),
              row * rowHeight + rowHeight / 2,
              squareWidth,
              squareHeight),
          pen: PdfPens.black);
      page.graphics.drawRectangle(
          bounds: Rect.fromLTWH(
              squareWidth * 3 + pageSize.width / 6 * (col + 2),
              row * rowHeight + rowHeight / 2,
              squareWidth,
              squareHeight),
          pen: PdfPens.black);
      page.graphics.drawRectangle(
          bounds: Rect.fromLTWH(
              squareWidth * 4 + pageSize.width / 6 * (col + 2),
              row * rowHeight + rowHeight / 2,
              squareWidth,
              squareHeight),
          pen: PdfPens.black);
      page.graphics.drawRectangle(
          bounds: Rect.fromLTWH(
              squareWidth * 5 + pageSize.width / 6 * (col + 2),
              row * rowHeight + rowHeight / 2,
              squareWidth * 3,
              squareHeight),
          pen: PdfPens.black);

      page.graphics.drawRectangle(
          bounds: Rect.fromLTWH(pageSize.width / 6 * (col + 2),
              row * rowHeight + rowHeight, squareWidth * 3, squareHeight),
          pen: PdfPens.black);
      page.graphics.drawRectangle(
          bounds: Rect.fromLTWH(
              squareWidth * 3 + pageSize.width / 6 * (col + 2),
              row * rowHeight + rowHeight,
              squareWidth * 2,
              squareHeight),
          pen: PdfPens.black);
      page.graphics.drawRectangle(
          bounds: Rect.fromLTWH(
              squareWidth * 5 + pageSize.width / 6 * (col + 2),
              row * rowHeight + rowHeight,
              squareWidth * 3,
              squareHeight),
          pen: PdfPens.black);
    }
  }

// PARTE CON LE SCRITTE
//  print('STAMPA OK2');

  page.graphics.drawString('UISP Area Nazionale Discipline Orientali', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(10, 10, pageSize.width / 6, rowHeight));

  page.graphics.drawString('GARA: ', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          10 + pageSize.width / 6, 10, pageSize.width / 6, rowHeight));
  page.graphics.drawString('DATA:', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(10 + pageSize.width / 6, rowHeight / 2,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString('CITTA:', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          10 + pageSize.width / 6 * 2, 10, pageSize.width / 6, rowHeight));
  page.graphics.drawString('CAT.  $pdfCategoria  $pdfCitta', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          10 + pageSize.width / 6 * 3, 10, pageSize.width / 6, rowHeight));
  page.graphics.drawString('$pdfGara $pdfData', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(10 + pageSize.width / 6 * 3, rowHeight / 2,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString('Tabellone Gara KATA N.', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          10 + pageSize.width / 6 * 4, 10, pageSize.width / 6, rowHeight));

  page.graphics.drawString('CLUB / CITTA', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(10 + pageSize.width / 6 * 0, 5 + rowHeight,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString('COGNOME / NOME', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(10 + pageSize.width / 6 * 1, 5 + rowHeight,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString('    1^ KATA         NOTE', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 2, 5 + rowHeight,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString('    2^ KATA         NOTE', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 3, 5 + rowHeight,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString('    3^ KATA         NOTE', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 4, 5 + rowHeight,
          pageSize.width / 6, rowHeight));

  page.graphics.drawString('Numero dei partecipanti', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(10 + pageSize.width / 6 * 5, 5 + rowHeight * 0,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString('Numero Socità presenti', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(10 + pageSize.width / 6 * 5, rowHeight * 0.5,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString(' PRESIDENTI DI GIURIA', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(10 + pageSize.width / 6 * 5, 5 + rowHeight * 1,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString(
      '  Resp.della tenuta del tabellone di gara', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 5, rowHeight * 3,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString('CLASSIFICA FINALE', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          pageSize.width / 6 * 5, rowHeight * 4, pageSize.width / 6, rowHeight),
      format: PdfStringFormat(
        alignment: PdfTextAlignment.center,
//            lineAlignment: PdfVerticalAlignment.bottom)
      ));
  page.graphics.drawString(' 1^', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 5, rowHeight * 4.5,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString(' 2^', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 5, rowHeight * 5,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString(' 3^', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 5, rowHeight * 5.5,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString(' 4^', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 5, rowHeight * 6,
          pageSize.width / 6, rowHeight));

  page.graphics.drawString('GIURIA DI KATA', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          pageSize.width / 6 * 5, rowHeight * 7, pageSize.width / 6, rowHeight),
      format: PdfStringFormat(
        alignment: PdfTextAlignment.center,
//            lineAlignment: PdfVerticalAlignment.bottom)
      ));

  page.graphics.drawString(' 1', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 5, rowHeight * 7.5,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString(' 2', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 5, rowHeight * 8,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString(' 3', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 5, rowHeight * 8.5,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString(' 4', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 5, rowHeight * 9,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString(' 5', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 5, rowHeight * 9.5,
          pageSize.width / 6, rowHeight));

  page.graphics.drawString('EVENTUALI SPAREGGI', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 5, rowHeight * 10,
          pageSize.width / 6, rowHeight),
      format: PdfStringFormat(
        alignment: PdfTextAlignment.center,
//            lineAlignment: PdfVerticalAlignment.bottom)
      ));

  // Note sul tabellone
  page.graphics.drawString('1', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 2,
          1 * rowHeight + rowHeight / 2, squareHeight, rowHeight / 2));

  page.graphics.drawString('1', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 3,
          1 * rowHeight + rowHeight / 2, squareHeight, rowHeight / 2));

  page.graphics.drawString('1', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 4,
          1 * rowHeight + rowHeight / 2, squareHeight, rowHeight / 2));

  page.graphics.drawString('2', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 2, 1 * rowHeight + rowHeight,
          squareHeight, rowHeight / 2));

  page.graphics.drawString('2', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 3, 1 * rowHeight + rowHeight,
          squareHeight, rowHeight / 2));

  page.graphics.drawString('2', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 4, 1 * rowHeight + rowHeight,
          squareHeight, rowHeight / 2));

  page.graphics.drawString('3', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 2 + squareWidth * 3,
          1 * rowHeight + rowHeight, squareHeight, rowHeight / 2));

  page.graphics.drawString('3', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 3 + squareWidth * 3,
          1 * rowHeight + rowHeight, squareHeight, rowHeight / 2));

  page.graphics.drawString('3', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 4 + squareWidth * 3,
          1 * rowHeight + rowHeight, squareHeight, rowHeight / 2));

  page.graphics.drawString('4', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 3 + squareWidth * 5,
          1 * rowHeight + rowHeight / 2, squareHeight, rowHeight / 2));

  page.graphics.drawString('4', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 4 + squareWidth * 5,
          1 * rowHeight + rowHeight / 2, squareHeight, rowHeight / 2));

  page.graphics.drawString('5', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 4 + squareWidth * 5,
          1 * rowHeight + rowHeight, squareHeight, rowHeight / 2));
  // Angolo in basso con le note
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5,
          pageSize.height - rowHeight / 4 * 5 - rowHeight / 4),
      Offset(pageSize.width / 6 * 6,
          pageSize.height - rowHeight / 4 * 5 - rowHeight / 4));

  page.graphics.drawString('           NOTE', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          pageSize.width / 6 * 5,
          pageSize.height - rowHeight / 4 * 5 - rowHeight / 4,
          pageSize.width / 6,
          rowHeight / 2));

  page.graphics.drawString('  1 - PUNTEGGIO DEL KATA', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          pageSize.width / 6 * 5,
          pageSize.height - rowHeight / 4 * 4 - rowHeight / 4,
          pageSize.width / 6,
          rowHeight / 2));

  page.graphics.drawString('  2 - NOME DEL KATA', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          pageSize.width / 6 * 5,
          pageSize.height - rowHeight / 4 * 3 - rowHeight / 4,
          pageSize.width / 6,
          rowHeight / 2));

  page.graphics.drawString('  3 - TOTALE DEL KATA', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          pageSize.width / 6 * 5,
          pageSize.height - rowHeight / 4 * 2 - rowHeight / 4,
          pageSize.width / 6,
          rowHeight / 2));

  page.graphics.drawString('  4 - SOMMA DEI TOTALI DEL KATA', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          pageSize.width / 6 * 5,
          pageSize.height - rowHeight / 4 * 1 - rowHeight / 4,
          pageSize.width / 6,
          rowHeight / 2));

  page.graphics.drawString('  5 - CLASSIFICA DOPO I KATA', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          pageSize.width / 6 * 5,
          pageSize.height - rowHeight / 4 * 0 - rowHeight / 4,
          pageSize.width / 6,
          rowHeight / 2));

// STAMPA ELENCO
  int i = 1;
  for (var element in pdfDataList) {
    page.graphics.drawString(element['SOCIETA'], asdFont,
        pen: PdfPens.black,
        bounds: Rect.fromLTWH(10, 10 + i * rowHeight + rowHeight / 2,
            pageSize.width / 6, rowHeight / 2));
    page.graphics.drawString(element['SOCIETA2'], asdFont,
        pen: PdfPens.black,
        bounds: Rect.fromLTWH(
            10, i * rowHeight + rowHeight, pageSize.width / 6, rowHeight / 2));
    page.graphics.drawString(element['COGNOME'], atletaFont,
        pen: PdfPens.black,
        bounds: Rect.fromLTWH(
            10 + pageSize.width / 6,
            10 + i * rowHeight + rowHeight / 2,
            pageSize.width / 6,
            rowHeight / 2));
    page.graphics.drawString(element['NOME'], atletaFont,
        pen: PdfPens.black,
        bounds: Rect.fromLTWH(10 + pageSize.width / 6,
            i * rowHeight + rowHeight, pageSize.width / 6, rowHeight / 2));
    i += 1;
  }
}

pdfExternalPageKata() {
// LATO DESTRO
  int offsetX = 70;
//  page.graphics.drawImage(image1, Rect.fromLTWH(100, 0, 200, 200));
//  page.graphics.drawImage(image2, Rect.fromLTWH(200, 0, 200, 200));
  page.graphics.drawRectangle(
      bounds: Rect.fromCenter(
          center: Offset(pageSize.width - pageSize.width / 4 + offsetX,
              pageSize.height - pageSize.height / 2),
          width: pageSize.width / 2 - 100 - offsetX,
          height: 100),
      pen: PdfPens.black);

  page.graphics.drawString(
    'AREA DISCIPLINE ORIENTALI',
    titleFont,
    pen: PdfPens.black,
    bounds: Rect.fromLTWH(pageSize.width - pageSize.width / 2 + 100 + offsetX,
        pageSize.height - pageSize.height / 2 - 250, 500, 500),
  );

  page.graphics.drawString(
    'VERBALE DELLA GARA DI KATA',
    subTitleFont,
    pen: PdfPens.black,
    bounds: Rect.fromLTWH(pageSize.width - pageSize.width / 2 + 150 + offsetX,
        pageSize.height - pageSize.height / 2 - 200, 500, 500),
  );

  page.graphics.drawString(
    pdfTitolo1,
    titleFont,
    pen: PdfPens.black,
    bounds: Rect.fromLTWH(pageSize.width - pageSize.width / 2 + 130 + offsetX,
        pageSize.height - pageSize.height / 2 - 150, 500, 500),
  );
  page.graphics.drawString(
    pdfTitolo2,
    titleFont,
    pen: PdfPens.black,
    bounds: Rect.fromLTWH(pageSize.width - pageSize.width / 2 + 160 + offsetX,
        pageSize.height - pageSize.height / 2 - 100, 500, 500),
  );

  page.graphics.drawString(
    'Classe: $pdfGara $pdfData',
    subTitleFont,
    pen: PdfPens.black,
    bounds: Rect.fromLTWH(pageSize.width - pageSize.width / 2 + 90 + offsetX,
        pageSize.height - pageSize.height / 2 - 30, 500, 500),
  );

  page.graphics.drawString(
    'Cintura: $pdfCategoria  $pdfCitta',
    subTitleFont,
    pen: PdfPens.black,
    bounds: Rect.fromLTWH(pageSize.width - pageSize.width / 2 + 90 + offsetX,
        pageSize.height - pageSize.height / 2 - 0, 500, 500),
  );

// LATO SINISTRO

//  page.graphics.drawImage(image1, Rect.fromLTWH(100, 0, 200, 200));
//  page.graphics.drawImage(image2, Rect.fromLTWH(200, 0, 200, 200));

  page.graphics.drawString(
    'AREA DISCIPLINE ORIENTALI',
    titleFont,
    pen: PdfPens.black,
    bounds: Rect.fromLTWH(
        100, pageSize.height - pageSize.height / 2 - 250, 500, 500),
  );

  page.graphics.drawString(
    'UISP',
    titleFont,
    pen: PdfPens.black,
    bounds: Rect.fromLTWH(
        250, pageSize.height - pageSize.height / 2 - 200, 500, 500),
  );

  page.graphics.drawString(
    'CLASSIFICA INDIVIDUALE DELLA CATEGORIA:',
    subTitleFont,
    pen: PdfPens.black,
    bounds:
        Rect.fromLTWH(50, pageSize.height - pageSize.height / 2 - 30, 500, 500),
  );
  page.graphics.drawString(
    '$pdfCategoria  $pdfCitta  $pdfGara $pdfData',
    subTitleFont,
    pen: PdfPens.black,
    bounds:
        Rect.fromLTWH(50, pageSize.height - pageSize.height / 2 - 0, 500, 500),
  );

  for (var i = 1; i < 10; i++) {
    page.graphics.drawLine(
        PdfPens.black,
        Offset(20, pageSize.height / 2 + pageSize.height / 20 * i),
        Offset(pageSize.width / 2 - 20,
            pageSize.height / 2 + pageSize.height / 20 * i));
  }
  page.graphics.drawLine(
      PdfPens.black,
      Offset(20, pageSize.height / 2 + pageSize.height / 20 * 1),
      Offset(20, pageSize.height / 2 + pageSize.height / 20 * 9));

  page.graphics.drawLine(
      PdfPens.black,
      Offset(80, pageSize.height / 2 + pageSize.height / 20 * 1),
      Offset(80, pageSize.height / 2 + pageSize.height / 20 * 9));
  page.graphics.drawLine(
      PdfPens.black,
      Offset(
          pageSize.width / 4, pageSize.height / 2 + pageSize.height / 20 * 1),
      Offset(
          pageSize.width / 4, pageSize.height / 2 + pageSize.height / 20 * 9));
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 2 - 80,
          pageSize.height / 2 + pageSize.height / 20 * 1),
      Offset(pageSize.width / 2 - 80,
          pageSize.height / 2 + pageSize.height / 20 * 9));

  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 2 - 20,
          pageSize.height / 2 + pageSize.height / 20 * 1),
      Offset(pageSize.width / 2 - 20,
          pageSize.height / 2 + pageSize.height / 20 * 9));

  page.graphics.drawString('CLASS.', subTitleFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          20,
          pageSize.height / 2 + pageSize.height / 20 * 1 + 10,
          200,
          pageSize.height / 2 + pageSize.height / 20 * 9));

  page.graphics.drawString('ATLETA', subTitleFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          150,
          pageSize.height / 2 + pageSize.height / 20 * 1 + 10,
          200,
          pageSize.height / 2 + pageSize.height / 20 * 9));
  page.graphics.drawString('SOCIETA\'', subTitleFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          350,
          pageSize.height / 2 + pageSize.height / 20 * 1 + 10,
          200,
          pageSize.height / 2 + pageSize.height / 20 * 9));
  page.graphics.drawString('PUNTI', subTitleFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          480,
          pageSize.height / 2 + pageSize.height / 20 * 1 + 10,
          200,
          pageSize.height / 2 + pageSize.height / 20 * 9));

  for (var i = 2; i < 9; i++) {
    page.graphics.drawString('${i - 1}°', titleFont,
        pen: PdfPens.black,
        bounds: Rect.fromLTWH(
            40,
            pageSize.height / 2 + pageSize.height / 20 * i + 10,
            80,
            pageSize.height / 2 + pageSize.height / 20 * 9));
  }
  // XXX
}

rr(pdfDataList) {
  var rowHeight = pageSize.height / 17.5;

  // disegna le righe verticali
  for (var i = 1; i < 6; i++) {
    page.graphics.drawLine(PdfPens.black, Offset(pageSize.width / 6 * i, 0),
        Offset(pageSize.width / 6 * i, pageSize.height));
  }
  // disegna le righe orizzontali sul lato destro
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5, 4 * rowHeight / 2),
      Offset(pageSize.width / 6 * 6, 4 * rowHeight / 2));
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5, 5 * rowHeight / 2),
      Offset(pageSize.width / 6 * 6, 5 * rowHeight / 2));
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5, 6 * rowHeight / 2),
      Offset(pageSize.width / 6 * 6, 6 * rowHeight / 2));
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5, 8 * rowHeight / 2),
      Offset(pageSize.width / 6 * 6, 8 * rowHeight / 2));
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5, 10 * rowHeight / 2),
      Offset(pageSize.width / 6 * 6, 10 * rowHeight / 2));
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5, 11 * rowHeight / 2),
      Offset(pageSize.width / 6 * 6, 11 * rowHeight / 2));
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5, 12 * rowHeight / 2),
      Offset(pageSize.width / 6 * 6, 12 * rowHeight / 2));
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5, 13 * rowHeight / 2),
      Offset(pageSize.width / 6 * 6, 13 * rowHeight / 2));
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5, 14 * rowHeight / 2),
      Offset(pageSize.width / 6 * 6, 14 * rowHeight / 2));
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5, 16 * rowHeight / 2),
      Offset(pageSize.width / 6 * 6, 16 * rowHeight / 2));
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5, 17 * rowHeight / 2),
      Offset(pageSize.width / 6 * 6, 17 * rowHeight / 2));
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5, 18 * rowHeight / 2),
      Offset(pageSize.width / 6 * 6, 18 * rowHeight / 2));
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5, 19 * rowHeight / 2),
      Offset(pageSize.width / 6 * 6, 19 * rowHeight / 2));
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5, 20 * rowHeight / 2),
      Offset(pageSize.width / 6 * 6, 20 * rowHeight / 2));
  // TODO: SPAREGGI

//  print('STAMPA OK');

// Disegna i quadrati del kata e delle note
  var squareWidth = pageSize.width / 6 / 8;
  var squareHeight = rowHeight / 2;

  for (var row = 1; row < 17; row++) {
    for (var col = 0; col < 3; col++) {
      page.graphics.drawRectangle(
          bounds: Rect.fromLTWH(pageSize.width / 6 * (col + 2),
              row * rowHeight + rowHeight / 2, squareWidth, squareHeight),
          pen: PdfPens.black);
      page.graphics.drawRectangle(
          bounds: Rect.fromLTWH(
              squareWidth * 1 + pageSize.width / 6 * (col + 2),
              row * rowHeight + rowHeight / 2,
              squareWidth,
              squareHeight),
          pen: PdfPens.black);
      page.graphics.drawRectangle(
          bounds: Rect.fromLTWH(
              squareWidth * 2 + pageSize.width / 6 * (col + 2),
              row * rowHeight + rowHeight / 2,
              squareWidth,
              squareHeight),
          pen: PdfPens.black);
      page.graphics.drawRectangle(
          bounds: Rect.fromLTWH(
              squareWidth * 3 + pageSize.width / 6 * (col + 2),
              row * rowHeight + rowHeight / 2,
              squareWidth,
              squareHeight),
          pen: PdfPens.black);
      page.graphics.drawRectangle(
          bounds: Rect.fromLTWH(
              squareWidth * 4 + pageSize.width / 6 * (col + 2),
              row * rowHeight + rowHeight / 2,
              squareWidth,
              squareHeight),
          pen: PdfPens.black);
      page.graphics.drawRectangle(
          bounds: Rect.fromLTWH(
              squareWidth * 5 + pageSize.width / 6 * (col + 2),
              row * rowHeight + rowHeight / 2,
              squareWidth * 3,
              squareHeight),
          pen: PdfPens.black);

      page.graphics.drawRectangle(
          bounds: Rect.fromLTWH(pageSize.width / 6 * (col + 2),
              row * rowHeight + rowHeight, squareWidth * 3, squareHeight),
          pen: PdfPens.black);
      page.graphics.drawRectangle(
          bounds: Rect.fromLTWH(
              squareWidth * 3 + pageSize.width / 6 * (col + 2),
              row * rowHeight + rowHeight,
              squareWidth * 2,
              squareHeight),
          pen: PdfPens.black);
      page.graphics.drawRectangle(
          bounds: Rect.fromLTWH(
              squareWidth * 5 + pageSize.width / 6 * (col + 2),
              row * rowHeight + rowHeight,
              squareWidth * 3,
              squareHeight),
          pen: PdfPens.black);
    }
  }

// PARTE CON LE SCRITTE
//  print('STAMPA OK2');

  page.graphics.drawString('UISP', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(10, 10, pageSize.width / 6, rowHeight));
  page.graphics.drawString('Area Nazionale Discipline Orientali', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(10, rowHeight / 2, pageSize.width / 6, rowHeight));

  page.graphics.drawString('GARA: 11° TROFEO di KARATE', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          10 + pageSize.width / 6, 10, pageSize.width / 6, rowHeight));
  page.graphics.drawString('DATA: 05/02/2023', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(10 + pageSize.width / 6, rowHeight / 2,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString('CITTA: ARCISATE', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          10 + pageSize.width / 6 * 2, 10, pageSize.width / 6, rowHeight));
  page.graphics.drawString('CAT.  $pdfCategoria  $pdfCitta', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          10 + pageSize.width / 6 * 3, 10, pageSize.width / 6, rowHeight));
  page.graphics.drawString('$pdfGara $pdfData', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(10 + pageSize.width / 6 * 3, rowHeight / 2,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString('Tabellone Gara KATA N.', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          10 + pageSize.width / 6 * 4, 10, pageSize.width / 6, rowHeight));

  page.graphics.drawString('CLUB / CITTA', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(10 + pageSize.width / 6 * 0, 5 + rowHeight,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString('COGNOME / NOME', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(10 + pageSize.width / 6 * 1, 5 + rowHeight,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString('    1^ KATA         NOTE', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 2, 5 + rowHeight,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString('    2^ KATA         NOTE', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 3, 5 + rowHeight,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString('    3^ KATA         NOTE', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 4, 5 + rowHeight,
          pageSize.width / 6, rowHeight));

  page.graphics.drawString('Numero dei partecipanti', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(10 + pageSize.width / 6 * 5, 5 + rowHeight * 0,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString('Numero Socità presenti', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(10 + pageSize.width / 6 * 5, rowHeight * 0.5,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString(' PRESIDENTI DI GIURIA', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(10 + pageSize.width / 6 * 5, 5 + rowHeight * 1,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString(
      '  Resp.della tenuta del tabellone di gara', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 5, rowHeight * 3,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString('CLASSIFICA FINALE', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          pageSize.width / 6 * 5, rowHeight * 4, pageSize.width / 6, rowHeight),
      format: PdfStringFormat(
        alignment: PdfTextAlignment.center,
//            lineAlignment: PdfVerticalAlignment.bottom)
      ));
  page.graphics.drawString(' 1^', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 5, rowHeight * 4.5,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString(' 2^', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 5, rowHeight * 5,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString(' 3^', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 5, rowHeight * 5.5,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString(' 4^', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 5, rowHeight * 6,
          pageSize.width / 6, rowHeight));

  page.graphics.drawString('GIURIA DI KATA', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          pageSize.width / 6 * 5, rowHeight * 7, pageSize.width / 6, rowHeight),
      format: PdfStringFormat(
        alignment: PdfTextAlignment.center,
//            lineAlignment: PdfVerticalAlignment.bottom)
      ));

  page.graphics.drawString(' 1', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 5, rowHeight * 7.5,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString(' 2', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 5, rowHeight * 8,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString(' 3', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 5, rowHeight * 8.5,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString(' 4', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 5, rowHeight * 9,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString(' 5', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 5, rowHeight * 9.5,
          pageSize.width / 6, rowHeight));

  page.graphics.drawString('EVENTUALI SPAREGGI', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 5, rowHeight * 10,
          pageSize.width / 6, rowHeight),
      format: PdfStringFormat(
        alignment: PdfTextAlignment.center,
//            lineAlignment: PdfVerticalAlignment.bottom)
      ));

  // Note sul tabellone
  page.graphics.drawString('1', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 2,
          1 * rowHeight + rowHeight / 2, squareHeight, rowHeight / 2));

  page.graphics.drawString('1', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 3,
          1 * rowHeight + rowHeight / 2, squareHeight, rowHeight / 2));

  page.graphics.drawString('1', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 4,
          1 * rowHeight + rowHeight / 2, squareHeight, rowHeight / 2));

  page.graphics.drawString('2', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 2, 1 * rowHeight + rowHeight,
          squareHeight, rowHeight / 2));

  page.graphics.drawString('2', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 3, 1 * rowHeight + rowHeight,
          squareHeight, rowHeight / 2));

  page.graphics.drawString('2', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 4, 1 * rowHeight + rowHeight,
          squareHeight, rowHeight / 2));

  page.graphics.drawString('3', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 2 + squareWidth * 3,
          1 * rowHeight + rowHeight, squareHeight, rowHeight / 2));

  page.graphics.drawString('3', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 3 + squareWidth * 3,
          1 * rowHeight + rowHeight, squareHeight, rowHeight / 2));

  page.graphics.drawString('3', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 4 + squareWidth * 3,
          1 * rowHeight + rowHeight, squareHeight, rowHeight / 2));

  page.graphics.drawString('4', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 3 + squareWidth * 5,
          1 * rowHeight + rowHeight / 2, squareHeight, rowHeight / 2));

  page.graphics.drawString('4', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 4 + squareWidth * 5,
          1 * rowHeight + rowHeight / 2, squareHeight, rowHeight / 2));

  page.graphics.drawString('5', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 4 + squareWidth * 5,
          1 * rowHeight + rowHeight, squareHeight, rowHeight / 2));
  // Angolo in basso con le note
  page.graphics.drawLine(
      PdfPens.black,
      Offset(pageSize.width / 6 * 5,
          pageSize.height - rowHeight / 4 * 5 - rowHeight / 4),
      Offset(pageSize.width / 6 * 6,
          pageSize.height - rowHeight / 4 * 5 - rowHeight / 4));

  page.graphics.drawString('           NOTE', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          pageSize.width / 6 * 5,
          pageSize.height - rowHeight / 4 * 5 - rowHeight / 4,
          pageSize.width / 6,
          rowHeight / 2));

  page.graphics.drawString('  1 - PUNTEGGIO DEL KATA', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          pageSize.width / 6 * 5,
          pageSize.height - rowHeight / 4 * 4 - rowHeight / 4,
          pageSize.width / 6,
          rowHeight / 2));

  page.graphics.drawString('  2 - NOME DEL KATA', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          pageSize.width / 6 * 5,
          pageSize.height - rowHeight / 4 * 3 - rowHeight / 4,
          pageSize.width / 6,
          rowHeight / 2));

  page.graphics.drawString('  3 - TOTALE DEL KATA', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          pageSize.width / 6 * 5,
          pageSize.height - rowHeight / 4 * 2 - rowHeight / 4,
          pageSize.width / 6,
          rowHeight / 2));

  page.graphics.drawString('  4 - SOMMA DEI TOTALI DEL KATA', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          pageSize.width / 6 * 5,
          pageSize.height - rowHeight / 4 * 1 - rowHeight / 4,
          pageSize.width / 6,
          rowHeight / 2));

  page.graphics.drawString('  5 - CLASSIFICA DOPO I KATA', noteFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          pageSize.width / 6 * 5,
          pageSize.height - rowHeight / 4 * 0 - rowHeight / 4,
          pageSize.width / 6,
          rowHeight / 2));
}

createElencoPdfStart() {
  // Create a PDF section and set A3 Landscape.
  document = PdfDocument();
  section = document.sections!.add();
  section.pageSettings.size = PdfPageSize.a4;
  section.pageSettings.orientation = PdfPageOrientation.portrait;
  // font principale

  fontDataMain = File('arial.ttf').readAsBytesSync();
  mainFont = PdfTrueTypeFont(fontDataMain, 9);
  fontDataNote = File('calibri.ttf').readAsBytesSync();
  noteFont = PdfTrueTypeFont(fontDataMain, 7);

//  fontDataNote = File('calibri.ttf').readAsBytesSync();
  asdFont = PdfTrueTypeFont(fontDataMain, 12, style: PdfFontStyle.bold);

  mainFont = PdfStandardFont(PdfFontFamily.timesRoman, 12);
  noteFont = PdfStandardFont(PdfFontFamily.courier, 8);
  asdFont = PdfStandardFont(PdfFontFamily.courier, 12);
  atletaFont = PdfStandardFont(PdfFontFamily.courier, 14);
  titleFont = PdfStandardFont(PdfFontFamily.courier, 24);
  subTitleFont = PdfStandardFont(PdfFontFamily.courier, 14);

//  imageData1 = File('uisp.png').readAsBytesSync();
//  imageData2 = File('ado.jpg').readAsBytesSync();
//  image1 = PdfBitmap(imageData1);
//  image2 = PdfBitmap(imageData2);
}

createElencoPdfEnd() async {
  List<int> bytes = await document.save();
  //Dispose the document.
  document.dispose();
  File('elenco.pdf').writeAsBytes(bytes);
}

createElencoPdfAddPage(List pdfDataList) {
  //Add page to the PDF
//  print('11111');
  page = section.pages.add();
  //Get page client size
//  print('2222');
  pageSize = page.getClientSize();
//  print('33333');
  pdfElencoPage(pdfDataList);
}

pdfElencoPage(List pdfDataList) {
  double altezzaRiga = 40;
  double posizioneRiga = 0;

  String categoriaStr = '';
  if (pdfCategoria == 'U') categoriaStr = 'UNIFICATA';
  if (pdfCategoria == 'F') categoriaStr = 'FEMMINE';
  if (pdfCategoria == 'M') categoriaStr = 'MASCHI';

  page.graphics.drawRectangle(
      bounds: Rect.fromLTWH(0, 0, pageSize.width, altezzaRiga),
      pen: PdfPens.black);
  page.graphics.drawString('$pdfTipo $pdfGara $categoriaStr', titleFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(20, 5, pageSize.width, altezzaRiga));
  page.graphics.drawRectangle(
      bounds: Rect.fromLTWH(0, altezzaRiga, pageSize.width, altezzaRiga),
      pen: PdfPens.black);
  page.graphics.drawString('CINTURA  $pdfCitta', titleFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(20, 5 + altezzaRiga, pageSize.width, altezzaRiga));

  posizioneRiga = altezzaRiga * 2;
  altezzaRiga = 30;

  page.graphics.drawRectangle(
      bounds: Rect.fromLTWH(pageSize.width / 2 * 0, posizioneRiga,
          pageSize.width / 2, altezzaRiga),
      pen: PdfPens.black);
//  page.graphics.drawRectangle(
//      bounds: Rect.fromLTWH(pageSize.width / 4 * 1, posizioneRiga,
//          pageSize.width / 4, altezzaRiga),
//      pen: PdfPens.black);
  page.graphics.drawRectangle(
      bounds: Rect.fromLTWH(pageSize.width / 2 * 2, posizioneRiga,
          pageSize.width / 2, altezzaRiga),
      pen: PdfPens.black);
//  page.graphics.drawRectangle(
//      bounds: Rect.fromLTWH(pageSize.width / 4 * 3, posizioneRiga,
//          pageSize.width / 4, altezzaRiga),
//      pen: PdfPens.black);
  page.graphics.drawString('SOCIETA', subTitleFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(20 + pageSize.width / 4 * 0, 5 + posizioneRiga,
          pageSize.width / 2, altezzaRiga));
  //page.graphics.drawString('CITTA\'', subTitleFont,
//      pen: PdfPens.black,
//      bounds: Rect.fromLTWH(20 + pageSize.width / 4 * 1, 10 + posizioneRiga,
//          pageSize.width / 4, altezzaRiga));
  page.graphics.drawString('NOME / COGNOME', subTitleFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(20 + pageSize.width / 4 * 2, 5 + posizioneRiga,
          pageSize.width / 2, altezzaRiga));

//  page.graphics.drawString('COGNOME', subTitleFont,
//      pen: PdfPens.black,
//      bounds: Rect.fromLTWH(20 + pageSize.width / 4 * 3, 10 + posizioneRiga,
//          pageSize.width / 4, altezzaRiga));

//  PdfFont font1 = PdfStandardFont(PdfFontFamily.courier, 10);

  posizioneRiga += altezzaRiga;
  altezzaRiga = 45;

  for (var element in pdfDataList) {
    page.graphics.drawRectangle(
        bounds: Rect.fromLTWH(pageSize.width / 2 * 0, posizioneRiga,
            pageSize.width / 2, altezzaRiga),
        pen: PdfPens.black);
    page.graphics.drawRectangle(
        bounds: Rect.fromLTWH(pageSize.width / 2 * 1, posizioneRiga,
            pageSize.width / 2, altezzaRiga),
        pen: PdfPens.black);
    page.graphics.drawString(element['SOCIETA'].toString(), asdFont,
        pen: PdfPens.black,
        bounds: Rect.fromLTWH(10 + pageSize.width / 2 * 0, 5 + posizioneRiga,
            pageSize.width / 2, altezzaRiga / 2));
    page.graphics.drawString(element['SOCIETA2'].toString(), asdFont,
        pen: PdfPens.black,
        bounds: Rect.fromLTWH(10 + pageSize.width / 2 * 0, 25 + posizioneRiga,
            pageSize.width / 2, altezzaRiga));
    page.graphics.drawString(element['NOME'].toString(), atletaFont,
        pen: PdfPens.black,
        bounds: Rect.fromLTWH(10 + pageSize.width / 2 * 1, 5 + posizioneRiga,
            pageSize.width / 2, altezzaRiga));

    page.graphics.drawString(element['COGNOME'].toString(), atletaFont,
        pen: PdfPens.black,
        bounds: Rect.fromLTWH(10 + pageSize.width / 2 * 1, 25 + posizioneRiga,
            pageSize.width / 2, altezzaRiga));
    posizioneRiga += altezzaRiga;
  }
}
