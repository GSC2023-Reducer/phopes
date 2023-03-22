import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class SelectDatePage extends StatefulWidget {
  const SelectDatePage({super.key});

  @override
  State<StatefulWidget> createState() => _SelectDatePage();
}

class _SelectDatePage extends State<SelectDatePage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? selectedDay;

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
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: const Color(0xffFFFFFF),
              centerTitle: true,
              title: const Text("날짜 선택",
                  style: TextStyle(
                      fontFamily: 'NotoSansCJKKR',
                      fontWeight: FontWeight.w700,
                      color: Color(0xff191919),
                      fontSize: 20)),
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back_outlined),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: const Color(0xff191919)),
            ),
            body: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(15, 20, 0, 0),
                  alignment: Alignment.topLeft,
                  child: Text("일정 선택",
                      style: TextStyle(
                          fontFamily: 'NotoSansCJKKR',
                          fontWeight: FontWeight.w700,
                          color: Color(0xff191919),
                          fontSize: 18)),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 10, 0, 20),
                  alignment: Alignment.topLeft,
                  child: Text(
                      _rangeStart == null || _rangeEnd == null
                          ? "날짜를 선택해주세요"
                          : DateFormat('yyyy-MM-dd').format(_rangeStart!) +
                              "~" +
                              DateFormat('yyyy-MM-dd').format(_rangeEnd!),
                      style: TextStyle(
                          fontFamily: 'NotoSansCJKKR',
                          fontWeight: FontWeight.w500,
                          color: Color(0xff999999),
                          fontSize: 15)),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 12, // number of months to show
                    itemBuilder: (context, index) {
                      final dateNow = DateTime.now();
                      final firstDay =
                          DateTime(dateNow.year, dateNow.month + index, 1);
                      final lastDay =
                          DateTime(dateNow.year, dateNow.month + index + 1, 0);

                      return TableCalendar(
                        calendarStyle: const CalendarStyle(
                          rangeHighlightScale: 1.0,
                          rangeHighlightColor: Color(0x70A4F2),
                          rangeStartTextStyle: TextStyle(
                            color: Color(0xFFFAFAFA),
                            fontSize: 16.0,
                          ),
                          rangeStartDecoration: BoxDecoration(
                            color: Color(0xFF6699FF),
                            shape: BoxShape.circle,
                          ),
                          rangeEndTextStyle: TextStyle(
                            color: Color(0xFFFAFAFA),
                            fontSize: 16.0,
                          ),
                          rangeEndDecoration: BoxDecoration(
                            color: Color(0xFF6699FF),
                            shape: BoxShape.circle,
                          ),
                          withinRangeTextStyle: TextStyle(),
                          withinRangeDecoration:
                              BoxDecoration(shape: BoxShape.circle),
                        ),
                        locale: 'ko_KR',
                        headerStyle: const HeaderStyle(
                          titleTextStyle: TextStyle(
                            fontFamily: 'NotoSansCJKKR',
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                          headerPadding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 15),
                          formatButtonVisible: false,
                          leftChevronVisible: false,
                          rightChevronVisible: false,
                        ),
                        availableGestures: AvailableGestures.none,
                        firstDay: firstDay,
                        lastDay: lastDay,
                        focusedDay: firstDay,
                        selectedDayPredicate: (day) {
                          return isSameDay(_selectedDay, day);
                        },
                        rangeStartDay: _rangeStart,
                        rangeEndDay: _rangeEnd,
                        rangeSelectionMode: _rangeSelectionMode,
                        onDaySelected: _onDaySelected,
                        onRangeSelected: _onRangeSelected,
                      );
                    },
                  ),
                )
              ],
            )));
  }
}
