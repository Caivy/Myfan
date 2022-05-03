import 'package:myfan/services/app.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Noti extends App {
  int noti_count = 0;
  String notiPfp = "";
  String notiDisplayname = "";
  String notiDate = "";
  String notiPost = "";

  int get noticount => noti_count;
  String get notipfp => notiPfp;
  String get notidisplayname => notiDisplayname;
  String get notidate => notiDate;
  String get notipost => notiPost;

  Noticount(int value) {
    noti_count = value;
    notifyListeners();
  }

  Notipfp(String v) {
    notiPfp = v;
    notifyListeners();
  }

  Notidisplayname(String v) {
    notiDisplayname = v;
    notifyListeners();
  }

  Notidate(String v) {
    notiDate = v;
    notifyListeners();
  }

  Notipost(String v) {
    notiPost = v;
    notifyListeners();
  }
}
