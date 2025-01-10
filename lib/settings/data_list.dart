import 'package:flutter/material.dart';
import '../models/profile_model.dart';
import '../models/sosmed_model.dart';

import '../models/project_model_link.dart';
import '../models/project_model.dart';

class DataList {
  ProfileModel getProfile() {
    return ProfileModel(
      name: "Dhimas Bagus Rizky Dewanto",
      description: [
        "Expert in Flutter development (kind of).",
        "Quiet knowledgeable in Android and iOS development.",
        "Usually used clean architecture.",
      ],
    );
  }

  List<SosmedModel> getSosmeds() {
    return [
      SosmedModel(
        iconName: "linkedin",
        name: "LinkedIn",
        link: "https://www.linkedin.com/in/dhimas-bagus-rizky-dewanto/",
      ),
      SosmedModel(
        iconName: "github",
        name: "GitHub",
        link: "https://github.com/dhimasdewanto",
      ),
    ];
  }

  List<ProjectModel> getProjects() {
    return [
      ProjectModel(
        title: "Activity Management System",
        description:
            "AMS is a powerful tool for insurance professional to manage your sales and recruiting activities under one intuitive application. It will help you to be able to focus and prioritize on the right activities which ultimately increase efficiency and drive better result.",
        projectType: "Flutter",
        images: List.generate(
          5,
          (index) => "assets/images/ams/$index.webp",
        ),
        links: [
          ProjectModelLink(
              linkTitle: "PlayStore",
              link:
                  "https://play.google.com/store/apps/details?id=id.co.tokiomarine_life.salesmanagementactivity"),
        ],
        appIcon: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            "assets/images/ams/icon.webp",
            height: 80,
            width: 80,
          ),
        ),
      ),
      ProjectModel(
        title: "Ditonton",
        description:
            "Ditonton is an application that displays a catalog of the most popular films with data from The Movie Database.",
        projectType: "Flutter + TDD + Modularization",
        images: List.generate(
          6,
          (index) => "assets/images/ditonton/$index.jpg",
        ),
        links: [
          ProjectModelLink(
              linkTitle: "GitHub",
              link:
                  "https://github.com/dhimasdewanto/dicoding_ditonton/tree/update_flutter_3.27"),
        ],
        appIcon: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xFF001D3D),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            "assets/images/ditonton/icon.png",
            height: 70,
            width: 70,
          ),
        ),
      ),
      ProjectModel(
        title: "RawgGames",
        description: "Game Database based on rawg.io",
        projectType: "SwiftUI + TDD + Modularization",
        images: List.generate(
          7,
          (index) => "assets/images/game_database/$index.png",
        ),
        links: [
          ProjectModelLink(
            linkTitle: "GitHub",
            link: "https://github.com/dhimasdewanto/RawgGamesV4",
          ),
        ],
        appIcon: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            "assets/images/game_database/icon.png",
            height: 80,
            width: 80,
          ),
        ),
      ),
      ProjectModel(
        title: "Comic Reader",
        description: "Read comic from format .cbz",
        projectType: "Flutter Desktop",
        images: List.generate(
          3,
          (index) => "assets/images/comic_reader/$index.png",
        ),
        links: [],
        appIcon: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            "assets/images/comic_reader/icon.png",
            height: 80,
            width: 80,
          ),
        ),
      ),
    ];
  }
}
