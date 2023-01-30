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
            fontFamily: 'SCDream5',
            scaffoldBackgroundColor: Colors.white /*Color(0xffFFFBE9)*/),
        home: Scaffold(
          //Top
          appBar: AppBar(
            centerTitle: true,
            elevation: 0.0,
            title: Text(
              '금연노트',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
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
                        image: DecorationImage(
                            image: AssetImage('assets/test12.png'),
                            fit: BoxFit.fill),
                        border: Border(
                            left:
                                BorderSide(width: 4, color: Color(0xffE3CAA5)),
                            top: BorderSide(width: 4, color: Color(0xffE3CAA5)),
                            right: BorderSide(
                                width: 4, color: Color(0xffE3CAA5)))),
                  )),

              //Smoking Time Area
              Flexible(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border(
                    left: BorderSide(width: 4, color: Color(0xffE3CAA5)),
                    right: BorderSide(width: 4, color: Color(0xffE3CAA5)),
                    top: BorderSide(width: 4, color: Color(0xffE3CAA5)),
                  )),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '금연 시간',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'years      Days      Hours      Mins      Secs',
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(
                          '00 : 000 : 00 : 00 : 00',
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          '이제 위에거를 받아서 몇분마다 상태변화가된다는걸적어준다',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
                                  width: 4, color: Color(0xffE3CAA5)),
                              right: BorderSide(
                                  width: 2, color: Color(0xffE3CAA5)),
                              top: BorderSide(
                                  width: 4, color: Color(0xffE3CAA5)),
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
                                  width: 2, color: Color(0xffE3CAA5)),
                              right: BorderSide(
                                  width: 4, color: Color(0xffE3CAA5)),
                              top: BorderSide(
                                  width: 4, color: Color(0xffE3CAA5)),
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
                          left: BorderSide(width: 4, color: Color(0xffE3CAA5)),
                          right: BorderSide(width: 2, color: Color(0xffE3CAA5)),
                          top: BorderSide(width: 4, color: Color(0xffE3CAA5)),
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
                                    width: 2, color: Color(0xffE3CAA5)),
                                right: BorderSide(
                                    width: 4, color: Color(0xffE3CAA5)),
                                top: BorderSide(
                                    width: 4, color: Color(0xffE3CAA5)),
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
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border(
                      left: BorderSide(width: 4, color: Color(0xffE3CAA5)),
                      right: BorderSide(width: 4, color: Color(0xffE3CAA5)),
                      top: BorderSide(width: 4, color: Color(0xffE3CAA5)),
                    )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.indigo,
                          child: IconButton(
                            iconSize: 50,
                            icon:
                                Icon(Icons.fitness_center, color: Colors.white),
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            onPressed: () {
                              build(context);
                            },
                          ),
                        ),
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.orangeAccent,
                          child: IconButton(
                            iconSize: 50,
                            icon: Icon(Icons.sports_bar, color: Colors.white),
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            onPressed: () {
                              build(context);
                            },
                          ),
                        ),
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.redAccent,
                          child: IconButton(
                            iconSize: 50,
                            icon:
                                Icon(Icons.smoking_rooms, color: Colors.white),
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            onPressed: () {
                              build(context);
                            },
                          ),
                        )
                      ],
                    ),
                  )),
              //Counting Area
              Flexible(
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
                          top: BorderSide(width: 4, color: Color(0xffE3CAA5)),
                          left: BorderSide(width: 4, color: Color(0xffE3CAA5)),
                          right: BorderSide(width: 2, color: Color(0xffE3CAA5)),
                          bottom:
                              BorderSide(width: 4, color: Color(0xffE3CAA5)),
                        )),
                        child: Center(child: Text('운동몇분누를때마다30분')),
                      )),
                  Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border(
                          top: BorderSide(width: 4, color: Color(0xffE3CAA5)),
                          left: BorderSide(width: 2, color: Color(0xffE3CAA5)),
                          right: BorderSide(width: 2, color: Color(0xffE3CAA5)),
                          bottom:
                              BorderSide(width: 4, color: Color(0xffE3CAA5)),
                        )),
                        child: Center(child: Text('술몇잔누를때마다한잔')),
                      )),
                  Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border(
                          top: BorderSide(width: 4, color: Color(0xffE3CAA5)),
                          left: BorderSide(width: 2, color: Color(0xffE3CAA5)),
                          right: BorderSide(width: 4, color: Color(0xffE3CAA5)),
                          bottom:
                              BorderSide(width: 4, color: Color(0xffE3CAA5)),
                        )),
                        child: Center(child: Text('담배몇개비필때마다한개비')),
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
