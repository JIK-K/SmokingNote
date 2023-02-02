import 'package:shared_preferences/shared_preferences.dart';

class Clock {
  int timerYear = 0;
  int timerDays = 0;
  int timerHour = 0;
  int timerMins = 0;
  int timerSecs = 0;

  Clock._privateConstructor();
  static final Clock _instance = Clock._internal();

  factory Clock() {
    return _instance;
  }
  Clock._internal() {
    updateData();
  }

  void updateData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _instance.timerYear = preferences.getInt('year') ?? 0;
    _instance.timerDays = preferences.getInt('days') ?? 0;
    _instance.timerHour = preferences.getInt('hour') ?? 0;
    _instance.timerMins = preferences.getInt('mins') ?? 0;
    _instance.timerSecs = preferences.getInt('secs') ?? 0;
  }

  void resetTimer() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    _instance.timerSecs = 0;
    _instance.timerMins = 0;
    _instance.timerHour = 0;
    _instance.timerDays = 0;
    _instance.timerYear = 0;

    preferences.setInt('secs', _instance.timerSecs);
    preferences.setInt('mins', _instance.timerMins);
    preferences.setInt('hour', _instance.timerHour);
    preferences.setInt('days', _instance.timerDays);
    preferences.setInt('year', _instance.timerYear);
  }

  void checkTimer() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (_instance.timerSecs > 60) {
      _instance.timerSecs = 0;
      _instance.timerMins++;
      preferences.setInt('secs', _instance.timerSecs);
      preferences.setInt('mins', _instance.timerMins);
    }
    if (_instance.timerMins > 60) {
      _instance.timerMins = 0;
      _instance.timerHour++;
      preferences.setInt('mins', _instance.timerMins);
      preferences.setInt('hour', _instance.timerHour);
    }
    if (_instance.timerHour > 24) {
      _instance.timerHour = 0;
      _instance.timerDays++;
      preferences.setInt('hour', _instance.timerHour);
      preferences.setInt('days', _instance.timerDays);
    }
    if (_instance.timerDays > 365) {
      _instance.timerDays = 0;
      _instance.timerYear++;
      preferences.setInt('days', _instance.timerDays);
      preferences.setInt('year', _instance.timerYear);
    }
  }
}
