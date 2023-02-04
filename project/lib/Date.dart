import 'package:shared_preferences/shared_preferences.dart';

class Date {
  int day = 0;

  Date._privateConstructor();
  static final Date _instance = Date._internal();

  factory Date() {
    return _instance;
  }
  Date._internal() {
    updateData();
  }

  void updateData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _instance.day = preferences.getInt('resetDay') ?? 0;
  }
}
