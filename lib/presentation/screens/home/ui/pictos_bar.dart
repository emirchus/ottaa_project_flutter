import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ottaa_project_flutter/application/common/app_images.dart';
import 'package:ottaa_project_flutter/application/providers/home_provider.dart';
import 'package:ottaa_project_flutter/application/theme/app_theme.dart';
import 'package:ottaa_project_flutter/core/models/picto_model.dart';
import 'package:ottaa_project_flutter/presentation/screens/home/ui/shortcuts_ui.dart';
import 'package:ottaa_project_flutter/presentation/screens/home/widgets/home_button.dart';
import 'package:picto_widget/picto_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PictosBarUI extends ConsumerStatefulWidget {
  const PictosBarUI({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PictosBarState();
}

class _PictosBarState extends ConsumerState<PictosBarUI> {
  @override
  Widget build(BuildContext context) {
    final pictos = ref.watch(homeProvider).getPictograms();

    final hasGroups = ref.watch(homeProvider).groups.isNotEmpty;

    final addPictogram = ref.read(homeProvider.select((value) => value.addPictogram));

    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: kIsWeb ? 8 : 2,
            child: Flex(
              direction: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 30),
                pictos.isEmpty
                    ? const Flexible(
                        fit: FlexFit.tight,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : buildWidgets(pictos, addPictogram: addPictogram),
                const SizedBox(width: 30),
                Flexible(
                  fit: FlexFit.tight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HomeButton(
                        size: Size.fromHeight((!sizingInformation.isMobile) ? 125 : 64),
                        onPressed: pictos.isEmpty && !hasGroups
                            ? null
                            : () {
                                ref.watch(homeProvider).switchToPictograms();
                              },
                        child: Image.asset(
                          AppImages.kSearchOrange,
                        ),
                      ),
                      const SizedBox(height: 16),
                      HomeButton(
                        size: Size.fromHeight((!sizingInformation.isMobile) ? 125 : 64),
                        onPressed: pictos.isEmpty && !hasGroups
                            ? null
                            : () {
                                ref.read(homeProvider).refreshPictograms();
                              },
                        child: Image.asset(
                          AppImages.kRefreshOrange,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Align(
              alignment: Alignment.center,
              child: ShortcutsUI(),
            ),
          ),
          const SizedBox(height: 10),
        ],
      );
    });
  }

  Flexible buildWidgets(
    List<Picto> pictos, {
    required void Function(Picto) addPictogram,
  }) {
    final size = MediaQuery.of(context).size;

    final maxWidth = max(size.width, size.height);
    final maxHeight = min(size.width, size.height);
    final translations = ref.watch(homeProvider.select((value) => value.pictosTranslations));

    return Flexible(
      flex: 5,
      fit: FlexFit.loose,
      child: GridView.builder(
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 1),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final e = pictos[index];

          switch (e.id) {
            case "-777":
              return FittedBox(
                fit: BoxFit.cover,
                child: Container(
                    width: 116,
                    height: 144,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(
                        color: Colors.grey.withOpacity(.12),
                        width: 1,
                      ),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    )),
              );
            case "777":
              return FittedBox(
                fit: BoxFit.cover,
                child: GestureDetector(
                  onTap: () {
                    //TODO: add pictogram
                  },
                  child: Container(
                    height: 119,
                    width: 96,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(
                        color: Colors.grey.withOpacity(.12),
                        width: 1,
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        size: 33,
                        color: kOTTAAOrange,
                      ),
                    ),
                  ),
                ),
              );
            default:
              return FittedBox(
                fit: BoxFit.cover,
                child: PictoWidget(
                  onTap: () {
                    addPictogram(e);
                  },
                  image: e.resource.network != null
                      ? CachedNetworkImage(
                          imageUrl: e.resource.network!,
                          fit: BoxFit.fill,
                          errorWidget: (context, url, error) => Image.asset(
                            fit: BoxFit.fill,
                            "assets/img/${e.text}.webp",
                          ),
                        )
                      : Image.asset(
                          fit: BoxFit.fill,
                          "assets/img/${e.text}.webp",
                        ),
                  text: translations[e.id] ?? e.text,
                  colorNumber: e.type,
                ),
              );
          }
        },
      ),
    );
  }
}
