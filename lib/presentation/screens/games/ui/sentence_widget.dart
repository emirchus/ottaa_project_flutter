import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ottaa_project_flutter/application/common/app_images.dart';
import 'package:ottaa_project_flutter/application/common/extensions/translate_string.dart';
import 'package:ottaa_project_flutter/application/providers/chat_gpt_game_provider.dart';
import 'package:ottaa_project_flutter/application/router/app_routes.dart';
import 'package:picto_widget/picto_widget.dart';

class SentenceWidget extends ConsumerWidget {
  const SentenceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(chatGptGameProvider);
    final size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        width: size.width,
        height: size.height * 0.4,
        child: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...provider.gptPictos
                  .map(
                    (e) => Container(
                      width: size.height * 0.2,
                      height: size.height * 0.25,
                      padding: const EdgeInsets.only(left: 24),
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: PictoWidget(
                          onTap: () {},
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
                          text: e.text,
                          colorNumber: e.type,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              const SizedBox(
                width: 24,
              ),
              provider.gptPictos.length == 4
                  ? const SizedBox.shrink()
                  : SizedBox(
                      width: size.height * 0.2,
                      height: size.height * 0.25,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: PictoWidget(
                          image: Image.asset(AppImages.kAddIcon),
                          onTap: () async {
                            print(provider.sentencePhase);
                            switch (provider.sentencePhase) {
                              ///using the same screen with different values
                              case 0:
                                provider.gptBoards.clear();
                                provider.gptBoards.addAll(provider.nounBoards);
                                print(provider.nounBoards.last);
                                provider.notify();
                                break;
                              case 1:
                                provider.gptBoards.clear();
                                provider.gptBoards.addAll(provider.modifierBoards);
                                provider.notify();
                                break;
                              case 2:
                                provider.gptBoards.clear();
                                provider.gptBoards.addAll(provider.actionBoards);
                                provider.gptBoards = provider.actionBoards;
                                provider.notify();
                                break;
                              case 3:
                                provider.gptBoards.clear();
                                provider.gptBoards.addAll(provider.placeBoards);
                                provider.gptBoards = provider.placeBoards;
                                provider.notify();
                                break;
                            }
                            context.push(AppRoutes.selectBoardPicto);
                          },
                          text: 'global.add'.trl,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
