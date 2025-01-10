import 'package:flutter/material.dart';

import '../models/project_model_link.dart';
import '../models/project_model_v2.dart';

class ProjectsList {
  List<ProjectModelV2> getList() {
    return [
      ProjectModelV2(
        title: "Ditonton",
        description:
            "Ditonton is an application that displays a catalog of the most popular films with data from The Movie Database.",
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
          child: Image.network(
            "assets/images/ditonton/icon.png",
            height: 70,
            width: 70,
          ),
        ),
      ),
      ProjectModelV2(
        title: "RawgGames",
        description: "Game Database based on rawg.io",
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
          child: Image.network(
            "assets/images/game_database/icon.png",
            height: 80,
            width: 80,
          ),
        ),
      ),
    ];
  }
}
