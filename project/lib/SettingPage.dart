import 'package:flutter/material.dart';

import 'main.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text(
          '설정',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xffAD8B73),
      ),
      body: Text("setting test page"),
      bottomNavigationBar: BottomAppBar(
          child: SizedBox(
        height: 70,
        child: IconButtonList(),
      )),
    );
  }
}
