import 'package:flutter/material.dart';
import 'package:project/Profile.dart';

const List<Widget> gender = <Widget>[
  Text('남자'),
  Text('여자'),
];

class genderPage extends StatefulWidget {
  const genderPage({Key? key}) : super(key: key);

  @override
  State<genderPage> createState() => _genderPageState();
}

class _genderPageState extends State<genderPage> {
  final List<bool> _selectedGender = <bool>[true, false];
  bool vertical = false;
  var profile = Profile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          '성별',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xffAD8B73),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ToggleButtons(
              direction: vertical ? Axis.vertical : Axis.horizontal,
              onPressed: (int index) {
                setState(() {
                  // The button that is tapped is set to true, and the others to false.
                  for (int i = 0; i < _selectedGender.length; i++) {
                    _selectedGender[i] = i == index;
                  }
                  if (_selectedGender[0] == true) {
                    profile.inputGenderData("남자");
                    Navigator.pop(context);
                  }
                  if (_selectedGender[1] == true) {
                    profile.inputGenderData("여자");
                    Navigator.pop(context);
                  }
                });
              },
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              selectedBorderColor: Color(0xffAD8B73),
              selectedColor: Colors.white,
              fillColor: Color(0xffE3CAA5),
              color: Color(0xffE3CAA5),
              constraints: const BoxConstraints(
                minHeight: 40.0,
                minWidth: 80.0,
              ),
              isSelected: _selectedGender,
              children: gender,
            ),
          )
        ],
      ),
    );
  }
}
