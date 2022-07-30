import 'package:flutter/material.dart';
import 'package:t_shoes/provider.dart';
import 'package:provider/provider.dart';
import 'package:t_shoes/shoe.dart';

late List shoes;
List founded = [];
List ForBuild = [];
late Map shoe;
late Map founded_shoe;
bool similar(String str1, String str2) {
  bool similar = true;
  int i = 1;
  int legnth = str1.length;
  while (similar && i <= legnth) {
    if (str1[i] != str2[i]) similar = false;
    i++;
  }
  return similar;
}

void clear() {
  founded.clear();
}

class SearchRouter extends StatelessWidget {
  String name, color;
  int min_price, max_price, min_rat, max_rat;
  SearchRouter(
      {required this.name,
      required this.color,
      required this.min_price,
      required this.max_price,
      required this.min_rat,
      required this.max_rat});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(builder: (context, taskProvider, child) {
      shoes = TaskProvider.nike;
      for (shoe in shoes) {
        if (similar(name, shoe['name']) &&
            shoe['likes'] <= max_rat &&
            shoe['likes'] >= min_rat &&
            shoe['price'] <= max_price &&
            shoe['price'] >= min_price) {
          founded.add(shoe);
        }
      }
      ForBuild = founded;
      founded = [];

      return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white,
              size: 48, //change your color here
            ),
            toolbarHeight: 90,
            backgroundColor: Colors.black,
          ),
          body: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200, mainAxisExtent: 250),
              itemCount: ForBuild.length,
              itemBuilder: (context, index) {
                founded_shoe = ForBuild[index];
                return Shoe(
                  shoe: founded_shoe,
                  sectionTitle: 'found',
                );
              }));
    });
  }
}
