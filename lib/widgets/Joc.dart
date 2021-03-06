// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_string_interpolations, non_constant_identifier_names

import 'dart:convert';
import 'package:projecte/main.dart';
import 'package:http/http.dart' as http;

class Joc {
  List<Screenshots>? screenshots;
  List<Platforms>? platform;
  List<Genres>? genre;
  bool? tba;
  String name;
  String? slug, released, background_image;
  int? metacritic;

  Joc(this.name, this.genre, this.slug, this.background_image, this.released,
      this.metacritic, this.platform, this.screenshots, this.tba);

  Joc.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        slug = json["slug"],
        tba = json["tba"],
        genre =
            (json["genres"] as List).map((i) => Genres.fromJson(i)).toList(),
        background_image = json["background_image"],
        released = json["released"],
        screenshots = (json["short_screenshots"] as List)
            .map((i) => Screenshots.fromJson(i))
            .toList(),
        metacritic = json["metacritic"],
        platform = (json["parent_platforms"] as List)
            .map((i) => Platforms.fromJson(i))
            .toList();

  Map<String, dynamic> toMap() {
    Map<String, dynamic> toReturn = {};
    toReturn['name'] = name;
    toReturn['slug'] = slug;
    toReturn['tba'] = tba;
    toReturn['released'] = released;
    toReturn['metacritic'] = metacritic;
    toReturn['background_image'] = background_image;
    return toReturn;
  }

  Joc.fromMap(Map<dynamic, dynamic> document)
      : name = document['name'],
        slug = document['slug'],
        tba = document['tba'],
        released = document['released'],
        metacritic = document['metacritic'],
        background_image = document['background_image'],
        screenshots = null,
        platform = null,
        genre = null;
}

Future<List<Joc>> loadlastGames() async {
  final uri = Uri(
    scheme: "https",
    host: "api.rawg.io",
    path: "/api/games",
    queryParameters: {
      'key': API_KEY,
      'dates': "2021-01-01,2021-12-31",
    },
  );
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  List jocs = json["results"];
  return jocs.map((jsonJoc) => Joc.fromJson(jsonJoc)).toList();
}

Future<List<Joc>> loadnextGames() async {
  final uri = Uri(
    scheme: "https",
    host: "api.rawg.io",
    path: "/api/games",
    queryParameters: {
      'key': API_KEY,
      'dates': "2022-01-01,2022-12-31",
    },
  );
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  List jocs = json["results"];
  return jocs.map((jsonJoc) => Joc.fromJson(jsonJoc)).toList();
}

Future<List<Joc>> loadNintendoGames() async {
  final uri = Uri(
    scheme: "https",
    host: "api.rawg.io",
    path: "/api/games",
    queryParameters: {
      'key': API_KEY,
      'developers': "nintendo",
      'dates': "2021-01-01,2021-12-31",
    },
  );
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  List jocs = json["results"];
  return jocs.map((jsonJoc) => Joc.fromJson(jsonJoc)).toList();
}

Future<List<Joc>> loadXboxGames() async {
  final uri = Uri(
    scheme: "https",
    host: "api.rawg.io",
    path: "/api/games",
    queryParameters: {
      'key': API_KEY,
      'publishers': "xbox-game-studios",
      'dates': "2021-01-01,2021-12-31",
    },
  );
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  List jocs = json["results"];
  return jocs.map((jsonJoc) => Joc.fromJson(jsonJoc)).toList();
}

Future<List<Joc>> loadSonyGames() async {
  final uri = Uri(
    scheme: "https",
    host: "api.rawg.io",
    path: "/api/games",
    queryParameters: {
      'key': API_KEY,
      'publishers': "sony-interactive-entertainment",
      'dates': "2019-01-01,2021-12-31",
    },
  );
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  List jocs = json["results"];
  return jocs.map((jsonJoc) => Joc.fromJson(jsonJoc)).toList();
}

Future<List<Joc>> loadRatingGames() async {
  final uri = Uri(
    scheme: "https",
    host: "api.rawg.io",
    path: "/api/games",
    queryParameters: {
      'key': API_KEY,
      'ordering': "-metacritic",
      'dates': "2021-01-01,2021-12-31",
    },
  );
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  List jocs = json["results"];
  return jocs.map((jsonJoc) => Joc.fromJson(jsonJoc)).toList();
}

Future<List<Joc>> loadyourGames(String genre) async {
  final uri = Uri(
    scheme: "https",
    host: "api.rawg.io",
    path: "/api/games",
    queryParameters: {
      'key': API_KEY,
      'genres': "$genre",
      'dates': "2019-01-01,2021-12-31",
    },
  );
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  List jocs = json["results"];
  return jocs.map((jsonJoc) => Joc.fromJson(jsonJoc)).toList();
}

Future<List<Joc>> loadSearchGames(String search) async {
  final uri = Uri(
    scheme: "https",
    host: "api.rawg.io",
    path: "/api/games",
    queryParameters: {
      'key': API_KEY,
      'ordering': "-metacritic",
      'search_precise': "true",
      'search': "$search",
    },
  );
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  List jocs = json["results"];
  return jocs.map((jsonJoc) => Joc.fromJson(jsonJoc)).toList();
}

class Detalls {
  String? description, developers;

  Detalls(this.description, this.developers);

  Detalls.fromJson(Map<String, dynamic> json)
      : description = json["description_raw"],
        developers = json["developers"][0]["name"];
}

Future<Detalls> loadDetails(String name) async {
  final uri = Uri(
    scheme: "https",
    host: "api.rawg.io",
    path: "/api/games/$name",
    queryParameters: {
      'key': API_KEY,
    },
  );
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  return Detalls.fromJson(json);
}

class Screenshots {
  String image;

  Screenshots(this.image);

  Screenshots.fromJson(Map<String, dynamic> json) : image = json["image"];
}

class Platforms {
  String? name;

  Platforms(this.name);

  Platforms.fromJson(Map<String, dynamic> json)
      : name = json["platform"]["name"];
}

class Genres {
  String name;

  Genres(this.name);

  Genres.fromJson(Map<String, dynamic> json) : name = json["slug"];
}
