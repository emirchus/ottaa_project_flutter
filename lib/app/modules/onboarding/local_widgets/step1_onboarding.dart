import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ottaa_project_flutter/app/global_widgets/step_button.dart';
import 'package:ottaa_project_flutter/app/theme/app_theme.dart';

import '../onboarding_controller.dart';
import 'header_wave.dart';

step1Onboarding<widget>(
    OnboardingController _, PageController controller, context) {
  double verticalSize = MediaQuery.of(context).size.height;
  double horizontalSize = MediaQuery.of(context).size.width;
  return Stack(
    children: [
      FadeInLeft(child: HeaderWave(color: kOTTAOrange)),
      Positioned(
        bottom: 0,
        left: horizontalSize * 0.05,
        child: JelloIn(
          child: SvgPicture.asset(
            'assets/3 people.svg',
            width: horizontalSize * 0.43,
            placeholderBuilder: (BuildContext context) =>
                Container(child: const CircularProgressIndicator()),
          ),
        ),
      ),
      Positioned(
        right: horizontalSize * 0.05,
        bottom: verticalSize * 0.10,
        child: Container(
          width: horizontalSize * 0.35,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StepButton(
                text: "Anterior",
                leading: Icons.chevron_left,
                onTap: () => _.authController.handleSignOut(),
                backgroundColor: Colors.grey,
                fontColor: Colors.white,
              ),
              StepButton(
                text: "Siguiente",
                trailing: Icons.chevron_right,
                onTap: () => controller.animateToPage(1,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut),
                backgroundColor: kOTTAOrange,
                fontColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
      Positioned(
        right: horizontalSize * 0.05,
        top: verticalSize * 0.012,
        child: FadeInUp(
          child: Center(
              child: Column(
            children: [
              Container(
                  width: horizontalSize * 0.35,
                  height: verticalSize * 0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage('assets/imgs/logo_ottaa.webp')),
                      Text("Gracias por elegir OTTAA PROJECT"),
                      Form(
                        key: _.formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _.nameController,
                              decoration: InputDecoration(hintText: "Nombre"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: _.genderController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(hintText: "Genero"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            )
                          ],
                        ),
                      ),
                      Text("Fecha de Nacimiento"),
                    ],
                  )),
            ],
          )),
        ),
      ),
      Positioned(
          top: verticalSize * 0.045,
          left: horizontalSize * 0.025,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: horizontalSize * 0.45,
                child: FittedBox(
                  child: Text('Vamos a conocernos primero!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              Container(
                width: horizontalSize * 0.45,
                child: AutoSizeText(
                  'Vamos a recolectar algunos datos para conocerte mejor',
                  style: TextStyle(color: Colors.white),
                  maxLines: 2,
                ),
              ),
            ],
          ))
    ],
  );
}