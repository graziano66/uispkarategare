import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:uispkarategare/global.dart';
import 'package:uispkarategare/drawer.dart';
import 'package:uispkarategare/database/sql.dart';
import 'package:uispkarategare/print/prkatatabelloni.dart';
import 'package:uispkarategare/print/prkatataelenchi.dart';

class KataPage extends StatefulWidget {
  const KataPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<KataPage> createState() => _KataPageState();
}

class _KataPageState extends State<KataPage> {
  @override
  void initState() {
    super.initState();
    getDataCintureList();
    getDataKata();
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
              elaborazioneKata();
              setState(() {
                getDataKata();
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
              salvaKata();
              setState(() {
                getDataKata();
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
              for (var element in data) {
                if (element['CFSOCIETA'].toString() != '*') {
                  totaleIScrittiKata += 1;
                }
              }
              showMessage(context, 'ISCRITTI',
                  'TOTALI ISCRITTI Kata=$totaleIScrittiKata');
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
//              File f = File('${directory3!.path}/output.csv');
              File f = File('kata-elenco.csv');
              //f.writeAsString('contents');
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
              PrKataTabelloni stampa1 = PrKataTabelloni();
              stampa1.stampa();
              PrKataElenchi stampa2 = PrKataElenchi();
              stampa2.stampa();
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
              itemBuilder: (context, index) {
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
                        '${data[index]['ANNO']} - ${data[index]['SESSO']} - ${data[index]['CINTURA']} - ${data[index]['IDCINTURA']} '),
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
