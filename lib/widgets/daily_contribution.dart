import 'package:flutter/material.dart';
import 'package:phopes_cjw/utils.dart';

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

  @override
  Widget build(BuildContext context) {
    final String tooltipMessage =
        '$contribution ${contribution <= 1 ? 'lecture' : 'lectures'} on ${formatDateToString(date)}';

    final Color contribColor = _getContributionColor(contribution);

    return Center(
      child: Tooltip(
        message: tooltipMessage,
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
