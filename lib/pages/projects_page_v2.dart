import 'package:dough/dough.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../settings/app_settings.dart';
import '../widgets/image_background.dart';
import '../widgets/unique_button.dart';

class ProjectsPageV2 extends StatelessWidget {
  const ProjectsPageV2({super.key});

  Future<void> _lauchUrl(String website) async {
    final url = Uri.parse(website);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final textColor = textTheme.bodyMedium?.color;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: false,
        title: MouseRegion(
          cursor: SystemMouseCursors.text,
          child: PressableDough(
            child: Text(
              "Back to Profile",
              style: TextStyle(
                color: textColor,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          const ImageBackground(
            alignment: Alignment.center,
          ),
          ListView(
            padding: const EdgeInsets.all(AppSettings.padding),
            children: [
              Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Wrap: Like row, with autowrap to new line.
                  Wrap(
                    spacing: 20,
                    children: [
                      /// App Icon
                      Image.network(
                        "https://avatars2.githubusercontent.com/u/30433066?s=400&v=4",
                        height: 80,
                        width: 80,
                      ),
                      Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ASCII Image Converter",
                            style: textTheme.displaySmall,
                          ),
                          Wrap(
                            spacing: 20,
                            children: [
                              Text(
                                "Convert your image to ASCII format.",
                                style: textTheme.titleMedium,
                              ),
                              Text(
                                "Convert your image to ASCII format.",
                                style: textTheme.titleMedium,
                              ),
                              UniqueButton(
                                text: "Play Store",
                                onPressed: () => _lauchUrl(
                                    "https://github.com/dhimasdewanto/convert_image_to_ascii"),
                                textStyle: textTheme.bodyMedium,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 3,
                                ),
                                onHoverPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 3,
                                ),
                              ),
                              UniqueButton(
                                text: "GitHub",
                                onPressed: () => _lauchUrl(
                                    "https://github.com/dhimasdewanto/convert_image_to_ascii"),
                                textStyle: textTheme.bodyMedium,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 3,
                                ),
                                onHoverPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 3,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 500,
                    child: ScrollConfiguration(
                      behavior: TouchAndMouseScrollBehavior(),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (context) {
                                  return Dialog(
                                    child: Image.asset(
                                      "assets/images/project_image_1.webp",
                                    ),
                                  );
                                },
                              );
                            },
                            child: Image.asset(
                              "assets/images/project_image_1.webp",
                              height: 500,
                            ),
                          ),
                          SizedBox(width: 20),
                          Image.asset(
                            "assets/images/project_image_1.webp",
                            height: 500,
                          ),
                          SizedBox(width: 20),
                          Image.asset(
                            "assets/images/project_image_1.webp",
                            height: 500,
                          ),
                          SizedBox(width: 20),
                          Image.asset(
                            "assets/images/project_image_1.webp",
                            height: 500,
                          ),
                          SizedBox(width: 20),
                          Image.asset(
                            "assets/images/project_image_1.webp",
                            height: 500,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TouchAndMouseScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
