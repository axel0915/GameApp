// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_string_interpolations, non_constant_identifier_names

import 'dart:convert';
import 'package:projecte/main.dart';
import 'package:http/http.dart' as http;

class Screenshots {
  String image;
  int id;

  Screenshots(this.image, this.id);

  Screenshots.fromJson(Map<String, dynamic> json)
      : image = json["image"],
        id = json["id"];
}

class Joc {
  List<Screenshots>? screenshots;
  String name, slug, background_image, released, platform, color;
  int? metacritic;

  Joc(this.name, this.slug, this.background_image, this.released,
      this.metacritic, this.platform, this.screenshots, this.color);

  Joc.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        color = json["dominant_color"],
        slug = json["genres"][0]["name"],
        background_image = json["background_image"],
        released = json["released"],
        screenshots = (json["short_screenshots"] as List)
            .map((i) => Screenshots.fromJson(i))
            .toList(),
        metacritic = json["metacritic"],
        platform = json["platforms"][0]["platform"]["name"];
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
