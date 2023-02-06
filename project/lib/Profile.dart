import 'package:shared_preferences/shared_preferences.dart';

class Profile {
  var name = "김삼덕";
  var gender = "남";
  var birthday = "1900년 1월 1일";
  var picture;

  var startSmoking = "1950년 1월 1일";
  var stopSmoking = "1900년 1월 1일";
  var perDaySmoking = 20;
  var averageSmoking = 5;
  var cigarettePrice = 4500;

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
    // _instance.picture = preferences.getString('name') ?? 0;

    _instance.startSmoking = preferences.getString('startsmoke') ?? "";
    _instance.stopSmoking = preferences.getString('stopsmoke') ?? "";
    _instance.perDaySmoking = preferences.getInt('perdaysmoke') ?? 0;
    _instance.averageSmoking = preferences.getInt('averagesmoke') ?? 0;
    _instance.cigarettePrice = preferences.getInt('cigaretteprice') ?? 0;
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
}
