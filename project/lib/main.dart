import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ClockTimer.dart';
import 'Date.dart';
import 'Patience.dart';
import 'Profile.dart';
import 'SettingPage.dart';
import 'StatisticsPage.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var patience = Patience();
  var clock = Clock();
  var date = Date();
  var profile = Profile();
  Timer? _timer;
  Timer? _timer2;

  @override
  void initState() {
    // TODO: implement initState
    _startTimer();
    _checkDay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('ko', 'KR'),
        ],
        title: '금연노트',
        theme: ThemeData(
            fontFamily: 'SCDream5',
            scaffoldBackgroundColor: Colors.white /*Color(0xffFFFBE9)*/),
        home: Builder(builder: (context) {
          return Scaffold(
            //Top
            appBar: AppBar(
              centerTitle: true,
              elevation: 0.0,
              title: Text(
                '금연노트',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              backgroundColor: Color(0xffAD8B73),
            ),

            //Body
            body: Column(
              children: [
                //Picture Area
                Flexible(
                    fit: FlexFit.tight,
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/picture.png'),
                              fit: BoxFit.fill),
                          border: Border(
                              left: BorderSide(
                                  width: 4, color: Color(0xffE3CAA5)),
                              top: BorderSide(
                                  width: 4, color: Color(0xffE3CAA5)),
                              right: BorderSide(
                                  width: 4, color: Color(0xffE3CAA5)))),
                    )),

                //Smoking Time Area
                Flexible(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border(
                      left: BorderSide(width: 4, color: Color(0xffE3CAA5)),
                      right: BorderSide(width: 4, color: Color(0xffE3CAA5)),
                      top: BorderSide(width: 4, color: Color(0xffE3CAA5)),
                    )),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '금연 시간',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'years      Days      Hours      Mins      Secs',
                            style: TextStyle(fontSize: 10),
                          ),
                          Text(
                            clock.timerYear.toString() +
                                " : " +
                                clock.timerDays.toString() +
                                " : " +
                                clock.timerHour.toString() +
                                " : " +
                                clock.timerMins.toString() +
                                " : " +
                                clock.timerSecs.toString(),
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                            clock.message,
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //Save Time & Money Area
                Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      //Save Money Area
                      Flexible(
                          child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border(
                                left: BorderSide(
                                    width: 4, color: Color(0xffE3CAA5)),
                                right: BorderSide(
                                    width: 2, color: Color(0xffE3CAA5)),
                                top: BorderSide(
                                    width: 4, color: Color(0xffE3CAA5)),
                              )),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '절약한 금액',
                                      style: TextStyle(fontSize: 8),
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                              locale: 'ko_KR', symbol: '₩')
                                          .format(profile.savings),
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                              ))),
                      //Spent Money Area
                      Flexible(
                          child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border(
                                left: BorderSide(
                                    width: 2, color: Color(0xffE3CAA5)),
                                right: BorderSide(
                                    width: 4, color: Color(0xffE3CAA5)),
                                top: BorderSide(
                                    width: 4, color: Color(0xffE3CAA5)),
                              )),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '소비한 금액',
                                      style: TextStyle(fontSize: 8),
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                              locale: 'ko_KR', symbol: '₩')
                                          .format(profile.comsumption),
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                              )))
                    ],
                  ),
                ),
                Flexible(
                    flex: 1,
                    child: Row(
                      children: [
                        //Save Time Area
                        Flexible(
                            child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border(
                            left:
                                BorderSide(width: 4, color: Color(0xffE3CAA5)),
                            right:
                                BorderSide(width: 2, color: Color(0xffE3CAA5)),
                            top: BorderSide(width: 4, color: Color(0xffE3CAA5)),
                          )),
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '절약한 시간',
                                style: TextStyle(fontSize: 8),
                              ),
                              Text(
                                profile.savingTime_day.toString() +
                                    "일 " +
                                    profile.savingTime_hour.toString() +
                                    "시간 " +
                                    profile.savingTime_min.toString() +
                                    "분",
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          )),
                        )),
                        //Spent Time Area
                        Flexible(
                            child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border(
                                  left: BorderSide(
                                      width: 2, color: Color(0xffE3CAA5)),
                                  right: BorderSide(
                                      width: 4, color: Color(0xffE3CAA5)),
                                  top: BorderSide(
                                      width: 4, color: Color(0xffE3CAA5)),
                                )),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '낭비된 시간',
                                        style: TextStyle(fontSize: 8),
                                      ),
                                      Text(
                                        profile.abandonedLife,
                                        style: TextStyle(fontSize: 15),
                                      )
                                    ],
                                  ),
                                )))
                      ],
                    )),
                //Icon Button Area
                Flexible(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border(
                        left: BorderSide(width: 4, color: Color(0xffE3CAA5)),
                        right: BorderSide(width: 4, color: Color(0xffE3CAA5)),
                        top: BorderSide(width: 4, color: Color(0xffE3CAA5)),
                      )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.indigo,
                            child: IconButton(
                              iconSize: 50,
                              icon: Icon(Icons.fitness_center,
                                  color: Colors.white),
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              onPressed: () {
                                healthDialog(context);
                              },
                            ),
                          ),
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.orangeAccent,
                            child: IconButton(
                              iconSize: 50,
                              icon: Icon(Icons.sports_bar, color: Colors.white),
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              onPressed: () {
                                alcoholDialog(context);
                              },
                            ),
                          ),
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.redAccent,
                            child: IconButton(
                              iconSize: 50,
                              icon: Icon(Icons.smoking_rooms,
                                  color: Colors.white),
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              onPressed: () {
                                smokeDialog(context);
                              },
                            ),
                          )
                        ],
                      ),
                    )),
                //Counting Area
                Flexible(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border(
                            top: BorderSide(width: 4, color: Color(0xffE3CAA5)),
                            left:
                                BorderSide(width: 4, color: Color(0xffE3CAA5)),
                            right:
                                BorderSide(width: 2, color: Color(0xffE3CAA5)),
                            bottom:
                                BorderSide(width: 4, color: Color(0xffE3CAA5)),
                          )),
                          child: Center(
                              child: Text(patience.health.toString() + "분")),
                        )),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border(
                            top: BorderSide(width: 4, color: Color(0xffE3CAA5)),
                            left:
                                BorderSide(width: 2, color: Color(0xffE3CAA5)),
                            right:
                                BorderSide(width: 2, color: Color(0xffE3CAA5)),
                            bottom:
                                BorderSide(width: 4, color: Color(0xffE3CAA5)),
                          )),
                          child: Center(
                              child: Text(patience.alcohol.toString() + "잔")),
                        )),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border(
                            top: BorderSide(width: 4, color: Color(0xffE3CAA5)),
                            left:
                                BorderSide(width: 2, color: Color(0xffE3CAA5)),
                            right:
                                BorderSide(width: 4, color: Color(0xffE3CAA5)),
                            bottom:
                                BorderSide(width: 4, color: Color(0xffE3CAA5)),
                          )),
                          child: Center(
                            child: Text(patience.smoking.toString() + "개"),
                          ),
                        )),
                  ],
                )),
              ],
            ),

            //Bottom
            bottomNavigationBar: BottomAppBar(
                child: SizedBox(
              height: 70,
              child: IconButtonList(),
            )),
          );
        }));
  }

