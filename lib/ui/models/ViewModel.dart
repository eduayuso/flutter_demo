import 'package:flutter/widgets.dart';
import 'package:flutter_rest_demo/config/constants.dart';

class ViewModel extends ChangeNotifier {

  ViewStatus status = ViewStatus.Idle;

  void setStatus(ViewStatus status) {

    this.status = status;
    this.notifyListeners();
  }
}