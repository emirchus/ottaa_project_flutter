import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ottaa_project_flutter/application/common/app_images.dart';
import 'package:ottaa_project_flutter/application/common/extensions/translate_string.dart';
import 'package:ottaa_project_flutter/application/theme/app_theme.dart';
import 'package:ottaa_project_flutter/presentation/common/widgets/simple_button.dart';

class FourthStep extends StatelessWidget {
  final PageController controller;

  const FourthStep({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    double verticalSize = MediaQuery.of(context).size.height;
    double horizontalSize = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.grey.withOpacity(0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(),
          ),
          Container(
            height: verticalSize * 0.45,
            width: horizontalSize * 0.25,
            child: Image.asset(
              AppImages.kStep4Tutorial,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                height: horizontalSize * 0.05,
                child: FittedBox(
                  child: Text(
                    "Play_and_learn".trl,
                    style: const TextStyle(
                        color: kOTTAAOrangeNew, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalSize * 0.2),
                child: Text(
                  "${'Step4_long'.trl}!.",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20, color: Colors.black87),
                  maxLines: 3,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SimpleButton(
                text: "Previous".trl,
                leading: Icons.chevron_left,
                onTap: () => controller.animateToPage(
                  2,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
                backgroundColor: Colors.white,
                fontColor: Colors.grey,
              ),
              SimpleButton(
                text: "Ready".trl,
                trailing: Icons.chevron_right,
                onTap: () => context.pop(),
                backgroundColor: kOTTAAOrangeNew,
                fontColor: Colors.white,
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
