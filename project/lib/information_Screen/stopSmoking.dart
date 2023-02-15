import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/Profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ClockTimer.dart';

class stopSmokingPage extends StatefulWidget {
  const stopSmokingPage({Key? key}) : super(key: key);

  @override
  State<stopSmokingPage> createState() => _stopSmokingPageState();
}

class _stopSmokingPageState extends State<stopSmokingPage> {
  var profile = Profile();
  var clock = Clock();
  String _selectedDate = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          '금연 시작일',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xffAD8B73),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                  height: 50,
                  width: 500,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Color(0xffE3CAA5),
                    style: BorderStyle.solid,
                    width: 5,
                  )),
                  child: Center(
                    child: Text(
                      _selectedDate,
                      style: TextStyle(fontSize: 24),
                    ),
                  )),
              IconButton(
                  onPressed: () => _selectDate(context),
                  icon: Icon(Icons.date_range)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color(0xffE3CAA5)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  '확인',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future _selectDate(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (selected != null) {
      setState(() {
        profile.savings = 0;

        _selectedDate = (DateFormat('yyyy년 M월 d일')).format(selected);

        var convertDate = (DateFormat('yyyyMMdd')).format(selected);

        profile.inputstopSmokingConvert(convertDate);
        profile.inputStopSmokingData(_selectedDate);

        Timer(Duration(milliseconds: 10), () {
          //금연 시작한 날부터 현재까지의 날 계산
          //saving에 들어갈거 계산
          DateTime stopday = DateTime.parse(profile.stopSmokingConvert);
          Duration durationDay = DateTime.now().difference(stopday);

          var onePrice = profile.cigarettePrice / 20;
          int dayPrice = (onePrice * profile.perDaySmoking).toInt();
          profile.inputsavings((dayPrice * durationDay.inDays).toInt());

          //savingTime에 들어갈거 계산
          profile.inputsavingTimeDay(durationDay.inDays);

          //clock 변경
          clock.timerDays = durationDay.inDays;
          preferences.setInt('days', durationDay.inDays);

          profile.spendMoney();
          profile.spendDay();
        });
      });
    }
  }
}
