import 'package:flutter/material.dart';
import 'package:uispkarategare/global.dart';
import 'package:uispkarategare/pages/homepage.dart';
import 'package:uispkarategare/pages/cinture.dart';
import 'package:uispkarategare/pages/categorie.dart';
import 'package:uispkarategare/pages/categorie2.dart';
import 'package:uispkarategare/pages/gare.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);
  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    var d = Drawer(
      child: Material(
        child: ListView(
          //padding: padding,
          children: [
            const SizedBox(
              height: 8,
            ),
            drawerMenuItem(
              text: 'UISP Home',
              icon: Icons.home,
              onClicked: () => selectedItem(context, 0),
            ),
            const Divider(color: Colors.white70),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<int>(
                  value: annoInUso,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
//                style: const TextStyle(color: Colors.deepPurple),
//                  underline: Container(
//                    height: 2,
//                    color: Colors.deepPurpleAccent,
//                  ),
                  onChanged: (int? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      annoInUso = value!;
//                      if (annoInUso == -1) annoInUsoStr = 'Selezionare un anno';
                      annoInUsoStr = 'Selezionare un anno';
                      if (annoInUso == 1) annoInUsoStr = '2022-2023';
                    });
                  },
                  items: const [
                    DropdownMenuItem(
                      value: -1,
                      child: Text('Seleziona un anno'),
                    ),
                    DropdownMenuItem(
                      value: 1,
                      child: Text('2022-2023'),
                    ),
                  ]),
            ),
            const Divider(color: Colors.white70),
            drawerMenuItem(
              text: 'Anni Disponibili',
              icon: Icons.calendar_month,
              onClicked: () => selectedItem(context, 1),
            ),
            const SizedBox(
              height: 8,
            ),
            drawerMenuItem(
              text: 'Categorie',
              icon: Icons.list,
              onClicked: () => selectedItem(context, 2),
            ),
            const SizedBox(
              height: 8,
            ),
            drawerMenuItem(
              text: 'Cinture',
              icon: Icons.bookmark,
              onClicked: () => selectedItem(context, 3),
            ),
            const SizedBox(
              height: 8,
            ),
            drawerMenuItem(
              text: 'Gare',
              icon: Icons.group,
              onClicked: () => selectedItem(context, 4),
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
        //color: Colors.green,
      ),
    );
    return d;
  }
}

Widget drawerMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  const color = drawerColor;
  const hoverColor = drawerHoverColor;

  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ),
    title: Text(text, style: const TextStyle(color: color)),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}

void selectedItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return const HomePage(title: 'D.O. UISP - Gestione gare');
      }));
      break;
    case 1:
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return const CategoriePage(
            title: 'D.O. UISP - Gestione gare - Anni disponibili');
      }));

      break;
    case 2:
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return Categorie2Page(
            title: 'D.O. UISP - Gestione gare - Categorie $annoInUsoStr');
      }));
      break;
    case 3:
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return const CinturePage(title: 'D.O. UISP - Gestione gare - Cinture');
      }));
      break;
    case 4:
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return const GarePage(title: 'D.O. UISP - Gestione gare');
      }));
      break;
  }
}