//===========================================================================//
//function
//===========================================================================//
  void _startTimer() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        clock.timerSecs++;
        preferences.setInt('secs', clock.timerSecs);
        clock.checkTimer();
        clock.changeMessage();
      });
    });
  }

  void _checkDay() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    DateTime now = DateTime.now();
    _timer2 = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (date.day != now.day) {
          date.day = now.day;
          preferences.setInt('resetDay', date.day);
          patience.resetData();
        }
      });
    });
  }

  void smokeDialog(context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Column(
            children: [
              new Text("담배를 피우셨습니까?"),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "금연시간이 초기화 됩니다.",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
          actions: [
            TextButton(
              child: Text("예"),
              onPressed: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                setState(() {
                  patience.smoking = preferences.getInt('smoke') ?? 0;
                  patience.smoking = patience.smoking + 1;
                  preferences.setInt('smoke', patience.smoking);

                  patience.totalSmoking = preferences.getInt('totalSmoke') ?? 0;
                  patience.totalSmoking = patience.totalSmoking + 1;
                  preferences.setInt('totalSmoke', patience.totalSmoking);
                  clock.resetTimer();
                  profile.resetProfile();
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("아니오"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  void alcoholDialog(context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Column(
            children: [
              new Text("하... 술을 마셨습니까?"),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "술을 마시면 흡연 욕구가 증가하게 됩니다.",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
          actions: [
            TextButton(
              child: Text("예"),
              onPressed: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                setState(() {
                  patience.alcohol = preferences.getInt('alcohol') ?? 0;
                  patience.alcohol = patience.alcohol + 1;
                  preferences.setInt('alcohol', patience.alcohol);

                  patience.totalAlcohol =
                      preferences.getInt('totalAlcohol') ?? 0;
                  patience.totalAlcohol = patience.totalAlcohol + 1;
                  preferences.setInt('totalAlcohol', patience.totalAlcohol);
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("아니오"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  void healthDialog(context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Column(
            children: [
              new Text("운동을 하셨습니까?"),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "건강해지셨습니다.\n30분의 운동량이 추가됩니다.",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
          actions: [
            TextButton(
              child: Text("예"),
              onPressed: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                setState(() {
                  patience.health = preferences.getInt('health') ?? 0;
                  patience.health = patience.health + 30;
                  preferences.setInt('health', patience.health);

                  patience.totalHealth = preferences.getInt('totalHealth') ?? 0;
                  patience.totalHealth = patience.totalHealth + 1;
                  preferences.setInt('totalHealth', patience.totalHealth);
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("아니오"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

//===========================================================================//
//===========================================================================//
}

//===========================================================================//
//Widget
//===========================================================================//
class IconButtonList extends StatelessWidget {
  // const IconButtonList({Key? key}) : super(key: key);
  bool? flagMain;
  bool? flagStatistics;
  bool? flagSetting;

  IconButtonList._privateConstructor();

  static final IconButtonList _instance = IconButtonList._internal();

  factory IconButtonList() {
    return _instance;
  }

  IconButtonList._internal() {
    flagMain = false;
    flagStatistics = true;
    flagSetting = true;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: Icon(Icons.home, color: Colors.grey),
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          onPressed: () {
            if (_instance.flagMain == true) {
              _instance.flagMain = false;
              _instance.flagStatistics = true;
              _instance.flagSetting = true;
              Navigator.pop(context);
            }
          },
        ),
        IconButton(
          icon: Icon(Icons.leaderboard, color: Colors.grey),
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          onPressed: () {
            if (_instance.flagStatistics == true &&
                _instance.flagSetting == false) {
              _instance.flagStatistics = false;
              _instance.flagMain = true;
              _instance.flagSetting = true;
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Statistics()));
            } else if (_instance.flagStatistics == true) {
              _instance.flagStatistics = false;
              _instance.flagMain = true;
              _instance.flagSetting = true;
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Statistics()));
            }
          },
        ),
        IconButton(
          icon: Icon(Icons.settings, color: Colors.grey),
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          onPressed: () {
            if (_instance.flagStatistics == false &&
                _instance.flagSetting == true) {
              _instance.flagSetting = false;
              _instance.flagMain = true;
              _instance.flagStatistics = true;
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SettingPage()));
            } else if (_instance.flagSetting == true) {
              _instance.flagSetting = false;
              _instance.flagMain = true;
              _instance.flagStatistics = true;
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SettingPage()));
            }
          },
        )
      ],
    );
  }
}
//===========================================================================//

//===========================================================================//
