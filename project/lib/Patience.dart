import 'package:shared_preferences/shared_preferences.dart';

class Patience {
  int health = 0;
  int alcohol = 0;
  int smoking = 0;

  Patience._privateConstructor();
  static final Patience _instance = Patience._internal();

  factory Patience() {
    return _instance;
  }
  Patience._internal() {
    updateData();
  }
  void updateData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _instance.health = preferences.getInt('health') ?? 0;
    _instance.alcohol = preferences.getInt('alcohol') ?? 0;
    _instance.smoking = preferences.getInt('smoke') ?? 0;

    print("다설정해주고감");
    print("이세카이" + _instance.smoking.toString());
  }

  // int get health => _health;
  // set health(int health) => _health = health;
  //
  // int get alcohol => _alcohol;
  // set alcohol(int alcohol) => _alcohol = alcohol;
  //
  // int get smoking => _smoking;
  // set smoking(int smoking) => _smoking = smoking;
}
