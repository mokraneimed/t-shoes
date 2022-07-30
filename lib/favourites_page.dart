import 'package:flutter/material.dart';
import 'package:t_shoes/provider.dart';
import 'package:provider/provider.dart';

class FavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(builder: (context, taskProvider, child) {
      List favourites;
      favourites = taskProvider.favourites;
      Map shoe;
      return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
              backgroundColor: Colors.black,
              toolbarHeight: 90,
              title: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    'Favourites',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'font',
                        fontWeight: FontWeight.w800,
                        fontSize: 28),
                  ))),
          body: Container(
              margin: EdgeInsets.fromLTRB(20, 0, 40, 0),
              child: Column(children: [
                SizedBox(
                  height: 30,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: favourites.length,
                        itemBuilder: (context, index) {
                          shoe = favourites[index];
                          return Dismissible(
                              key: UniqueKey(),
                              onDismissed: (direction) {
                                taskProvider.removeFavourites(index);
                              },
                              child: Column(children: [
                                Container(
                                    height: 80,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.white38),
                                        borderRadius:
                                            BorderRadius.circular(35)),
                                    child: Center(
                                        child: ListTile(
                                            leading: Image.asset(shoe['url'],
                                                width: 80, height: 80),
                                            title: Container(
                                                padding:
                                                    EdgeInsets.only(left: 20),
                                                child: Row(children: [
                                                  Text(shoe['name'],
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                  SizedBox(
                                                    width: 80,
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        taskProvider
                                                            .removeFavourites(
                                                                index);
                                                      },
                                                      icon: Icon(
                                                        Icons.cancel,
                                                        color: Colors.white,
                                                      ))
                                                ]))))),
                                SizedBox(
                                  height: 30,
                                )
                              ]));
                        }))
              ])));
    });
  }
}
