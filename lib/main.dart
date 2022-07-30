import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:t_shoes/homepage.dart';
import 'package:t_shoes/searchpage.dart';
import 'package:t_shoes/provider.dart';
import 'package:t_shoes/favourites_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:t_shoes/data_firebase.dart';

final GlobalKey<FormState> _inputKey = GlobalKey();
final GlobalKey<ScaffoldState> _key = GlobalKey();
final textController = TextEditingController();
List<Widget> _pages = <Widget>[
  FavouritesPage(),
  HomePage(),
  SearchPage(),
  tryFirebase(),
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
            textController.clear();
          }
        },
        child: ChangeNotifierProvider(
            create: (context) => TaskProvider(),
            child: MaterialApp(
              home: Consumer<TaskProvider>(
                  builder: (context, taskProvider, child) {
                final selectedIndex = taskProvider.selectedIndex;
                return Scaffold(
                  bottomNavigationBar: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.black,
                    selectedItemColor: Colors.yellow,
                    unselectedItemColor: Colors.white,
                    showUnselectedLabels: false,
                    currentIndex: selectedIndex, //New
                    onTap: taskProvider.changeIndex,
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.favorite),
                        label: '.',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: '.',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.search),
                        label: '.',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.fire_hydrant),
                        label: '.',
                      ),
                    ],
                  ),
                  body: _pages.elementAt(selectedIndex),
                );
              }),
            )));
  }
}
