import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ottaa_project_flutter/app/modules/home/home_controller.dart';
import 'package:ottaa_project_flutter/app/modules/home/local_widgets/right_column_widget.dart';
import 'package:ottaa_project_flutter/app/modules/home/local_widgets/actions_widget.dart';
import 'package:ottaa_project_flutter/app/modules/home/local_widgets/left_column_widget.dart';
import 'package:ottaa_project_flutter/app/modules/home/local_widgets/sentence_widget.dart';
import 'package:ottaa_project_flutter/app/modules/home/local_widgets/suggested_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double verticalSize = MediaQuery.of(context).size.height;
    // double horizontalSize = MediaQuery.of(context).size.width;

    return GetBuilder<HomeController>(
        id: "home",
        builder: (_) {
          return Scaffold(
            body: Column(
              //MAIN COLUMN
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // TOP ROW
                SentenceWidget(),
                Row(
                  // BODY ROW
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // LEFT COLUMN
                    LeftColumnWidget(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // BODY
                        SuggestedWidget(),
                        ActionsWidget(),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                    // RIGHT COLUMN
                    RightColumnWidget(),
                  ],
                )
                //SizedBox(height: 10),
              ],
            ),
            backgroundColor: Colors.black87,
          );
        });
  }
}