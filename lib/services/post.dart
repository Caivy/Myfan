import 'package:myfan/services/app.dart';
import 'package:flutter/material.dart';

class Post extends App {
  int _heart = 0;
  int _comment = 0;
  int _share = 0;
  int _postIndex = 0;

  int get heart => _heart;
  int get comment => _comment;
  int get share => _share;
  int get postIndex => _postIndex;

  PostIndex(int value) {
    _postIndex = _postIndex + value;
    notifyListeners();
  }

  Heart(int value) {
    _heart = value;
    notifyListeners();
  }

  Comment(int value) {
    _comment = value;
    notifyListeners();
  }

  Share(int value) {
    _share = value;
    notifyListeners();
  }
}
