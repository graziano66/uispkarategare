import 'dart:io';
import 'dart:convert';
//import 'package:intl/intl.dart';
//import 'package:file_picker/file_picker.dart';
import 'package:csv/csv.dart';
//import 'package:flutter/material.dart';
//import 'package:pdf/widgets.dart';
//import 'package:uispkarategare/drawer.dart';
import 'package:uispkarategare/global.dart';
import 'package:uispkarategare/database/sql.dart';

caricaRegoleKumiteDaCSV(f, context) async {
//  print('CARICO ELENCO CINTURE');
  getDataCintureList();
//  print('INIZIO CARICA REGOLE');
  String errore = '';
  int numeroErrori = 0;
  final input = File(f.files.single.path!).openRead();
  final fields = await input
      .transform(utf8.decoder)
      .transform(const CsvToListConverter())
      .toList();
// CONTROLLO ERRORI
//  print('INIZIO CONTROLLO REGOLE');
  bool isFirstLine = true;
  int line = 1;
  for (var f in fields) {
    if (!isFirstLine) {
      if ((f[7].toString().toUpperCase() != 'M') &&
          (f[7].toString().toUpperCase() != 'F') &&
          (f[7].toString().toUpperCase() != 'U')) {
        errore =
            'Linea $line  Descrizione:${f[0].toString().toUpperCase()} Campo Sesso errato';
        showMessage(context, 'ERRORE', errore);
        numeroErrori += 1;
      }
      if (controllaCintura(f[5].toString()) == -1) {
        errore =
            'Linea $line  Descrizione:${f[0].toString().toUpperCase()} Campo Cintura errato';
        showMessage(context, 'ERRORE', errore);
        numeroErrori += 1;
      }
      if (controllaCintura(f[6].toString()) == -1) {
        errore =
            'Linea $line  Descrizione:${f[0].toString().toUpperCase()} Campo Cintura errato';
        showMessage(context, 'ERRORE', errore);
        numeroErrori += 1;
      }
      isFirstLine = false;
    }
  }
// INSERISCO SE CSV SENZA ERRORI
  if (numeroErrori == 0) {
    eseguiSql('DELETE FROM CATEGORIEKUMITE;');
    eseguiSql(
        'UPDATE GARE SET KUMITE=\'REGOLE IN CARICAMENTO....\' WHERE ID=1;');
    isFirstLine = true;
    for (var f in fields) {
      if (!isFirstLine) {
        Map<String, String> saveData = {};
        saveData['DESCRIZIONE'] = f[0].toString().toUpperCase();
        saveData['ANNO1'] = f[1].toString().toUpperCase();
        saveData['ANNO2'] = f[2].toString().toUpperCase();
        saveData['CINTURADA'] = controllaCintura(f[5].toString()).toString();
        saveData['CINTURAA'] = controllaCintura(f[6].toString()).toString();
        saveData['SESSO'] = f[7].toString().toUpperCase();
        saveData['PESOINIZIALE'] = f[3].toString().toUpperCase();
        saveData['PESOFINALE'] = f[4].toString().toUpperCase();
        saveData['NOTE'] = f[8].toString().toUpperCase();
//                    print(saveData);
        categorieKumiteAdd(saveData);
      }
      isFirstLine = false;
    }
    eseguiSql('UPDATE GARE SET KUMITE=\'${f.files.single.path}\' WHERE ID=1;');
  }
}
