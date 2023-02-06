import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/Profile.dart';

class perDaySmokingPage extends StatefulWidget {
  const perDaySmokingPage({Key? key}) : super(key: key);

  @override
  State<perDaySmokingPage> createState() => _perDaySmokingPageState();
}

class _perDaySmokingPageState extends State<perDaySmokingPage> {
  final perDayController = TextEditingController();

  var profile = Profile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          '하루 흡연량',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xffAD8B73),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              maxLength: 2,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: perDayController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '하루 흡연량',
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Color(0xffE3CAA5)),
            onPressed: () {
              profile.inputperDaySmokingData(int.parse(perDayController.text));
              Navigator.pop(context);
            },
            child: Text(
              '확인',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
