import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:uispkarategare/global.dart';
import 'package:uispkarategare/drawer.dart';
import 'package:uispkarategare/sql.dart';

class Gare3Page extends StatefulWidget {
  const Gare3Page({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Gare3Page> createState() => _Gare3PageState();
}

class _Gare3PageState extends State<Gare3Page> {
  @override
  void initState() {
    super.initState();
    getDataCintureList();
    getDataGare3();
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
              elaborazioneCategorie();
              setState(() {
                getDataGare3();
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
              salvaCategorie();
              setState(() {
                getDataGare3();
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
              int totaleIScrittiKata = 0;
              int totaleIScrittiKumite = 0;
              bool isKata = true;
              for (var element in data) {
                if (element['CFSOCIETA'].toString() == '*') {
                  if (element['KATA'].toString() == '1') {
                    isKata = true;
                  }
                  if (element['KUMITE'].toString() == '1') {
                    isKata = false;
                  }
                } else {
                  if (isKata) {
                    totaleIScrittiKata += 1;
                  }
                  if (!isKata) {
                    totaleIScrittiKumite += 1;
                  }
                }
              }
              showMessage(context, 'ISCRITTI',
                  'TOTALI ISCRITTI Kata=$totaleIScrittiKata Kumite=$totaleIScrittiKumite');
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
              showMessage(
                  context, 'ESPORTAZIONE FILE', 'output.csv in Downloads');
              final directory3 = await getDownloadsDirectory();
//              print(directory3!.path);
              File f = File('${directory3!.path}/output.csv');
              //f.writeAsString('contents');
              String s = '';
              for (var element in data) {
                if (element['CFSOCIETA'] == '*') {
                  s += '=================';
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
                }
//                s += element.toString();
                s += '\r';
              }
              f.writeAsString(s);
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
                String s = '---';
                if (data[index]['KATA'].toString() == '1') {
                  s = 'KATA - ';
                }
                if (data[index]['KUMITE'].toString() == '1') {
                  s = 'KUMITE - ';
                }
                s += data[index]['SOCIETA'].toString();
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
                        '${data[index]['COGNOME']} ${data[index]['NOME']} ${data[index]['SOCIETA']} (${data[index]['SOCIETA2']})'),
                    subtitle: Text(
                        '${data[index]['SESSO']} ${data[index]['CINTURA']} ${data[index]['IDCINTURA']} ${data[index]['ANNO']} Kata=${data[index]['KATA']} Kumite=${data[index]['KUMITE']} Peso=${data[index]['PESO']}'),
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
