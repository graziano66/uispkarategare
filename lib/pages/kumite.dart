import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:uispkarategare/global.dart';
import 'package:uispkarategare/drawer.dart';
import 'package:uispkarategare/database/sql.dart';
import 'package:uispkarategare/print/prkumiteelenchi.dart';
//import 'package:uispkarategare/print/kataOld.dart';

class KumitePage extends StatefulWidget {
  const KumitePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<KumitePage> createState() => _KumitePageState();
}

class _KumitePageState extends State<KumitePage> {
  @override
  void initState() {
    super.initState();
    getDataCintureList();
    getDataKumite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const BarraLaterale(),
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          ElevatedButton.icon(
            onPressed: () {
              elaborazioneCategorieKumite();
              setState(() {
                getDataKumite();
              });
            },
            icon: const Icon(
              Icons.format_list_numbered,
              size: 24.0,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              //foregroundColor: Colors.black,
              elevation: 0,
            ),
            label: const Text('ELABORAZIONE CATEGORIE'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              salvaKumite();
              setState(() {
                getDataKumite();
              });
            },
            icon: const Icon(
              Icons.save,
              size: 24.0,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              //foregroundColor: Colors.black,
              elevation: 0,
            ),
            label: const Text('SALVA LE MODIFICHE'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              int totaleIScrittiKumite = 0;
              for (var element in data) {
                if (element['CFSOCIETA'].toString() != '*') {
                  totaleIScrittiKumite += 1;
                }
              }
              showMessage(context, 'ISCRITTI',
                  'TOTALI ISCRITTI Kumite=$totaleIScrittiKumite');
            },
            icon: const Icon(
              Icons.calculate,
              size: 24.0,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              //foregroundColor: Colors.black,
              elevation: 0,
            ),
            label: const Text('NUM.ISCRITTI'),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              final directory3 = await getDownloadsDirectory();
//              print(directory3!.path);
              File f = File('${directory3!.path}/output.csv');
              //f.writeAsString('contents');
              print('INIZIO STAMPE');
              String s = '';
              int categorieConteggio = 1;
              for (var element in data) {
                if (element['CFSOCIETA'] == '*') {
                  s += '===Categoria N. $categorieConteggio ==============';
                  categorieConteggio += 1;
                  s += '\r';
                  s += element['SOCIETA'];
                  s += ',';
                  s += element['SOCIETA2'];
                  s += ',';
                  s += element['COGNOME'];
                  s += ',';
                  s += element['NOME'];
                  if (element['KUMITE'] == '1') {
                    s += ',';
                    s += element['NOTE'];
                  }
                } else {
                  s += element['SOCIETA'];
                  s += ',';
                  s += element['SOCIETA2'];
                  s += ',';
                  s += element['COGNOME'];
                  s += ',';
                  s += element['NOME'];
                  s += ',';
                  s += element['SESSO'];
                  s += ',';
                  s += element['ANNO'].toString();
                  s += ',';
                  s += element['CINTURA'];
                  s += ', KG ';
                  s += element['PESO'].toString();
                }
//                s += element.toString();
                s += '\r';
              }
              f.writeAsString(s);
//              print('ok');
              print('INIZIO STAMPE QUADRI');

              PrKumiteElenchi stampa = PrKumiteElenchi();
              stampa.stampa();

              print('INIZIO STAMPE ELENCHI');

/*

              createElencoPdfStart();
              print('INIZIO STAMPE ELENCHI 2');
              pdfDataList.clear();
              inPage = false;
              for (var element in data) {
                if (element['CFSOCIETA'] == '*') {
                  if (inPage) {
//                    print('create page');
                    createElencoPdfAddPage(pdfDataList);
                    pdfDataList.clear();
                  }
//                  print('ok1');
                  inPage = true;
//                  print('ok2');
                  pdfGara = element['SOCIETA'].toString();
//                  print(pdfGara);
                  pdfData = element['SOCIETA2'].toString();
//                  print(pdfData);
                  pdfCitta = element['COGNOME'].toString();
//                  print(pdfCitta);
                  pdfCategoria = element['NOME'].toString();
//                  print(pdfCategoria);
                  if (element['KATA'] == 1) {
                    pdfTipo = 'KATA';
                  } else {
                    pdfTipo = 'KUMITE';
                  }
                } else {
//                  print('ok7');
                  pdfDataList.add(element);
//                  print('ok8');
                }
                s += '\r';
//              print('ok9');
              }
              print('INIZIO STAMPE ELENCHI fine');
              createElencoPdfAddPage(pdfDataList);
//              print('ok0');
              print('INIZIO STAMPE ELENCHI fine 2');
              createElencoPdfEnd();
              print('INIZIO STAMPE ELENCHI fine 3');
              showMessage(
                  context, 'ESPORTAZIONE FILE', 'output.csv in Downloads');
*/
            },
            icon: const Icon(
              Icons.print,
              size: 24.0,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              //foregroundColor: Colors.black,
              elevation: 0,
            ),
            label: const Text('Stampa'),
          ),
        ],
      ),
      body: SafeArea(
          child: Row(children: [
        if (isDesktop(context))
          const Expanded(
            // flex: 1, (default)
            child: BarraLaterale(),
          ),
        Expanded(
            flex: 5,
            child: ReorderableListView.builder(
              itemCount: data.length,
//              itemCount: numeroRighe,
              itemBuilder: (context, index) {
//          final item = data[index];
//                print(data[index]);
                String s = data[index]['SOCIETA'].toString();
                if (data[index]['CFSOCIETA'].toString() == '*') {
                  return ListTile(
                    key: ValueKey(data[index]['ID'].toString()),
                    tileColor: Colors.green,
                    title: Text(s),
                    subtitle: Text(
                        '${data[index]['SOCIETA2']} - ${data[index]['COGNOME']} - ${data[index]['NOME']} - ${data[index]['NOTE']}'),
//                    trailing: Icon(Icons.home),

                    leading: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        print('edit');
                      },
                    ),
                    //isThreeLine: true,
//                    onTap: () {
//                      print("On Tap is fired");
//                    },
                  );
                } else {
                  return ListTile(
                    key: ValueKey(data[index]['ID'].toString()),
                    title: Text(
                        '${data[index]['COGNOME']} ${data[index]['NOME']} - ${data[index]['SOCIETA']} (${data[index]['SOCIETA2']})'),
                    subtitle: Text(
                        '${data[index]['ANNO']} - ${data[index]['SESSO']} - Peso=${data[index]['PESO']} - ${data[index]['CINTURA']} - ${data[index]['IDCINTURA']} '),
                  );
                }
              },
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  var item = data.removeAt(oldIndex);
                  data.insert(newIndex, item);
                });
              },
            ))
      ])),
    );
  }
}
