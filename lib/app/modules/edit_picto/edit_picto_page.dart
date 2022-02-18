import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ottaa_project_flutter/app/data/models/search_model.dart';
import 'package:ottaa_project_flutter/app/global_controllers/tts_controller.dart';
import 'package:ottaa_project_flutter/app/modules/edit_picto/edit_picto_controller.dart';
import 'package:ottaa_project_flutter/app/modules/edit_picto/local_widgets/frame_color_widget.dart';
import 'package:ottaa_project_flutter/app/modules/edit_picto/local_widgets/tags_widget.dart';
import 'package:ottaa_project_flutter/app/modules/edit_picto/local_widgets/text_widget.dart';
import 'package:ottaa_project_flutter/app/modules/edit_picto/right_column_widget.dart';
import 'package:ottaa_project_flutter/app/modules/pictogram_groups/local_widgets/category_widget.dart';
import 'package:ottaa_project_flutter/app/theme/app_theme.dart';
import 'package:get/get.dart';

import 'local_widgets/search_photo_page.dart';

class EditPictoPage extends GetView<EditPictoController> {
  EditPictoPage({Key? key}) : super(key: key);
  final _ttsController = Get.find<TTSController>();

  @override
  Widget build(BuildContext context) {
    Future<bool> _willPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: Text('Important'),
              content: Text('Do you want to save changes'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text('No'),
                ),
                TextButton(
                  onPressed: () async =>
                      controller.uploadChanges(context: context),
                  child: Text('Yes'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('Go Back'),
                ),
              ],
            ),
          )) ??
          false;
    }

    final languaje = _ttsController.languaje;
    // final height = Get.height;
    final width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: _willPop,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: kOTTAOrangeNew,
          foregroundColor: Colors.white,
          elevation: 0,
          title: Text('edit_pictogram'.tr),
        ),
        body: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 8,
              child: Container(
                height: Get.height,
                color: Colors.black,
                padding: EdgeInsets.all(width * 0.01),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(width * 0.01),
                        child: Obx(
                          () => InkWell(
                            onTap: () {
                              showDialog(
                                barrierDismissible: true,
                                context: context,
                                builder: (context) => PictureDialogWidget(),
                              );
                            },
                            child: CategoryWidget(
                              name: languaje == 'en'
                                  ? controller.pict.value!.texto.en
                                  : controller.pict.value!.texto.es,
                              imageName: controller.pict.value!.imagen.picto,
                              border: controller.pictoBorder.value,
                              color: controller.pict.value!.tipo,
                              bottom: false,
                              isEditing: controller.editingPicture.value,
                              fileImage: controller.fileImage.value,
                              imageWidget: controller.imageWidget.value,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(width * 0.01),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(width * 0.01),
                          ),
                          child: Obx(
                            () => controller.text.value
                                ? TextWidget()
                                : controller.frame.value
                                    ? FrameColorWidget()
                                    : controller.tags.value
                                        ? TagsWidget()
                                        : Container(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            RightColumnWidget(),
          ],
        ),
      ),
    );
  }
}

class PictureDialogWidget extends GetView<EditPictoController> {
  const PictureDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double verticalSize = MediaQuery.of(context).size.height;
    double horizontalSize = MediaQuery.of(context).size.width;
    return AlertDialog(
      clipBehavior: Clip.antiAlias,
      contentPadding: const EdgeInsets.all(0),
      backgroundColor: Colors.transparent,
      content: Container(
        width: horizontalSize * 0.4,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(verticalSize * 0.03),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: verticalSize * 0.01),
              width: double.infinity,
              decoration: BoxDecoration(
                color: kOTTAOrangeNew,
              ),
              child: Center(
                child: Text(
                  'Choose an option',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalSize * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImageWidget(
                    imageLink: 'assets/camera.png',
                    text: 'Camera',
                    onTap: controller.cameraFunction,
                  ),
                  ImageWidget(
                    imageLink: 'assets/gallery.png',
                    text: 'Gallery',
                    onTap: controller.galleryFunction,
                  ),
                  ImageWidget(
                    imageLink: 'assets/download_from_arasaac.png',
                    text: 'Download from ARASAAC',
                    onTap: () async {
                      var result = await showSearch<SearchModel?>(
                        context: context,
                        delegate: SearchPhotoPage(),
                      );
                      print(result);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.imageLink,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final String imageLink;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    double verticalSize = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imageLink,
            height: verticalSize * 0.15,
          ),
          SizedBox(
            height: verticalSize * 0.01,
          ),
          Text(
            text,
          ),
        ],
      ),
    );
  }
}
