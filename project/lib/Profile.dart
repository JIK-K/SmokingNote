import 'package:shared_preferences/shared_preferences.dart';

class Profile {
  var name = "김삼덕";
  var gender = "남";
  var birthday = "1900년 1월 1일";

  var startSmoking = "1950년 1월 1일";
  var stopSmoking = "1900년 1월 1일";
  var perDaySmoking = 20;
  var averageSmoking = 5;
  var cigarettePrice = 4500;

  var startSmokingConvert = "19500101";
  var stopSmokingConvert = "19000101";
  var comsumption = 0;
  var abandonedLife = "100일 1시간 1분";
  var savings = 0;

  var savingTime_day = 0;
  var savingTime_hour = 0;
  var savingTime_min = 0;
  Profile._privateConstructor();
  static final Profile _instance = Profile._internal();

  factory Profile() {
    return _instance;
  }
  Profile._internal() {
    updateData();
  }

  void updateData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _instance.name = preferences.getString('name') ?? "";
    _instance.gender = preferences.getString('gender') ?? "";
    _instance.birthday = preferences.getString('birthday') ?? "";

    _instance.startSmoking = preferences.getString('startsmoke') ?? "";
    _instance.stopSmoking = preferences.getString('stopsmoke') ?? "";
    _instance.perDaySmoking = preferences.getInt('perdaysmoke') ?? 0;
    _instance.averageSmoking = preferences.getInt('averagesmoke') ?? 0;
    _instance.cigarettePrice = preferences.getInt('cigaretteprice') ?? 0;

    _instance.startSmokingConvert = preferences.getString('startConvert') ?? "";
    _instance.stopSmokingConvert = preferences.getString('stopConvert') ?? "";

