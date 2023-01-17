import 'package:uispkarategare/global.dart';
import 'package:sqlite3/sqlite3.dart' as sql;

String database = 'uispkarategare.db';

String categorie2id = '0';
String categorie2title = 'Non assegnato';

String editID = '0';
//String editID2 = '0';
int dbError = 0;
String dbErrorString = '';
//late BuildContext contextActive;

late sql.Database db;

List data = [];
var numeroRighe = 0;

getDataCinture() async {
  sql.Database db = sql.sqlite3.open(database);
  final sql.ResultSet resultSet = db.select('SELECT * FROM CINTURE', []);
  data.clear();
  numeroRighe = 0;
  for (var element in resultSet) {
    data.add(element);
    numeroRighe = numeroRighe + 1;
  }
  db.dispose();
}

getDataCategorie() async {
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

getDataCategorie2() async {
  sql.Database db = sql.sqlite3.open(database);
  final sql.ResultSet resultSet = db.select(
      'SELECT C.*,C1.DESCRIZIONE AS CINTURADASTR,C2.DESCRIZIONE AS CINTURAASTR FROM CATEGORIE2 AS C  LEFT JOIN CINTURE AS C1 ON C.CINTURADA=C1.ID LEFT JOIN CINTURE AS C2 ON C.CINTURAA=C2.ID WHERE IDCATEGORIA=?',
      [annoInUso]);
//      db.select('SELECT * FROM CATEGORIE2');
  data.clear();
  numeroRighe = 0;
  for (var element in resultSet) {
    data.add(element);
    numeroRighe = numeroRighe + 1;
  }
  db.dispose();
}

void dbErrorClear() {
  dbError = 0;
  dbErrorString = '';
//  print('dbErrorClear()');
}

void dbErrorSet(String s) {
  dbError = 1;
  dbErrorString = s;
//  print('dbErrorSet(' + s + ')');
}



/*
  print('Using sqlite3 ${sql.sqlite3.version}');

  db.execute('''
    CREATE TABLE artists (
      id INTEGER NOT NULL PRIMARY KEY,
      name TEXT NOT NULL
    );
  ''');

  final stmt = db.prepare('INSERT INTO artists (name) VALUES (?)');
  stmt
    ..execute(['The Beatles'])
    ..execute(['Led Zeppelin'])
    ..execute(['The Who'])
    ..execute(['Nirvana']);

  stmt.dispose();

  final sql.ResultSet resultSet =
      db.select('SELECT * FROM artists WHERE name LIKE ?', ['The %']);

  resultSet.forEach((element) {
    print(element);
  });
  for (final sql.Row row in resultSet) {
    print('Artist[id: ${row['id']}, name: ${row['name']}]');
  }

  // Register a custom function we can invoke from sql:
  db.createFunction(
    functionName: 'dart_version',
    argumentCount: const sql.AllowedArgumentCount(0),
    function: (args) => Platform.version,
  );
  print(db.select('SELECT dart_version()'));

*/
