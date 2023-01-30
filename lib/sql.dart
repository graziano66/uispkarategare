import 'package:sqlite3/sqlite3.dart' as sql;

String database = 'uispkarategare.db';
String categorie2id = '0';
String categorie2title = 'Non assegnato';

int annoInUso = 0;
String annoInUsoStr = 'SCEGLI REGOLAMENTO';

List data = [];
int numeroRighe = 0;
List dataEdit = [];
int numeroRigheEdit = 0;

List dataCinture = [];
int numeroRigheCinture = 0;

List dataCategorie = [];
int numeroRigheCategorie = 0;

int idGaraSelezionata = 0;

getDataCinture() {
  sql.Database db = sql.sqlite3.open(database);
  final sql.ResultSet resultSet = db.select('SELECT * FROM CINTURE', []);
  data.clear();
  numeroRighe = 0;
  for (var element in resultSet) {
    data.add(element);
    numeroRighe += 1;
  }
  db.dispose();
}

getDataCintureList() {
  sql.Database db = sql.sqlite3.open(database);
  final sql.ResultSet resultSet = db.select('SELECT * FROM CINTURE', []);
  dataCinture.clear();
  numeroRigheCinture = 0;
  for (var element in resultSet) {
    dataCinture.add(element);
    numeroRigheCinture += 1;
  }
  db.dispose();
}

getDataCategorie() {
  sql.Database db = sql.sqlite3.open(database);
  final sql.ResultSet resultSet = db.select('SELECT * FROM CATEGORIE', []);
  data.clear();
  numeroRighe = 0;
  for (var element in resultSet) {
    data.add(element);
    numeroRighe = numeroRighe + 1;
  }
  db.dispose();
}

getDataCategorieList() {
  sql.Database db = sql.sqlite3.open(database);
  final sql.ResultSet resultSet = db.select('SELECT * FROM CATEGORIE', []);
  dataCategorie.clear();
  numeroRigheCategorie = 0;
  for (var element in resultSet) {
    dataCategorie.add(element);
    numeroRigheCategorie += 1;
  }
  db.dispose();
}

getDataCategorie2() {
  sql.Database db = sql.sqlite3.open(database);
  final sql.ResultSet resultSet = db.select(
      'SELECT C.*,C1.DESCRIZIONE AS CINTURADASTR,C2.DESCRIZIONE AS CINTURAASTR FROM CATEGORIE2 AS C  LEFT JOIN CINTURE AS C1 ON C.CINTURADA=C1.ID LEFT JOIN CINTURE AS C2 ON C.CINTURAA=C2.ID WHERE IDCATEGORIA=?',
      [annoInUso]);
  data.clear();
  numeroRighe = 0;
  for (var element in resultSet) {
    data.add(element);
    numeroRighe = numeroRighe + 1;
  }
  db.dispose();
}

getDataGare() {
  sql.Database db = sql.sqlite3.open(database);
  final sql.ResultSet resultSet =
      db.select('SELECT * FROM GARE WHERE IDCATEGORIA=$annoInUso');
  data.clear();
  numeroRighe = 0;
  for (var element in resultSet) {
    data.add(element);
//    print(element);
    numeroRighe = numeroRighe + 1;
  }
  db.dispose();
}

getDataGareId(int id) {
  sql.Database db = sql.sqlite3.open(database);
  final sql.ResultSet resultSet =
      db.select('SELECT * FROM GARE WHERE ID=?', [id]);
  dataEdit.clear();
  numeroRigheEdit = 0;
  for (var element in resultSet) {
    dataEdit.add(element);
    numeroRigheEdit = numeroRigheEdit + 1;
  }
  db.dispose();
}

saveDataGare() {
  sql.Database db = sql.sqlite3.open(database);
  if (dataEdit[0][0] != -1) {
    final stmt = db.prepare(
        'UPDATE GARE SET IDCATEGORIA=?,DATA=?,DESCRIZIONE=?,NOTE=? WHERE ID=?');
    stmt.execute([
      dataEdit[0][1],
      dataEdit[0][2],
      dataEdit[0][3],
      dataEdit[0][4],
      dataEdit[0][0]
    ]);
    stmt.dispose();
  } else {
    final stmt = db.prepare(
        'INSERT INTO GARE (IDCATEGORIA,DATA,DESCRIZIONE,NOTE) VALUES (?,?,?,?)');
    stmt.execute(
        [dataEdit[0][1], dataEdit[0][2], dataEdit[0][3], dataEdit[0][4]]);
    stmt.dispose();
  }
  db.dispose();
}