    _instance.comsumption = preferences.getInt('comsumption') ?? 0;
    _instance.abandonedLife = preferences.getString('abandonedLife') ?? "";
    _instance.savings = preferences.getInt('savings') ?? 0;
    _instance.savingTime_day = preferences.getInt('savingTimeDay') ?? 0;
    _instance.savingTime_hour = preferences.getInt('savingTimeHour') ?? 0;
    _instance.savingTime_min = preferences.getInt('savingTimeMin') ?? 0;
  }

  //소비한 금액
  spendMoney() async {
    //흡연 시작일 - 금연 시작일 = 담배핀 일수 day
    DateTime startday = DateTime.parse(_instance.startSmokingConvert);
    DateTime stopday = DateTime.parse(_instance.stopSmokingConvert);

    Duration durationDay = stopday.difference(startday);

    //담배가격 / 20 = 한개비 개수
    var onePrice = _instance.cigarettePrice / 20;

    //한개비 개수 * 하루 흡연량 = 하루 흡연 가격
    //하루 흡연 가격 * 담배핀 일수
    int spendMoney =
        ((onePrice * _instance.perDaySmoking) * durationDay.inDays).toInt();

    inputcomsumption(spendMoney);
  }

  //낭비된 시간
  spendDay() async {
    int min = 0;
    int hour = 0;
    int day = 0;

    //흡연 시작일 - 금연 시작일 = 담배핀 일수 day
    DateTime startday = DateTime.parse(_instance.startSmokingConvert);
    DateTime stopday = DateTime.parse(_instance.stopSmokingConvert);

    Duration durationDay = stopday.difference(startday);

    //하루에 담배피는 시간 = OO분
    int perDay = _instance.perDaySmoking * _instance.averageSmoking;

    min = (durationDay.inDays * perDay).toInt();
    if (min / 60 > 0) {
      hour = (min / 60).toInt();
      min = min % 60;
      if (hour > 24) {
        day = (hour / 24).toInt();
        hour = hour % 24;
      }
    }
    String abandonedLife =
        day.toString() + "일 " + hour.toString() + "시간 " + min.toString() + "분 ";
    inputabandonedLife(abandonedLife);
  }

  //절약한 금액
  saveMoney() async {
    //하루 흡연량 비 가격
    var onePrice = _instance.cigarettePrice / 20;
    int dayPrice = (onePrice * _instance.perDaySmoking).toInt();
    inputsavings((dayPrice / 24).toInt());
  }

  //절약한 시간
  saveTime() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    //하루에 담배피는 시간 = OO분
    int perDay = _instance.perDaySmoking * _instance.averageSmoking;

    if (_instance.savingTime_min > 59) {
      _instance.savingTime_min = 0;
      _instance.savingTime_hour = _instance.savingTime_hour + 1;
      _instance.savingTime_min = (perDay / 24).toInt();
      inputsavingTimeMin(_instance.savingTime_min);
      inputsavingTimeHour(_instance.savingTime_hour);
    }
    if (_instance.savingTime_hour > 23) {
      _instance.savingTime_hour = 0;
      _instance.savingTime_day = _instance.savingTime_day + 1;
      _instance.savingTime_min = (perDay / 24).toInt();
      inputsavingTimeMin(_instance.savingTime_min);
      inputsavingTimeHour(_instance.savingTime_hour);
      inputsavingTimeDay(_instance.savingTime_day);
    } else {
      _instance.savingTime_min = (perDay / 24).toInt();
      inputsavingTimeMin(_instance.savingTime_min);
    }
  }

  void resetProfile() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    _instance.savings = 0;
    _instance.savingTime_day = 0;
    _instance.savingTime_hour = 0;
    _instance.savingTime_min = 0;

    preferences.setInt('savings', _instance.savings);
    preferences.setInt('savingTimeDay', _instance.savingTime_day);
    preferences.setInt('savingTimeHour', _instance.savingTime_hour);
    preferences.setInt('savingTimeMin', _instance.savingTime_min);
  }

  inputNameData(String inputName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _instance.name = inputName;
    preferences.setString('name', inputName);
  }

  inputGenderData(String inputGender) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _instance.gender = inputGender;
    preferences.setString('gender', inputGender);
  }

  inputbirthDayData(String inputBirthday) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _instance.birthday = inputBirthday;
    preferences.setString('birthday', inputBirthday);
  }

  inputStartSmokingData(String inputStartSmoking) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _instance.startSmoking = inputStartSmoking;
    preferences.setString('startsmoke', inputStartSmoking);
  }

  inputStopSmokingData(String inputStopSmoking) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _instance.stopSmoking = inputStopSmoking;
    preferences.setString('stopsmoke', inputStopSmoking);
  }

  inputperDaySmokingData(int inputperDaySmoking) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _instance.perDaySmoking = inputperDaySmoking;
    preferences.setInt('perdaysmoke', inputperDaySmoking);
  }

  inputaverageSmokingData(int inputaverageSmoking) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _instance.averageSmoking = inputaverageSmoking;
    preferences.setInt('averagesmoke', inputaverageSmoking);
  }

  inputcigarettePriceData(int inputcigarettePrice) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _instance.cigarettePrice = inputcigarettePrice;
    preferences.setInt('cigaretteprice', inputcigarettePrice);
  }

  inputstartSmokingConvert(String Convert) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _instance.startSmokingConvert = Convert;
    preferences.setString('startConvert', Convert);
  }

  inputstopSmokingConvert(String Convert) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _instance.stopSmokingConvert = Convert;
    preferences.setString('stopConvert', Convert);
  }

  inputcomsumption(int comsumption) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _instance.comsumption = comsumption;
    preferences.setInt('comsumption', comsumption);
  }

  inputabandonedLife(String abandonedLife) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _instance.abandonedLife = abandonedLife;
    preferences.setString('abandonedLife', abandonedLife);
  }

  inputsavings(int savings) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _instance.savings = _instance.savings + savings;
    preferences.setInt('savings', savings);
  }

  inputsavingTimeDay(int savingTime) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _instance.savingTime_day = savingTime;
    preferences.setInt('savingTimeDay', savingTime);
  }

  inputsavingTimeHour(int savingTime) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _instance.savingTime_hour = savingTime;
    preferences.setInt('savingTimeHour', savingTime);
  }

  inputsavingTimeMin(int savingTime) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _instance.savingTime_min = savingTime;
    preferences.setInt('savingTimeMin', savingTime);
  }
}
