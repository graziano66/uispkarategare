import 'package:uispkarategare/global.dart';
import 'package:sqlite3/sqlite3.dart' as sql;

String database = 'uispkarategare.db';
String categorie2id = '0';
String categorie2title = 'Non assegnato';
//String editID = '0';
//String editID2 = '0';
//late BuildContext contextActive;

//late sql.Database db;

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
        'UPDATE GARE SET IDCATEGORIA=? DATA=?,DESCRIZIONE=?,NOTE=? WHERE ID=?');
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
    print('add');
    sql.Database db = sql.sqlite3.open(database);
    final stmt = db.prepare(
        'INSERT INTO GARE2 (IDGARA,CFSOCIETA,SOCIETA,SOCIETA2,COGNOME,NOME,SESSO,CINTURA,IDCINTURA,ANNO,KATA,KUMITE,PESO,CF,NRTESSERA,NOTE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)');
    print('add2');
    print(saveData);
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
    print('add3');
    print(db.getUpdatedRows());
    stmt.dispose();
    db.dispose();
  } catch (ex) {
    print(ex);
  } finally {
    print('finally block executed');
  }
}

bool controllaSeGiaElaborato() {
  return true;
}

elaborazioneCategorie() {}
