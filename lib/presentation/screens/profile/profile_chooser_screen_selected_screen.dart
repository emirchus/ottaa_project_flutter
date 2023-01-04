import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ottaa_project_flutter/application/common/app_images.dart';
import 'package:ottaa_project_flutter/application/common/extensions/translate_string.dart';
import 'package:ottaa_project_flutter/application/providers/profile_provider.dart';
import 'package:ottaa_project_flutter/presentation/screens/profile/ui/profile_chooser_button_widget.dart';
import 'package:ottaa_ui_kit/widgets.dart';

class ProfileChooserScreenSelected extends ConsumerWidget {
  const ProfileChooserScreenSelected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final provider = ref.watch(profileProvider);
    return Scaffold(
      appBar: OTTAAAppBar(
        title: Text("profile.role".trl),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 24,
                    ),
                    child: Text(
                      "onboarding.profile.subtitle".trl,
                      style: textTheme.button!
                          .copyWith(color: colorScheme.onBackground),
                    ),
                  ),
                  ProfileChooserButtonWidget(
                    heading: 'profile.caregiver'.trl,
                    subtitle: 'profile.caregivers_families'.trl,
                    imagePath: AppImages.kProfileIcon1,
                    onTap: () => provider.isCaregiver = !provider.isCaregiver,
                    selected: provider.isCaregiver,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ProfileChooserButtonWidget(
                    heading: 'profile.user'.trl,
                    subtitle: 'profile.user_description'.trl,
                    imagePath: AppImages.kProfileIcon2,
                    onTap: () => provider.isCaregiver = !provider.isCaregiver,
                    selected: !provider.isCaregiver,
                  ),
                ],
              ),
              const Spacer(),
              PrimaryButton(
                //todo: add the proper way for handling the waiting screen, hector said is should be their for 4 seconds at least
                onPressed: () {
                  print(provider.isCaregiver);
                  provider.notify();
                  context.pop();
                },
                enabled: false,
                text: "global.save_changes".trl,
              ),
              const SizedBox(
                height: 48,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
