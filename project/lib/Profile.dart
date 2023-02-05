import 'package:shared_preferences/shared_preferences.dart';

class Profile {
  var name = "김삼덕";
  var gender = "남";
  var birthday;
  var picture;

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
    //splitdata
  }
}
