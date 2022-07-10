import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';
import 'package:t_shoes/body.dart';
import 'package:t_shoes/searchpage.dart';

final GlobalKey<FormState> _inputKey = GlobalKey();
final GlobalKey<ScaffoldState> _key = GlobalKey();
final textController = TextEditingController();

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border(right: BorderSide(color: Colors.white))),
              child: Container(
                margin: EdgeInsets.only(top: 30),
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Profile',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'font',
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.favorite_outlined,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Favourites',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'font',
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.storefront_outlined,
                        color: Colors.white,
                      ),
                      title: Text(
                        'My items',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'font',
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.settings_outlined,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Settings',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'font',
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ],
                ),
              ))),
      backgroundColor: Colors.black,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: Colors.black,
          toolbarHeight: 90,
          centerTitle: true,
          title: Container(
              width: MediaQuery.of(context).size.width * 0.90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus &&
                            currentFocus.focusedChild != null) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          textController.clear();
                        }

                        _key.currentState!.openDrawer();
                      },
                      child: Icon(
                        Icons.more_vert,
                        size: 28,
                      )),
                  Row(
                    children: const [
                      Text(
                        'T',
                        style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 28,
                            fontFamily: 'font',
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        '-shoes',
                        style: TextStyle(
                            fontSize: 28,
                            fontFamily: 'font',
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.shopping_cart,
                    size: 28,
                  ),
                ],
              ))),
      body: Body(),
    );
  }
}
