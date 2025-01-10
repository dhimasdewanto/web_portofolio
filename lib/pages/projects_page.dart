import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/project_model.dart';
import '../widgets/image_background.dart';
import '../widgets/image_ss_widget.dart';
import '../widgets/text_pressable_dough.dart';
import '../widgets/unique_button.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({
    super.key,
    required this.listProjects,
  });

  final List<ProjectModel> listProjects;

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

        /// Disable color change on scroll.
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        title: MouseRegion(
          cursor: SystemMouseCursors.text,
          child: TextPressableDough(
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
            padding: const EdgeInsets.all(30),
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
                          Wrap(
                            spacing: 15,
                            runSpacing: 10,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              /// App title.
                              TextPressableDough(
                                child: Text(
                                  project.title,
                                  style: textTheme.displaySmall,
                                ),
                              ),

                              /// Project type
                              Text(
                                project.projectType,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
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

                          /// App description.
                          TextPressableDough(
                            child: Text(
                              project.description,
                              style: textTheme.titleMedium,
                            ),
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
                          return ImageSsWidget(imageLink: img);
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
