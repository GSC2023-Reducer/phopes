import 'package:flutter/material.dart';

class DailyContribution extends StatelessWidget {
  final int contribution;
  final DateTime date;

  const DailyContribution({
    super.key,
    required this.contribution,
    required this.date,
  });

  Color _getContributionColor(int contribution) {
    if (contribution >= ContributionLevels.level4) {
      return ContributionColors.level4;
    } else if (contribution >= ContributionLevels.level3) {
      return ContributionColors.level3;
    } else if (contribution >= ContributionLevels.level2) {
      return ContributionColors.level2;
    } else {
      return ContributionColors.level1;
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
    final Color contribColor = _getContributionColor(contribution);

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

class ContributionColors {
  static Color get level4 => const Color.fromRGBO(32, 121, 255, 1);
  static Color get level3 => const Color.fromRGBO(112, 164, 242, 1);
  static Color get level2 => const Color.fromRGBO(199, 214, 237, 1);
  static Color get level1 => const Color.fromRGBO(255, 255, 255, 1);
}

class ContributionLevels {
  static int get level4 => 5;
  static int get level3 => 3;
  static int get level2 => 1;
  static int get level1 => 0;
}
