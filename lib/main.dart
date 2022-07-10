import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:t_shoes/homepage.dart';
import 'package:t_shoes/searchpage.dart';
import 'package:t_shoes/provider.dart';

final GlobalKey<FormState> _inputKey = GlobalKey();
final GlobalKey<ScaffoldState> _key = GlobalKey();
final textController = TextEditingController();
List<Widget> _pages = <Widget>[
  Icon(
    Icons.call,
    size: 150,
  ),
  HomePage(),
  SearchPage(),
];

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
                    ],
                  ),
                  body: _pages.elementAt(selectedIndex),
                );
              }),
            )));
  }
}
