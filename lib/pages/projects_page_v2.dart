import 'package:dough/dough.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../settings/app_settings.dart';
import '../settings/projects_list.dart';
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
    final listProjects = ProjectsList().getList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        /// Disable color change on scroll.
        surfaceTintColor: Colors.transparent,
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
          ListView.separated(
            padding: const EdgeInsets.all(AppSettings.padding),
            itemCount: listProjects.length,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 50);
            },
            itemBuilder: (context, index) {
              final project = listProjects[index];
              return Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Wrap: Like row, with autowrap to new line.
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      /// App icon
                      project.appIcon,
                      Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project.title,
                            style: textTheme.displaySmall,
                          ),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              /// App title.
                              Text(
                                project.description,
                                style: textTheme.titleMedium,
                              ),

                              /// Button links.
                              ...project.links.map(
                                (link) => UniqueButton(
                                  text: link.linkTitle,
                                  onPressed: () => _lauchUrl(link.link),
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
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  /// Image showcase.
                  SizedBox(
                    height: 500,
                    child: ScrollConfiguration(
                      behavior: TouchAndMouseScrollBehavior(),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: project.images.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 20);
                        },
                        itemBuilder: (context, index) {
                          final img = project.images[index];
                          return InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (context) {
                                  return Dialog(
                                    child: Image.asset(img),
                                  );
                                },
                              );
                            },
                            child: Image.asset(
                              img,
                              height: 500,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
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
