import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/Profile.dart';

class averageSmokingPage extends StatefulWidget {
  const averageSmokingPage({Key? key}) : super(key: key);

  @override
  State<averageSmokingPage> createState() => _averageSmokingPageState();
}

class _averageSmokingPageState extends State<averageSmokingPage> {
  final averageController = TextEditingController();

  var profile = Profile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          '평균 흡연 시간',
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
              maxLength: 1,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: averageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '평균 흡연 시간',
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Color(0xffE3CAA5)),
            onPressed: () {
              profile
                  .inputaverageSmokingData(int.parse(averageController.text));
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
