import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../controllers/copy_text_state.dart';
import '../main.dart';
import '../settings/app_settings.dart';
import '../utils/json_profile_sosmed.dart';
import '../widgets/image_background.dart';
import '../widgets/profile_widget.dart';
import '../widgets/sosmed_widget.dart';
import '../widgets/unique_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: JsonProfileSosmed(context).getJsonFile(),
        builder: (context, snapshot) {
          final profileSosmed = snapshot.data;
          if (profileSosmed == null) {
            return const SizedBox();
          }

          return Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    const ImageBackground(
                      alignment: Alignment.centerRight,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppSettings.padding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ProfileWidget(
                            profile: profileSosmed.profile,
                          ),
                          const SizedBox(height: AppSettings.padding),
                          SosmedWidget(
                            listSosmeds: profileSosmed.listSosmeds,
                          ),
                          const SizedBox(height: AppSettings.padding),
                          UniqueButton(
                            text: 'My Projects',
                            onPressed: () {
                              context.push(goProjects);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: AppSettings.paddingSmall,
                  right: AppSettings.padding,
                  left: AppSettings.padding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Switch(
                      value: CopyTextState.of(context).isCopy,
                      activeTrackColor: Colors.yellow.shade800,
                      activeColor: Colors.black,
                      inactiveThumbColor: Colors.yellow.shade800,
                      onChanged: CopyTextState.of(context).onChange,
                    ),
                    Text(
                      "Copy text",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(width: AppSettings.padding),
                    Switch(
                      value: true,
                      activeTrackColor: Colors.yellow.shade800,
                      activeColor: Colors.black,
                      inactiveThumbColor: Colors.yellow.shade800,
                      onChanged: (value) {},
                    ),
                    Text(
                      "Indonesia",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
