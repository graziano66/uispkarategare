import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
//import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'dart:io';

//Create a PDF document.
final PdfDocument document = PdfDocument();
late PdfSection section;
late PdfFont mainFont;
late PdfFont noteFont;
late PdfPage page;
late Size pageSize;

String pdfGara = '';
String pdfData = '';
String pdfCitta = '';
String pdfCategoria = '';

createPdfStart() {
  // Create a PDF section and set A3 Landscape.
  section = document.sections!.add();
  section.pageSettings.size = PdfPageSize.a3;
  section.pageSettings.orientation = PdfPageOrientation.landscape;
  // font principale
  mainFont = PdfStandardFont(PdfFontFamily.helvetica, 16);
  noteFont = PdfStandardFont(PdfFontFamily.helvetica, 9);
}

createPdfEnd() async {
  List<int> bytes = await document.save();
  //Dispose the document.
  document.dispose();
  File('output.pdf').writeAsBytes(bytes);
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
      bounds: Rect.fromLTWH(0, 0, pageSize.width / 6, rowHeight));

  page.graphics.drawString('GARA: ', mainFont,
      pen: PdfPens.black,
      bounds:
          Rect.fromLTWH(pageSize.width / 6, 0, pageSize.width / 6, rowHeight));
  page.graphics.drawString('DATA:', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          pageSize.width / 6, rowHeight / 2, pageSize.width / 6, rowHeight));
  page.graphics.drawString('CITTA:', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          pageSize.width / 6 * 2, 0, pageSize.width / 6, rowHeight));
  page.graphics.drawString('CAT.$pdfCategoria $pdfCitta', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          pageSize.width / 6 * 3, 0, pageSize.width / 6, rowHeight));
  page.graphics.drawString('$pdfGara $pdfData', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 3, rowHeight / 2,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString('Tabellone Gara KATA N.', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          pageSize.width / 6 * 4, 0, pageSize.width / 6, rowHeight));

  page.graphics.drawString('CLUB / CITTA', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          pageSize.width / 6 * 0, rowHeight, pageSize.width / 6, rowHeight));
  page.graphics.drawString('COGNOME / NOME', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          pageSize.width / 6 * 1, rowHeight, pageSize.width / 6, rowHeight));
  page.graphics.drawString('    1^ KATA         NOTE', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          pageSize.width / 6 * 2, rowHeight, pageSize.width / 6, rowHeight));
  page.graphics.drawString('    2^ KATA         NOTE', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          pageSize.width / 6 * 3, rowHeight, pageSize.width / 6, rowHeight));
  page.graphics.drawString('    3^ KATA         NOTE', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(
          pageSize.width / 6 * 4, rowHeight, pageSize.width / 6, rowHeight));

  page.graphics.drawString('Numero dei partecipanti', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 5, rowHeight * 0,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString('Numero Socità presenti', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 5, rowHeight * 0.5,
          pageSize.width / 6, rowHeight));
  page.graphics.drawString(' PRESIDENTI DI GIURIA', mainFont,
      pen: PdfPens.black,
      bounds: Rect.fromLTWH(pageSize.width / 6 * 5, rowHeight * 1,
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
    page.graphics.drawString(element['SOCIETA'], mainFont,
        pen: PdfPens.black,
        bounds: Rect.fromLTWH(0, i * rowHeight + rowHeight / 2,
            pageSize.width / 6, rowHeight / 2));
    page.graphics.drawString(element['SOCIETA2'], mainFont,
        pen: PdfPens.black,
        bounds: Rect.fromLTWH(
            0, i * rowHeight + rowHeight, pageSize.width / 6, rowHeight / 2));
    page.graphics.drawString(element['COGNOME'], mainFont,
        pen: PdfPens.black,
        bounds: Rect.fromLTWH(pageSize.width / 6, i * rowHeight + rowHeight / 2,
            pageSize.width / 6, rowHeight / 2));
    page.graphics.drawString(element['NOME'], mainFont,
        pen: PdfPens.black,
        bounds: Rect.fromLTWH(pageSize.width / 6, i * rowHeight + rowHeight,
            pageSize.width / 6, rowHeight / 2));
    i += 1;
  }
}
