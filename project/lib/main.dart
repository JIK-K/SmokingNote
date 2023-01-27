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
          fontFamily: 'SCDreams',
        ),
        home: Scaffold(
          //Top
          appBar: AppBar(
            centerTitle: true,
            elevation: 0.0,
            title: Text(
              '금연노트',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Color(0xffE6DDC4),
          ),

          //Body
          body: Column(
            children: [
              Flexible(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(
                      width: 5,
                      color: Colors.black,
                    )),
                  )),
              Flexible(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(
                      width: 5,
                      color: Colors.yellow,
                    )),
                  )),
              Flexible(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                    width: 5,
                    color: Colors.blue,
                  )),
                ),
              ),
              Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(
                      width: 5,
                      color: Colors.redAccent,
                    )),
                  )),
              Flexible(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(
                      width: 5,
                      color: Colors.teal,
                    )),
                  )),
              Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(
                      width: 5,
                      color: Colors.lightGreen,
                    )),
                    child: Row(
                      children: [
                        Flexible(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                width: 3,
                                color: Colors.lightGreen,
                              )),
                            )),
                        Flexible(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                width: 3,
                                color: Colors.lightGreen,
                              )),
                            )),
                        Flexible(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                width: 3,
                                color: Colors.lightGreen,
                              )),
                            ))
                      ],
                    ),
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
