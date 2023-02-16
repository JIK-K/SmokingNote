import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/Patience.dart';
import 'package:table_calendar/table_calendar.dart';

import 'main.dart';

class Statistics extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<Statistics> {
  var patience = Patience();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text(
          '통계',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xffAD8B73),
      ),
      body: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 4, color: Color(0xffE3CAA5))),
        child: Column(
          children: [
            Flexible(
                flex: 3,
                child: Container(
                    child: TableCalendar(
                  locale: 'ko_KR',
                  firstDay: DateTime.utc(2000, 01, 01),
                  lastDay: DateTime.utc(2050, 01, 01),
                  focusedDay: DateTime.now(),
                  headerStyle: HeaderStyle(
                    titleCentered: true,
                    titleTextFormatter: (date, locale) =>
                        DateFormat.yMMMM(locale).format(date),
                    formatButtonVisible: false,
                    titleTextStyle: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                    headerPadding: const EdgeInsets.symmetric(vertical: 4.0),
                    leftChevronIcon: const Icon(
                      Icons.arrow_left,
                      size: 40.0,
                    ),
                    rightChevronIcon: const Icon(
                      Icons.arrow_right,
                      size: 40.0,
                    ),
                  ),
                  calendarStyle: CalendarStyle(
                      outsideDaysVisible: true,
                      weekendTextStyle: TextStyle().copyWith(color: Colors.red),
                      holidayTextStyle: TextStyle().copyWith(color: Colors.red),
                      isTodayHighlighted: false,
                      markerSize: 30,
                      markersAlignment: Alignment.bottomRight,
                      markerDecoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/loser.png")),
                      )),
                ))),
            Flexible(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                        color: Color(0xffAD8B73),
                        child: Center(
                          child: Text("누적 개수",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ))),
                Flexible(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  child: Text("운동"),
                                ),
                                Container(
                                    child: CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.indigo,
                                  child: Text(patience.totalHealth.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                )),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  child: Text("음주"),
                                ),
                                Container(
                                    child: CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.orangeAccent,
                                  child: Text(patience.totalAlcohol.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                )),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  child: Text("흡연"),
                                ),
                                Container(
                                    child: CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.redAccent,
                                  child: Text(patience.totalSmoking.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            )),
            // Flexible(child: TableCa)
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: SizedBox(
        height: 70,
        child: IconButtonList(),
      )),
    );
  }
}
