import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ottaa_project_flutter/application/common/app_images.dart';
import 'package:ottaa_project_flutter/application/common/extensions/translate_string.dart';
import 'package:ottaa_project_flutter/application/providers/create_picto_provider.dart';
import 'package:ottaa_project_flutter/application/providers/view_board_provider.dart';
import 'package:ottaa_project_flutter/application/router/app_routes.dart';
import 'package:ottaa_ui_kit/widgets.dart';

class BoardScreen extends ConsumerWidget {
  const BoardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(viewBoardProvider);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: provider.boards.length + 1,
        padding: const EdgeInsets.only(bottom: 16),
        itemBuilder: (context, index) {
          if (provider.boards.length == index) {
            return GestureDetector(
              onTap: () async {
                final pro = ref.read(createPictoProvider);
                pro.init(userId: provider.userID);
                pro.resetCreateBoardScreen();
                context.push(AppRoutes.patientCreateBoard);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppImages.kAddIcon,
                      height: 80,
                      width: 80,
                    ),
                    Text(
                      'create.new_board'.trl,
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Container(
              decoration: provider.selectedBoardID == index
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: colorScheme.primary, width: 2),
                    )
                  : const BoxDecoration(),
              child: PictogramCard(
                title: provider.boards[index].text.toUpperCase(),
                actionText: "customize.board.subtitle".trl,
                pictogram: CachedNetworkImageProvider(
                  provider.boards[index].resource.network!,
                ),
                status: !provider.boards[index].block,
                onPressed: () async {
                  provider.selectedBoardID = index;
                  await provider.fetchDesiredPictos();
                  context.push(AppRoutes.patientShowPictos);
                },
                onChange: (bool a) {
                  provider.boards[index].block = !provider.boards[index].block;
                  provider.notify();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
