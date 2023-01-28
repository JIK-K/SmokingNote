import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '금연노트',
        theme: ThemeData(
            fontFamily: 'SCDreams', scaffoldBackgroundColor: Color(0xffFFFBE9)),
        home: Scaffold(
          //Top
          appBar: AppBar(
            centerTitle: true,
            elevation: 0.0,
            title: Text(
              '금연노트',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'assets/fonts/SCDreams.otf'),
            ),
            backgroundColor: Color(0xffAD8B73),
          ),

          //Body
          body: Column(
            children: <Widget>[
              //Picture Area
              Flexible(
                  fit: FlexFit.tight,
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border(
                            left:
                                BorderSide(width: 6, color: Color(0xffE3CAA5)),
                            top: BorderSide(width: 6, color: Color(0xffE3CAA5)),
                            right: BorderSide(
                                width: 6, color: Color(0xffE3CAA5)))),
                    child: Container(
                      child:
                          Image.asset('assets/happyday.png', fit: BoxFit.fill),
                    ),
                  )),

              //Smoking Time Area
              Flexible(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border(
                      left: BorderSide(width: 6, color: Color(0xffE3CAA5)),
                      right: BorderSide(width: 6, color: Color(0xffE3CAA5)),
                      top: BorderSide(width: 6, color: Color(0xffE3CAA5)),
                    )),
                  )),
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
                                  width: 6, color: Color(0xffE3CAA5)),
                              right: BorderSide(
                                  width: 3, color: Color(0xffE3CAA5)),
                              top: BorderSide(
                                  width: 6, color: Color(0xffE3CAA5)),
                            )),
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [Text('절약한 금액'), Text('1000₩')],
                              ),
                            ))),
                    //Spent Money Area
                    Flexible(
                        child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border(
                              left: BorderSide(
                                  width: 3, color: Color(0xffE3CAA5)),
                              right: BorderSide(
                                  width: 6, color: Color(0xffE3CAA5)),
                              top: BorderSide(
                                  width: 6, color: Color(0xffE3CAA5)),
                            )),
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [Text('소비한 금액'), Text('112121₩')],
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
                          left: BorderSide(width: 6, color: Color(0xffE3CAA5)),
                          right: BorderSide(width: 3, color: Color(0xffE3CAA5)),
                          top: BorderSide(width: 6, color: Color(0xffE3CAA5)),
                        )),
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('절약한 시간'), Text('12시간15분')],
                        )),
                      )),
                      //Spent Time Area
                      Flexible(
                          child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border(
                                left: BorderSide(
                                    width: 3, color: Color(0xffE3CAA5)),
                                right: BorderSide(
                                    width: 6, color: Color(0xffE3CAA5)),
                                top: BorderSide(
                                    width: 6, color: Color(0xffE3CAA5)),
                              )),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [Text('낭비된 시간'), Text('123시간')],
                                ),
                              )))
                    ],
                  )),
              //Icon Button Area
              Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border(
                      left: BorderSide(width: 6, color: Color(0xffE3CAA5)),
                      right: BorderSide(width: 6, color: Color(0xffE3CAA5)),
                      top: BorderSide(width: 6, color: Color(0xffE3CAA5)),
                    )),
                  )),
              //Counting Area
              Flexible(
                  flex: 1,
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
                              top: BorderSide(
                                  width: 6, color: Color(0xffE3CAA5)),
                              left: BorderSide(
                                  width: 6, color: Color(0xffE3CAA5)),
                              right: BorderSide(
                                  width: 3, color: Color(0xffE3CAA5)),
                              bottom: BorderSide(
                                  width: 6, color: Color(0xffE3CAA5)),
                            )),
                            child: Center(child: Text('test1')),
                          )),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border(
                              top: BorderSide(
                                  width: 6, color: Color(0xffE3CAA5)),
                              left: BorderSide(
                                  width: 3, color: Color(0xffE3CAA5)),
                              right: BorderSide(
                                  width: 3, color: Color(0xffE3CAA5)),
                              bottom: BorderSide(
                                  width: 6, color: Color(0xffE3CAA5)),
                            )),
                            child: Center(child: Text('test2')),
                          )),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border(
                              top: BorderSide(
                                  width: 6, color: Color(0xffE3CAA5)),
                              left: BorderSide(
                                  width: 3, color: Color(0xffE3CAA5)),
                              right: BorderSide(
                                  width: 6, color: Color(0xffE3CAA5)),
                              bottom: BorderSide(
                                  width: 6, color: Color(0xffE3CAA5)),
                            )),
                            child: Center(child: Text('test3')),
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
        ));
  }
}

//===========================================================================//
//Widget
//===========================================================================//
class IconButtonList extends StatelessWidget {
  const IconButtonList({Key? key}) : super(key: key);

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
            build(context);
          },
        ),
        IconButton(
          icon: Icon(Icons.leaderboard, color: Colors.grey),
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          onPressed: () {
            build(context);
          },
        ),
        IconButton(
          icon: Icon(Icons.settings, color: Colors.grey),
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          onPressed: () {
            build(context);
          },
        )
      ],
    );
  }
}
//===========================================================================//

//===========================================================================//