getDataGare2() {
  sql.Database db = sql.sqlite3.open(database);
  final sql.ResultSet resultSet =
      db.select('SELECT * FROM GARE2 WHERE IDGARA=$idGaraSelezionata');
  numeroRighe = 0;
  data.clear();
  for (var element in resultSet) {
    data.add(element);
    numeroRighe = numeroRighe + 1;
  }
  db.dispose();
}

gare2add(saveData) {
  try {
//    print('add');
    sql.Database db = sql.sqlite3.open(database);
    final stmt = db.prepare(
        'INSERT INTO GARE2 (IDGARA,CFSOCIETA,SOCIETA,SOCIETA2,COGNOME,NOME,SESSO,CINTURA,IDCINTURA,ANNO,KATA,KUMITE,PESO,CF,NRTESSERA,NOTE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)');
//    print('add2');
//    print(saveData);
    stmt.execute([
      saveData['IDGARA'],
      saveData['CFSOCIETA'],
      saveData['SOCIETA'],
      saveData['SOCIETA2'],
      saveData['COGNOME'],
      saveData['NOME'],
      saveData['SESSO'],
      saveData['CINTURA'],
      saveData['IDCINTURA'],
      saveData['ANNO'],
      saveData['KATA'],
      saveData['KUMITE'],
      saveData['PESO'] + '.0',
      saveData['CF'],
      saveData['NRTESSERA'],
      saveData['NOTE']
    ]);
//    print('add3');
//    print(db.getUpdatedRows());
    stmt.dispose();
    db.dispose();
  } catch (ex) {
//    print(ex);
  } finally {
//    print('finally block executed');
  }
}

elaborazioneCategorie() {
  cancellaGare3id();
  elaborazioneCategorieKata();
  elaborazioneCategorieKumite();
}

cancellaGare3id() {
  sql.Database db = sql.sqlite3.open(database);
  db.execute('DELETE FROM GARE3 WHERE IDGARA=$idGaraSelezionata');
  db.dispose();
}

elaborazioneCategorieKata() {
  sql.Database db = sql.sqlite3.open(database);
  final sql.ResultSet resultSet = db.select(
      'SELECT * FROM CATEGORIE2 WHERE IDCATEGORIA=$annoInUso AND KATA=1 ORDER BY ANNO1 DESC,CINTURADA,SESSO DESC');
  for (var element in resultSet) {
    String sqlData3 =
        'SELECT * FROM GARE2 WHERE IDGARA=$idGaraSelezionata AND KATA=1 AND ANNO<=${element['ANNO1']} AND ANNO>=${element['ANNO2']} AND IDCINTURA>=${element['CINTURADA']} AND IDCINTURA<=${element['CINTURAA']}';
    if (element['SESSO'].toString().toUpperCase() == 'M') {
      sqlData3 += ' AND SESSO=\'M\'';
    }
    if (element['SESSO'].toString().toUpperCase() == 'F') {
      sqlData3 += ' AND SESSO=\'F\'';
    }
//    print(sqlData3);
    final sql.ResultSet resultSet2 = db.select(sqlData3);
    if (resultSet2.isNotEmpty) {
      gare3addHeader(
          '*',
          element['DESCRIZIONE'].toString(),
          '${element['ANNO1']}-${element['ANNO2']}',
          element['SESSO'].toString(),
          element['NOTE'].toString(),
          1,
          0,
          '');
    }

    for (var element2 in resultSet2) {
      gare3add(element2);
    }
  }
  db.dispose();
}

