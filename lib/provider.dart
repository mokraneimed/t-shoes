import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class TaskProvider extends ChangeNotifier {
  int selectedIndex = 1;
  bool firstrun = true;
  List favourites = [nike1, nike2];
  List<String> sectionsTitles = ['Popular', 'Nike', 'Adidas', 'l3abid'];
  static var nike1 = {
    'name': 'Nike1',
    'color': Colors.red,
    'url': "assets/njrebl7mer.png",
    'liked': true,
    'likes': 4,
    'price': 100,
  };
  static var nike2 = {
    'name': 'Nike2',
    'color': Colors.blue,
    'url': "assets/hh.png",
    'liked': true,
    'likes': 5,
    'price': 200
  };
  var nike3 = {
    'name': 'Nike3',
    'color': Colors.black,
    'url': "assets/nike3.jpg",
    'liked': true,
    'likes': 6
  };
  static var nike4 = {
    'name': 'Nike4',
    'color': Colors.green,
    'url': "assets/njreb.png",
    'liked': false,
    'likes': 7,
    'price': 500
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
  static List popular = [nike1, nike2];
  static List nike = [nike1, nike2, nike4];
  static List adidas = [nike1];
  List l3abid = ['wassim', 'sayf', 'idris'];
  List sections = [popular, nike, adidas];

  void changeIndex(int ndex) {
    selectedIndex = ndex;
    notifyListeners();
  }

  void like(Map shoe) {
    if (shoe['liked']) {
      shoe['likes'] = shoe['likes'] - 1;
      favourites.remove(shoe);
    } else {
      shoe['likes'] = shoe['likes'] + 1;
      favourites.add(shoe);
    }
    shoe['liked'] = !shoe['liked'];
    firstrun = false;
    notifyListeners();
  }

  void removeFavourites(int index) {
    Map shoe;
    shoe = favourites[index];
    favourites.removeAt(index);
    shoe['liked'] = false;
    shoe['likes']--;
    notifyListeners();
  }
}
