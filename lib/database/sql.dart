import 'package:sqlite3/sqlite3.dart' as sql;

String database = 'uispkarategare.db';
String categorie2id = '0';
String categorie2title = 'Non assegnato';

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

// FILE PER LA GESTIONE DEL DATABASE

void eseguiSql(String s) {
  sql.Database db = sql.sqlite3.open(database);
  db.execute(s);
  db.dispose();
}

// GESTIONE TABELLA GARE

getDataGare() {
  sql.Database db = sql.sqlite3.open(database);
  final sql.ResultSet resultSet = db.select('SELECT * FROM GARE');
  data.clear();
  numeroRighe = 0;
  for (var element in resultSet) {
    data.add(element);
    numeroRighe += 1;
  }
  db.dispose();
}

saveDataGare() {
  sql.Database db = sql.sqlite3.open(database);
  final stmt = db.prepare(
      'UPDATE GARE SET DATA=?,DESCRIZIONE=?,CITTA=?,NOTE=? WHERE ID=1');
  stmt.execute([
    dataEdit[0][0],
    dataEdit[0][1],
    dataEdit[0][2],
    dataEdit[0][3],
  ]);
  stmt.dispose();
  db.dispose();
}

// GESTIONE TABELLA CINTURE

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

int controllaCintura(String s) {
  int idCintura = -1;
  for (var c in dataCinture) {
    if (c['DESCRIZIONE'].toString().toUpperCase() == s.toUpperCase()) {
      idCintura = c['ID'];
    }
    if (c['NOTE'].toString().toUpperCase() == s.toUpperCase()) {
      idCintura = c['ID'];
    }
  }
  return idCintura;
}

// GESTIONE TABELLA CATEGORIEKATA

categorieKataAdd(saveData) {
  try {
    sql.Database db = sql.sqlite3.open(database);
    final stmt = db.prepare(
        'INSERT INTO CATEGORIEKATA (DESCRIZIONE,ANNO1,ANNO2,CINTURADA,CINTURAA,SESSO,NOTE) VALUES (?,?,?,?,?,?,?)');
    stmt.execute([
      saveData['DESCRIZIONE'],
      saveData['ANNO1'],
      saveData['ANNO2'],
      saveData['CINTURADA'],
      saveData['CINTURAA'],
      saveData['SESSO'],
      saveData['NOTE']
    ]);
    stmt.dispose();
    db.dispose();
  } catch (ex) {
//    print(ex);
  } finally {
//    print('finally block executed');
  }
}

getDataCategorieKata() {
  sql.Database db = sql.sqlite3.open(database);
  final sql.ResultSet resultSet = db.select(
      'SELECT C.*,C1.DESCRIZIONE AS CINTURADASTR,C2.DESCRIZIONE AS CINTURAASTR FROM CATEGORIEKATA AS C  LEFT JOIN CINTURE AS C1 ON C.CINTURADA=C1.ID LEFT JOIN CINTURE AS C2 ON C.CINTURAA=C2.ID');
  data.clear();
  numeroRighe = 0;
  for (var element in resultSet) {
    data.add(element);
    numeroRighe = numeroRighe + 1;
  }
  db.dispose();
}

// GESTIONE TABELLA CATEGORIEKUMITE

