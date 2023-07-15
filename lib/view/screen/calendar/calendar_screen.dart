import 'package:flutter/material.dart';
import 'package:i2connect/util/color_resources.dart';
import 'package:i2connect/util/custom_themes.dart';
import 'package:i2connect/provider/theme_provider.dart';
import 'package:i2connect/util/dimensions.dart';
import 'package:i2connect/util/images.dart';
import 'package:i2connect/view/basewidget/button/custom_button.dart';
import 'package:i2connect/view/basewidget/textfield/custom_password_textfield.dart';
import 'package:i2connect/view/basewidget/textfield/custom_textfield.dart';
import 'package:provider/provider.dart';
import 'package:i2connect/view/basewidget/custom_app_bar.dart';
import 'package:i2connect/view/screen/calendar/widgets/utils.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  CalendarScreenState createState() => CalendarScreenState();
}

class CalendarScreenState extends State<CalendarScreen> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SafeArea(
                child: CustomAppBar(
                  title: "Calendar",
                ),
              ),
              TableCalendar<Event>(
                firstDay: kFirstDay,
                lastDay: kLastDay,
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                rangeStartDay: _rangeStart,
                rangeEndDay: _rangeEnd,
                calendarFormat: _calendarFormat,
                rangeSelectionMode: _rangeSelectionMode,
                eventLoader: _getEventsForDay,
                startingDayOfWeek: StartingDayOfWeek.monday,
                headerStyle: HeaderStyle(
                    titleTextStyle: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF003585),
                        fontWeight: FontWeight.w800)),
                calendarStyle: CalendarStyle(
                  // Use `CalendarStyle` to customize the UI
                  outsideDaysVisible: false,
                  defaultTextStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: "ProximaNova",
                      fontWeight: FontWeight.w500),
                  todayDecoration: const BoxDecoration(
                    color: const Color(0xFF046A38),
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: const BoxDecoration(
                    color: const Color(0xFF046A38),
                    shape: BoxShape.circle,
                  ),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                      color: Color(0xFF003585),
                      fontFamily: "ProximaNova",
                      fontSize: 17,
                      fontWeight: FontWeight.w700),
                  weekendStyle: TextStyle(
                      color: Color(0xFF003585),
                      fontFamily: "ProximaNova",
                      fontSize: 17,
                      fontWeight: FontWeight.w700),
                ),
                daysOfWeekHeight: 22,
                onDaySelected: _onDaySelected,
                onRangeSelected: _onRangeSelected,
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              ),
              const SizedBox(height: 8.0),
              Expanded(
                child: ValueListenableBuilder<List<Event>>(
                  valueListenable: _selectedEvents,
                  builder: (context, value, _) {
                    final _data = _selectedEvents;
                    return SingleChildScrollView(child:ExpansionPanelList(
                      expandIconColor: Color(0xFF046A38),
                      expansionCallback: (int index, bool isExpanded) {
                        // setState(() {
                        //   _data[index].isExpanded = !isExpanded;
                        // });
                        setState(() {
                          _data.value[index].isExpanded = !isExpanded;
                        });
                      },
                      children: value.map<ExpansionPanel>((Event item) {
                        return ExpansionPanel(
                          headerBuilder: (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text(item.title, style: TextStyle(color: Color(0xFF484848),fontFamily: 'OpenSans', fontSize: 16, fontWeight: FontWeight.w700,), ),
                              iconColor: Color(0xFF046A38),
                            );
                          },

                          body: ListTile(
                              title: Text(item.title),
                              subtitle:
                              const Text('To delete this panel, tap the trash can icon'),
                              trailing: const Icon(Icons.delete),
                              onTap: () {
                                // setState(() {
                                //   _data.removeWhere((Item currentItem) => item == currentItem);
                                // });
                              }),
                          isExpanded: item.isExpanded,
                        );
                      }).toList(),
                    ));
                    // return ListView.builder(
                    //   itemCount: value.length,
                    //   itemBuilder: (context, index) {
                    //     return Container(
                    //       margin: const EdgeInsets.symmetric(
                    //         horizontal: 12.0,
                    //         vertical: 4.0,
                    //       ),
                    //       decoration: BoxDecoration(
                    //         border: Border.all(),
                    //         borderRadius: BorderRadius.circular(12.0),
                    //       ),
                    //       child: ListTile(
                    //         onTap: () => print('${value[index]}'),
                    //         title: Text('${value[index]}'),
                    //       ),
                    //     );
                    //   },
                    // );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
