import 'package:flutter/material.dart';
import 'package:project/profile_Screen/birthday.dart';
import 'package:project/profile_Screen/gender.dart';

import 'Profile.dart';
import 'main.dart';
import 'profile_Screen/name.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  ScrollController _scrollController = ScrollController();
  var profile = Profile();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
      body: Column(
        children: [
          Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 30, left: 15, bottom: 10),
                    color: Color(0xffE3CAA5),
                    child: Text("프로필"),
                  ),
                  Flexible(
                      fit: FlexFit.tight,
                      child: ListView(
                        children: [
                          ListTile(
                            title: Text('이름'),
                            subtitle: Text(profile.name),
                            trailing: Icon(Icons.keyboard_arrow_right_sharp),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => namePage()));
                            },
                          ),
                          ListTile(
                            title: Text('성별'),
                            subtitle: Text(profile.gender),
                            trailing: Icon(Icons.keyboard_arrow_right_sharp),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => genderPage()));
                            },
                          ),
                          ListTile(
                            title: Text('생일'),
                            subtitle: Text('1872년 1월 1일'),
                            trailing: Icon(Icons.keyboard_arrow_right_sharp),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => birthdayPage()));
                            },
                          ),
                          ListTile(
                            title: Text('사진'),
                            trailing: Image.asset('assets/play_store_512.png',
                                height: 45, width: 45),
                            onTap: () {},
                          ),
                        ],
                      ))
                ],
              )),
          Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 30, left: 15, bottom: 10),
                    color: Color(0xffE3CAA5),
                    child: Text("정보"),
                  ),
                  Flexible(
                      child: ListView(
                    children: [
                      ListTile(
                        title: Text('흡연 시작일'),
                        subtitle: Text('1987년 1월 2일'),
                        trailing: Icon(Icons.keyboard_arrow_right_sharp),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text('금연 시작일'),
                        subtitle: Text('1999년 1월 1일'),
                        trailing: Icon(Icons.keyboard_arrow_right_sharp),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text('하루 흡연량'),
                        subtitle: Text('512개비'),
                        trailing: Icon(Icons.keyboard_arrow_right_sharp),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text('평균 흡연 시간'),
                        subtitle: Text('5분'),
                        trailing: Icon(Icons.keyboard_arrow_right_sharp),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text('담배가격'),
                        subtitle: Text('5,487,000,000₩'),
                        trailing: Icon(Icons.keyboard_arrow_right_sharp),
                        onTap: () {},
                      ),
                    ],
                  ))
                ],
              )),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.only(top: 30, left: 15, bottom: 10),
                color: Color(0xffE3CAA5),
                child: Text("정보"),
              ),
              Flexible(
                  child: ListView(
                children: [
                  ListTile(
                    title: Text('version'),
                    subtitle: Text('1.0'),
                    trailing: Icon(Icons.keyboard_arrow_right_sharp),
                    onTap: () {},
                  ),
                ],
              ))
            ],
          ))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          child: SizedBox(
        height: 70,
        child: IconButtonList(),
      )),
    );
  }
}
