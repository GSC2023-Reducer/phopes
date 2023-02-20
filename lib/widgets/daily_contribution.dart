import 'package:flutter/material.dart';

class DailyContribution extends StatelessWidget {
  final int contribution;
  final DateTime date;

  const DailyContribution({
    super.key,
    required this.contribution,
    required this.date,
  });

  Color _getContribColor(int contribution) {
    const int level4Standard = 5;
    const int level3Standard = 3;
    const int level2Standard = 1;

    const Color level4Contribution = Color.fromRGBO(32, 121, 255, 1);
    const Color level3Contribution = Color.fromRGBO(112, 164, 242, 1);
    const Color level2Contribution = Color.fromRGBO(199, 214, 237, 1);
    const Color level1Contribution = Color.fromRGBO(255, 255, 255, 1);

    if (contribution >= level4Standard) {
      return level4Contribution;
    } else if (contribution >= level3Standard) {
      return level3Contribution;
    } else if (contribution >= level2Standard) {
      return level2Contribution;
    } else {
      return level1Contribution;
    }
  }

  String _getFormattedDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  String _getLectureLabel(int contribution) =>
      contribution <= 1 ? 'lecture' : 'lectures';

  @override
  Widget build(BuildContext context) {
    final String formattedDate = _getFormattedDate(date);
    final String lectureLabel = _getLectureLabel(contribution);
    final Color contribColor = _getContribColor(contribution);

    return Center(
      child: Tooltip(
        message: "$contribution $lectureLabel in $formattedDate",
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: contribColor,
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
