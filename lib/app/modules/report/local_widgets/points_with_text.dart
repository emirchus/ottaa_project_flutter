import 'package:flutter/material.dart';
import 'package:ottaa_project_flutter/application/common/extensions/translate_string.dart';

class PointsWithText extends StatelessWidget {
  const PointsWithText({
    Key? key,
    required this.boxColor,
    required this.textColor,
    required this.score,
  }) : super(key: key);
  final Color boxColor, textColor;
  final String score;

  @override
  Widget build(BuildContext context) {
    final verticalSize = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(
          verticalSize * 0.01,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            score,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w700,
              fontSize: verticalSize * 0.06,
            ),
          ),
          Text(
            'phrases_last_seven_days'.trl,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w400,
              fontSize: verticalSize * 0.02,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
