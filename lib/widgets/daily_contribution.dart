import 'package:flutter/material.dart';

class DailyContribution extends StatelessWidget {
  final int contribution;
  final DateTime date;

  const DailyContribution({
    super.key,
    required this.contribution,
    required this.date,
  });

  Color getContribColor(int contrib) {
    if (contrib > 4) {
      return const Color.fromRGBO(32, 121, 255, 1);
    } else if (contrib > 2) {
      return const Color.fromRGBO(112, 164, 242, 1);
    } else if (contrib > 0) {
      return const Color.fromRGBO(199, 214, 237, 1);
    } else {
      return const Color.fromRGBO(255, 255, 255, 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Tooltip(
        message:
            "$contribution lectures in ${date.year}-${date.month}-${date.day}",
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: getContribColor(contribution),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                blurRadius: 3,
                offset: Offset(0, 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
