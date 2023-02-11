import 'package:flutter/material.dart';
import 'package:uispkarategare/drawer.dart';
import 'package:uispkarategare/global.dart';
import 'package:uispkarategare/sql.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getDataGara();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const BarraLaterale(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Row(
          children: [
            if (isDesktop(context))
              const Expanded(
                // flex: 1, (default)
                child: BarraLaterale(),
              ),
            Expanded(
              flex: 5,
//              child: SingleChildScrollView(
//                padding: const EdgeInsets.all(defaultPadding),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 200,
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Text('MODIFICA  GARA')),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('DATA ' + data[0]['DATA'].toString()),
                            Text('DESCRIZIONE GARA' +
                                data[0]['DESCRIZIONE'].toString()),
                            Text('CITTA GARA' + data[0]['CITTA'].toString()),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 200,
                            child: ElevatedButton(
                                onPressed: () {}, child: Text('REGOLE KATA')),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('KATA ' + data[0]['KATA'].toString()),
                            Text('KATA2 ' + data[0]['KATA2'].toString()),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 200,
                            child: ElevatedButton(
                                onPressed: () {}, child: Text('REGOLE KUMITE')),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('KUMITE ' + data[0]['KUMITE'].toString()),
                            Text('KUMITE2 ' + data[0]['KUMITE2'].toString()),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 200,
                            child: ElevatedButton(
                                onPressed: () {}, child: Text('LOGO1')),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data[0]['LOGO1'].toString()),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 200,
                            child: ElevatedButton(
                                onPressed: () {}, child: Text('LOGO2')),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data[0]['LOGO2'].toString()),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 200,
                            child: ElevatedButton(
                                onPressed: () {}, child: Text('LOGO3')),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data[0]['LOGO3'].toString()),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
//            ),
          ],
        ),
      ),

/*        
        
          */
    );
  }
}
