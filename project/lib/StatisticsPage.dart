import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'main.dart';

class Statistics extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<Statistics> {
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
        padding: EdgeInsets.all(5),
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
                  ),
                ))),
            Flexible(
                child: Container(
              color: Color(0xff917551),
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
