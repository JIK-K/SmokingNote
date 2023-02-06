import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/Profile.dart';

class cigarettePricePage extends StatefulWidget {
  const cigarettePricePage({Key? key}) : super(key: key);

  @override
  State<cigarettePricePage> createState() => _cigarettePricePageState();
}

class _cigarettePricePageState extends State<cigarettePricePage> {
  final priceController = TextEditingController();

  var profile = Profile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          '담배 가격',
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
              maxLength: 5,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: priceController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '담배 가격',
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Color(0xffE3CAA5)),
            onPressed: () {
              profile.inputcigarettePriceData(int.parse(priceController.text));
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
