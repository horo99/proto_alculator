import 'package:flutter/material.dart';

class ResultModel extends ChangeNotifier {
  double _result = 123;
  double _show = 123;

  get result => _result;

  void mul(double num){
    _show += num;
    notifyListeners();
  }

  void div(double num){
    _show /= num;
    notifyListeners();
  }

  void sub(double num){
    _show -= num;
    notifyListeners();
  }

  void add(double num){
    _show += num;
    notifyListeners();
  }
}
