import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/Profile.dart';

class startSmokingPage extends StatefulWidget {
  const startSmokingPage({Key? key}) : super(key: key);

  @override
  State<startSmokingPage> createState() => _startSmokingPageState();
}

class _startSmokingPageState extends State<startSmokingPage> {
  var profile = Profile();
  String _selectedDate = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          '흡연 시작일',
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
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (selected != null) {
      setState(() {
        _selectedDate = (DateFormat('yyyy년 M월 d일')).format(selected);
        profile.inputStartSmokingData(_selectedDate);
      });
    }
  }
}
