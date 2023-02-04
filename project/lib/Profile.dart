import 'package:shared_preferences/shared_preferences.dart';

class Profile {
  var name = "김삼덕";
  var gender;
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
    _instance.name = "김삼덕";
    // _instance.name = preferences.getString('name') ?? "";
    _instance.gender = preferences.getString('gender') ?? "";
    _instance.birthday = preferences.getString('birthday') ?? "";
    // _instance.picture = preferences.getString('name') ?? 0;
  }
}
