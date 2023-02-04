import 'package:shared_preferences/shared_preferences.dart';

class Clock {
  int timerYear = 0;
  int timerDays = 0;
  int timerHour = 0;
  int timerMins = 0;
  int timerSecs = 0;

  var message = "혈압과 맥박이 정상으로 돌아옵니다";

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
    if (_instance.timerSecs > 59) {
      _instance.timerSecs = 0;
      _instance.timerMins++;
      preferences.setInt('secs', _instance.timerSecs);
      preferences.setInt('mins', _instance.timerMins);
    }
    if (_instance.timerMins > 59) {
      _instance.timerMins = 0;
      _instance.timerHour++;
      preferences.setInt('mins', _instance.timerMins);
      preferences.setInt('hour', _instance.timerHour);
    }
    if (_instance.timerHour > 23) {
      _instance.timerHour = 0;
      _instance.timerDays++;
      preferences.setInt('hour', _instance.timerHour);
      preferences.setInt('days', _instance.timerDays);
    }
    if (_instance.timerDays > 364) {
      _instance.timerDays = 0;
      _instance.timerYear++;
      preferences.setInt('days', _instance.timerDays);
      preferences.setInt('year', _instance.timerYear);
    }
  }

  void changeMessage() async {
    //8시간후
    if (_instance.timerHour > 7) {
      _instance.message = "혈액 속의 일산화탄소량이 감소하고, 산소량이 정상으로 증가합니다";
    }
    //24시간후
    if (_instance.timerDays > 0) {
      _instance.message = "심장마비의 위험이 감소합니다";
    }
    //48시간후
    if (_instance.timerDays > 1) {
      _instance.message = "신경 말단 부위가 니코틴이 사라진것에 적응하며, 후각과 미각능력이 향상됩니다";
    }
    //72시간후
    if (_instance.timerDays > 2) {
      _instance.message = "기관지가 이완되고 호흡이 쉬워지며, 폐활량도 증가합니다";
    }
    //1개월후
    if (_instance.timerDays > 31) {
      _instance.message = "혈액순환이 좋아지며 걷기가 쉬워지며, 폐 기능이 30% 향샹됩니다";
    }
    //9개월후
    if (_instance.timerDays > 279) {
      _instance.message =
          "기침, 피곤, 산소 부족과 같은 증상이 모두 감소하고, 폐의 섬모가 다시 자라 폐 자체 기능이 정상화 되면서 감염이 감소합니다";
    }
    //1년후
    if (_instance.timerYear > 0) {
      _instance.message = "심장마비로 인한 사망 위험이 흡연자에 비해 절반으로 떨어집니다";
    }
    //5년후
    if (_instance.timerYear > 4) {
      _instance.message = "심장마비 사망 위험이 비흡연자와 거의 같아집니다";
    }
    //10년후
    if (_instance.timerYear > 9) {
      _instance.message = "폐암으로 인한 사망 위험이 흡연자의 절반으로 감소합니다";
    }
  }
}
