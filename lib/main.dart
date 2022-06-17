import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    return Scaffold(
      key: _key,
      drawer: Drawer(
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border(right: BorderSide(color: Colors.white))),
              child: Container(
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Profile',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.favorite_outlined,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Favourites',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.storefront_outlined,
                        color: Colors.white,
                      ),
                      title: Text(
                        'My items',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.settings_outlined,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Settings',
                        style: TextStyle(color: Colors.white, fontSize: 20),
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
                        style: TextStyle(color: Colors.yellow, fontSize: 28),
                      ),
                      Text(
                        '-shoes',
                        style: TextStyle(fontSize: 28),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.shopping_basket_outlined,
                    size: 28,
                  ),
                ],
              ))),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  final textController = TextEditingController();
  List<String> sectionsTitles = ['popular', 'nike', 'adidas', 'l3abid'];
  var nike1 = {'name': 'nike1', 'color': Colors.red, 'url': "assets/nike1.jpg"};
  var nike2 = {
    'name': 'nike2',
    'color': Colors.blue,
    'url': "assets/nike2.jpg"
  };
  var nike3 = {
    'name': 'nike3',
    'color': Colors.black,
    'url': "assets/nike3.jpg"
  };
  var nike4 = {
    'name': 'nike4',
    'color': Colors.green,
    'url': "assets/nike4.jpg"
  };
  var adidas1 = {
    'name': 'adidas1',
    'color': Colors.white,
    'url': 'assets/adidas1'
  };
  var adidas2 = {
    'name': 'adidas2',
    'color': Colors.orange,
    'url': 'assets/adidas2'
  };
  var adidas3 = {
    'name': 'adidas3',
    'color': Colors.cyan,
    'url': 'assets/adidas3'
  };

  @override
  Widget build(BuildContext context) {
    List popular = [nike1, nike2];
    List nike = [nike1, nike2, nike4];
    List adidas = [nike1];
    List l3abid = ['wassim', 'sayf', 'idris'];
    List sections = [popular, nike, adidas];
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.025),
          width: MediaQuery.of(context).size.width * 0.95,
          decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: Colors.white38),
              borderRadius: BorderRadius.circular(80)),
          child: TextField(
              controller: textController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(22, 12, 0, 12),
                isDense: true,
                hintText: "Search...",
                hintStyle: TextStyle(
                  color: Colors.white38,
                  fontStyle: FontStyle.italic,
                ),
              )),
        ),
        const SizedBox(
          height: 60,
        ),
        Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: sections.length,
                itemBuilder: (context, index) {
                  List section = sections[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05),
                          child: Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              sectionsTitles[index],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          )),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                          height: 300,
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: section.length,
                              itemBuilder: (context, index2) {
                                return Row(children: [
                                  Shoe(shoe: section[index2]),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                  )
                                ]);
                              }))
                    ],
                  );
                })),
      ],
    );
  }
}

class Shoe extends StatelessWidget {
  Map shoe;
  Shoe({required this.shoe});
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.44,
        child: Column(
          children: [
            Image.asset(
              shoe['url'],
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '5',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 22,
                        )
                      ],
                    ),
                  ),
                  Icon(
                    Icons.plus_one_sharp,
                    color: Colors.white,
                    size: 31,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              shoe['name'],
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ],
        ));
  }
}
