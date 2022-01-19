
import 'package:flutter/foundation.dart';

class AccountProvider extends ChangeNotifier {
  Map account = Map();

  AccountProvider({required this.account});

  void selectMainAccount(Map map) {
    account = map;
    notifyListeners();
  }
}