elaborazioneCategorieKumite() {
//  print('idgara=$idGaraSelezionata regole=$annoInUso');
  sql.Database db = sql.sqlite3.open(database);
  final sql.ResultSet resultSet = db.select(
      'SELECT * FROM CATEGORIE2 WHERE IDCATEGORIA=$annoInUso AND KUMITE=1 ORDER BY ANNO1 DESC,CINTURADA,SESSO DESC');
  for (var element in resultSet) {
    String sqlData3 =
        'SELECT * FROM GARE2 WHERE IDGARA=$idGaraSelezionata AND KUMITE=1 AND ANNO<=${element['ANNO1']} AND ANNO>=${element['ANNO2']} AND IDCINTURA>=${element['CINTURADA']} AND IDCINTURA<=${element['CINTURAA']} AND PESO>=${element['PESOINIZIALE']} AND PESO<=${element['PESOFINALE']}';
    if (element['SESSO'].toString().toUpperCase() == 'M') {
      sqlData3 += ' AND SESSO=\'M\'';
    }
    if (element['SESSO'].toString().toUpperCase() == 'F') {
      sqlData3 += ' AND SESSO=\'F\'';
    }
//    print(sqlData3);
    final sql.ResultSet resultSet2 = db.select(sqlData3);
    if (resultSet2.isNotEmpty) {
      gare3addHeader(
          '*',
          element['DESCRIZIONE'].toString(),
          '${element['ANNO1']}-${element['ANNO2']}',
          element['SESSO'].toString(),
          element['NOTE'].toString(),
          0,
          1,
          ' PESO da ${element['PESOINIZIALE']} A ${element['PESOFINALE']}');
    }

    for (var element2 in resultSet2) {
      gare3add(element2);
    }
  }
  db.dispose();
}

gare3addHeader(
    String t, desc, anno, sesso, note, int kata, int kumite, String peso) {
//  print('---222---------');
  Map<String, String> saveData = {};
  saveData['IDGARA'] = idGaraSelezionata.toString();
  saveData['CFSOCIETA'] = t;
  saveData['SOCIETA'] = desc;
  saveData['SOCIETA2'] = anno;
  saveData['COGNOME'] = note;
  saveData['NOME'] = sesso;
  saveData['SESSO'] = '';
  saveData['CINTURA'] = '';
  saveData['IDCINTURA'] = '-1';
  saveData['ANNO'] = '';
  saveData['KATA'] = kata.toString();
  saveData['KUMITE'] = kumite.toString();
  saveData['PESO'] = '0';
  saveData['CF'] = '';
  saveData['NRTESSERA'] = '';
  saveData['NOTE'] = peso;
  gare3add(saveData);
}

gare3add(saveData) {
  try {
//    print('add');
    sql.Database db = sql.sqlite3.open(database);
    final stmt = db.prepare(
        'INSERT INTO GARE3 (IDGARA,CFSOCIETA,SOCIETA,SOCIETA2,COGNOME,NOME,SESSO,CINTURA,IDCINTURA,ANNO,KATA,KUMITE,PESO,CF,NRTESSERA,NOTE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)');
//    print('add2');
//    print(saveData);
    stmt.execute([
      saveData['IDGARA'].toString(),
      saveData['CFSOCIETA'].toString(),
      saveData['SOCIETA'].toString(),
      saveData['SOCIETA2'].toString(),
      saveData['COGNOME'].toString(),
      saveData['NOME'].toString(),
      saveData['SESSO'].toString(),
      saveData['CINTURA'].toString(),
      saveData['IDCINTURA'].toString(),
      saveData['ANNO'].toString(),
      saveData['KATA'].toString(),
      saveData['KUMITE'].toString(),
      saveData['PESO'].toString(),
      saveData['CF'].toString(),
      saveData['NRTESSERA'].toString(),
      saveData['NOTE'].toString()
    ]);
//    print('add3');
//    print(db.getUpdatedRows());
    stmt.dispose();
    db.dispose();
  } catch (ex) {
//    print(ex);
  } finally {
//    print('finally block executed');
  }
}

salvaCategorie() {
  sql.Database db = sql.sqlite3.open(database);
  db.execute('DELETE FROM GARE3 WHERE IDGARA=$idGaraSelezionata');
  db.dispose();
  for (var element in data) {
    gare3add(element);
  }
}

getDataGare3() {
  sql.Database db = sql.sqlite3.open(database);
  final sql.ResultSet resultSet =
      db.select('SELECT * FROM GARE3 WHERE IDGARA=$idGaraSelezionata');
  numeroRighe = 0;
  data.clear();
  for (var element in resultSet) {
    data.add(element);
    numeroRighe = numeroRighe + 1;
  }
  db.dispose();
}
