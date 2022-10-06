import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'local_widgets/build_app_bar.dart';
import 'settings_controller.dart';

class LanguagePage extends StatelessWidget {
  LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (_) => Scaffold(
        appBar: buildAppBar('language'.tr),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'language'.tr,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Divider(
                height: 10,
                color: Colors.grey[700],
              ),
              // SwitchListTile(
              //   activeColor: kOTTAAOrange,
              //   value: _.ttsController.isEnglish,
              //   onChanged: (bool value) {
              //     _.toggleLanguaje(value);
              //   },
              //   title: Text('language'.tr),
              //   subtitle: _.ttsController.isEnglish
              //       ? Text('English')
              //       : Text('Spanish'),
              // ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: DropdownButton<String>(
                  isExpanded: true,
                  // value: _.isEnglish.value ? 'English' : 'Spanish',
                  value: _.language.value,
                  iconSize: 20,
                  elevation: 16,
                  underline: Container(),
                  onChanged: (newValue) {
                    _.language.value = newValue!;
                    _.toggleLanguaje(newValue);
                  },
                  items: [
                    DropdownMenuItem(
                      child: Text('English'),
                      value: 'English',
                    ),
                    DropdownMenuItem(
                      child: Text('Spanish'),
                      value: 'Spanish',
                    ),
                    DropdownMenuItem(
                      child: Text('French'),
                      value: 'French',
                    ),
                    DropdownMenuItem(
                      child: Text('Portuguese'),
                      value: 'Portuguese',
                    ),
                  ],
                ),
              ),
              Divider(),
              SwitchListTile(
                value: false,
                onChanged: (value) {},
                title: Text('ottaa_labs'.tr),
                subtitle: Text('language_page_long_1'.tr),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
