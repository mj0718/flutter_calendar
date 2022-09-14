import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'health diary',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final CalendarController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
        titleTextStyle: TextStyle(color: Colors.white),

      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.all(8.0),
              child: TableCalendar(
                locale: 'ko-KR',
                calendarStyle: CalendarStyle(
                    todayColor: Colors.amber,
                    selectedColor: Theme.of(context).primaryColor,
                    todayStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 17.0,
                        color: Colors.white
                    )
                ),
                builders: CalendarBuilders(

                ),
                headerStyle: HeaderStyle(
                  decoration: BoxDecoration(
                      color: Colors.green
                  ),
                  headerMargin: const EdgeInsets.only(bottom: 8.0),
                  titleTextStyle: TextStyle(color: Colors.white),
                  centerHeaderTitle: true,
                  formatButtonDecoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  formatButtonTextStyle: TextStyle(
                      color: Colors.white
                  ),
                  leftChevronIcon: Icon(Icons.chevron_left,color: Colors.white,),
                  rightChevronIcon: Icon(Icons.chevron_right,color: Colors.white,)
                ),
                calendarController: _controller,)
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){

        },

      ),
    );
  }
}
