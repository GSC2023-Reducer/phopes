import 'package:flutter/material.dart';
import 'package:phopes/widgets/daily_contribution.dart';

void main() {
  runApp(const App());
}

final List<Map> item = [
  {
    "contribution": 5,
    "date": DateTime.utc(2023, 1, 1),
  },
  {
    "contribution": 3,
    "date": DateTime.utc(2023, 1, 2),
  },
  {
    "contribution": 2,
    "date": DateTime.utc(2023, 1, 3),
  },
  {
    "contribution": 0,
    "date": DateTime.utc(2023, 1, 4),
  },
  {
    "contribution": 1,
    "date": DateTime.utc(2023, 1, 5),
  },
  {
    "contribution": 2,
    "date": DateTime.utc(2023, 1, 6),
  },
  {
    "contribution": 7,
    "date": DateTime.utc(2023, 1, 7),
  },
];

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 26,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Text(
                    "나의 공부기록",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                child: ListView.separated(
                  itemCount: item.length,
                  itemBuilder: (context, index) => DailyContribution(
                    contribution: item[index]["contribution"],
                    date: item[index]["date"],
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 26,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Text(
                    "수강 중인 목록",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  itemCount: 2,
                  itemBuilder: (context, index) => SizedBox(
                    height: 200,
                    width: 239,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(241, 241, 245, 1),
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 26,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Text(
                    "수강 완료 목록",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  itemCount: 2,
                  itemBuilder: (context, index) => SizedBox(
                    height: 200,
                    width: 239,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(241, 241, 245, 1),
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          )),
    );
  }
}