categorieKumiteAdd(saveData) {
  try {
    sql.Database db = sql.sqlite3.open(database);
    final stmt = db.prepare(
        'INSERT INTO CATEGORIEKUMITE (DESCRIZIONE,ANNO1,ANNO2,CINTURADA,CINTURAA,SESSO,PESOINIZIALE,PESOFINALE,NOTE) VALUES (?,?,?,?,?,?,?,?,?)');
    stmt.execute([
      saveData['DESCRIZIONE'],
      saveData['ANNO1'],
      saveData['ANNO2'],
      saveData['CINTURADA'],
      saveData['CINTURAA'],
      saveData['SESSO'],
      saveData['PESOINIZIALE'],
      saveData['PESOFINALE'],
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

getDataCategorieKumite() {
  sql.Database db = sql.sqlite3.open(database);
  final sql.ResultSet resultSet = db.select(
      'SELECT C.*,C1.DESCRIZIONE AS CINTURADASTR,C2.DESCRIZIONE AS CINTURAASTR FROM CATEGORIEKUMITE AS C  LEFT JOIN CINTURE AS C1 ON C.CINTURADA=C1.ID LEFT JOIN CINTURE AS C2 ON C.CINTURAA=C2.ID');
  data.clear();
  numeroRighe = 0;
  for (var element in resultSet) {
    data.add(element);
    numeroRighe = numeroRighe + 1;
  }
  db.dispose();
}

//  GESTIONE TABELLA ISCRITTI

getDataIscritti() {
  sql.Database db = sql.sqlite3.open(database);
  final sql.ResultSet resultSet = db.select('SELECT * FROM ISCRITTI');
  numeroRighe = 0;
  data.clear();
  for (var element in resultSet) {
    data.add(element);
    numeroRighe = numeroRighe + 1;
  }
  db.dispose();
}

iscrittiAdd(saveData) {
  try {
//    print('add');
    sql.Database db = sql.sqlite3.open(database);
    final stmt = db.prepare(
        'INSERT INTO ISCRITTI (CFSOCIETA,SOCIETA,SOCIETA2,COGNOME,NOME,SESSO,CINTURA,IDCINTURA,ANNO,KATA,KUMITE,PESO,CF,NRTESSERA,NOTE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)');
//    print('add2');
//    print(saveData);
    stmt.execute([
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

// GESTIONE TABELLA KATA

getDataKata() {
  sql.Database db = sql.sqlite3.open(database);
  final sql.ResultSet resultSet = db.select('SELECT * FROM KATA');
  numeroRighe = 0;
  data.clear();
  for (var element in resultSet) {
    data.add(element);
    numeroRighe = numeroRighe + 1;
  }
  db.dispose();
}

elaborazioneKata() {
  sql.Database db = sql.sqlite3.open(database);
  db.execute('DELETE FROM KATA');
  final sql.ResultSet resultSet = db.select(
      'SELECT * FROM CATEGORIEKATA ORDER BY ANNO1 DESC,CINTURADA,SESSO DESC');
  for (var element in resultSet) {
    String sqlData3 =
        'SELECT * FROM ISCRITTI WHERE KATA=1 AND ANNO<=${element['ANNO1']} AND ANNO>=${element['ANNO2']} AND IDCINTURA>=${element['CINTURADA']} AND IDCINTURA<=${element['CINTURAA']}';
    if (element['SESSO'].toString().toUpperCase() == 'M') {
      sqlData3 += ' AND SESSO=\'M\'';
    }
    if (element['SESSO'].toString().toUpperCase() == 'F') {
      sqlData3 += ' AND SESSO=\'F\'';
    }
    final sql.ResultSet resultSet2 = db.select(sqlData3);
    if (resultSet2.isNotEmpty) {
      kataAddHeader(
          '*',
          element['DESCRIZIONE'].toString(),
          '${element['ANNO1']}-${element['ANNO2']}',
          element['SESSO'].toString(),
          element['NOTE'].toString(),
          '');
    }

    for (var element2 in resultSet2) {
      kataAdd(element2);
    }
  }
  db.dispose();
}

kataAddHeader(String t, desc, anno, sesso, note, String peso) {
  Map<String, String> saveData = {};
  saveData['CFSOCIETA'] = t;
  saveData['SOCIETA'] = desc;
  saveData['SOCIETA2'] = anno;
  saveData['COGNOME'] = note;
  saveData['NOME'] = sesso;
  saveData['SESSO'] = '';
  saveData['CINTURA'] = '';
  saveData['IDCINTURA'] = '-1';
  saveData['ANNO'] = '';
  saveData['PESO'] = '0';
  saveData['CF'] = '';
  saveData['NRTESSERA'] = '';
  saveData['NOTE'] = peso;
  kataAdd(saveData);
}

kataAdd(saveData) {
  try {
    sql.Database db = sql.sqlite3.open(database);
    final stmt = db.prepare(
        'INSERT INTO KATA (CFSOCIETA,SOCIETA,SOCIETA2,COGNOME,NOME,SESSO,CINTURA,IDCINTURA,ANNO,PESO,CF,NRTESSERA,NOTE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)');
    stmt.execute([
      saveData['CFSOCIETA'].toString(),
      saveData['SOCIETA'].toString(),
      saveData['SOCIETA2'].toString(),
      saveData['COGNOME'].toString(),
      saveData['NOME'].toString(),
      saveData['SESSO'].toString(),
      saveData['CINTURA'].toString(),
      saveData['IDCINTURA'].toString(),
      saveData['ANNO'].toString(),
      saveData['PESO'].toString(),
      saveData['CF'].toString(),
      saveData['NRTESSERA'].toString(),
      saveData['NOTE'].toString()
    ]);
    stmt.dispose();
    db.dispose();
  } catch (ex) {
    print(ex);
  } finally {
//    print('finally block executed');
  }
}

salvaKata() {
  sql.Database db = sql.sqlite3.open(database);
  db.execute('DELETE FROM KATA');
  db.dispose();
  for (var element in data) {
    kataAdd(element);
  }
}

// GESTIONE TABELLA KUMITE

getDataKumite() {
  sql.Database db = sql.sqlite3.open(database);
  final sql.ResultSet resultSet = db.select('SELECT * FROM KUMITE');
  numeroRighe = 0;
  data.clear();
  for (var element in resultSet) {
    data.add(element);
    numeroRighe = numeroRighe + 1;
  }
  db.dispose();
}

elaborazioneCategorieKumite() {
//  print('Elaborazione kumite');
  sql.Database db = sql.sqlite3.open(database);
  db.execute('DELETE FROM KUMITE');
  final sql.ResultSet resultSet = db.select(
      'SELECT * FROM CATEGORIEKUMITE ORDER BY ANNO1 DESC,CINTURADA,SESSO DESC');
  for (var element in resultSet) {
//    print('${element['DESCRIZIONE']}');
    String sqlData3 =
        'SELECT * FROM ISCRITTI WHERE KUMITE=1 AND ANNO<=${element['ANNO1']} AND ANNO>=${element['ANNO2']} AND IDCINTURA>=${element['CINTURADA']} AND IDCINTURA<=${element['CINTURAA']} AND PESO>=${element['PESOINIZIALE']} AND PESO<=${element['PESOFINALE']}';
    if (element['SESSO'].toString().toUpperCase() == 'M') {
      sqlData3 += ' AND SESSO=\'M\'';
    }
    if (element['SESSO'].toString().toUpperCase() == 'F') {
      sqlData3 += ' AND SESSO=\'F\'';
    }
    final sql.ResultSet resultSet2 = db.select(sqlData3);
    if (resultSet2.isNotEmpty) {
      kumiteAddHeader(
          '*',
          element['DESCRIZIONE'].toString(),
          '${element['ANNO1']}-${element['ANNO2']}',
          element['SESSO'].toString(),
          element['NOTE'].toString(),
          ' PESO da ${element['PESOINIZIALE']} A ${element['PESOFINALE']}');
    }

    for (var element2 in resultSet2) {
      kumiteAdd(element2);
    }
  }
  db.dispose();
}

kumiteAddHeader(String t, desc, anno, sesso, note, String peso) {
//  print('---222---------');
  Map<String, String> saveData = {};
  saveData['CFSOCIETA'] = t;
  saveData['SOCIETA'] = desc;
  saveData['SOCIETA2'] = anno;
  saveData['COGNOME'] = note;
  saveData['NOME'] = sesso;
  saveData['SESSO'] = '';
  saveData['CINTURA'] = '';
  saveData['IDCINTURA'] = '-1';
  saveData['ANNO'] = '';
  saveData['PESO'] = '0';
  saveData['CF'] = '';
  saveData['NRTESSERA'] = '';
  saveData['NOTE'] = peso;
  kumiteAdd(saveData);
}

kumiteAdd(saveData) {
  try {
//    print('add');
//    print(saveData);
    sql.Database db = sql.sqlite3.open(database);
    final stmt = db.prepare(
        'INSERT INTO KUMITE (CFSOCIETA,SOCIETA,SOCIETA2,COGNOME,NOME,SESSO,CINTURA,IDCINTURA,ANNO,PESO,CF,NRTESSERA,NOTE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)');

//    print('add2');
//    print(saveData);
    stmt.execute([
      saveData['CFSOCIETA'].toString(),
      saveData['SOCIETA'].toString(),
      saveData['SOCIETA2'].toString(),
      saveData['COGNOME'].toString(),
      saveData['NOME'].toString(),
      saveData['SESSO'].toString(),
      saveData['CINTURA'].toString(),
      saveData['IDCINTURA'].toString(),
      saveData['ANNO'].toString(),
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
    print(ex);
  } finally {
//    print('finally block executed');
  }
}

salvaKumite() {
  sql.Database db = sql.sqlite3.open(database);
  db.execute('DELETE FROM KUMITE');
  db.dispose();
  for (var element in data) {
    kumiteAdd(element);
  }
}
