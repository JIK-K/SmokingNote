import 'package:flutter/material.dart';
import 'package:project/Profile.dart';

class namePage extends StatefulWidget {
  const namePage({Key? key}) : super(key: key);

  @override
  State<namePage> createState() => _namePageState();
}

class _namePageState extends State<namePage> {
  final nameController = TextEditingController();

  var profile = Profile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          '이름',
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
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '이름',
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Color(0xffE3CAA5)),
            onPressed: () {
              profile.inputNameData(nameController.text);
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
