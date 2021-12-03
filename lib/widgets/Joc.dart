import 'dart:io';
import 'dart:convert';

import 'package:projecte/main.dart';
import 'package:http/http.dart' as http;

class Plataforma {
  String nomPlataforma, companyiaplataforma;
  int anyPlataforma; //La plataforma tindria imatges??

  Plataforma(this.nomPlataforma, this.companyiaplataforma, this.anyPlataforma);
}

class Joc extends Plataforma {
  String nom,
      genere,
      descripcio,
      companyia,
      imatge; //Com es faria per posar una imatge?? URL??
  int any;

  Joc(String np, String cp, int ap, this.nom, this.any, this.companyia,
      this.descripcio, this.genere, this.imatge)
      : super(np, cp, ap);

  //APARTAT JSON FIREBASE A FER:
  /* 
  Map<String, dynamic> toJson() => {
        'nomplataforma': nomPlataforma,
        'companyiaplataforma': companyiaplataforma,
        'anyplataforma': anyPlataforma,
        'nom': nom,
        'genere': genere,
        'descripcio': descripcio,
        'companyia': companyia,
        'any': any
      };

  Joc.fromJson(Map<String, dynamic> json)
      : this(
            json['nomplataforma'],
            json['companyiaplataforma'],
            json['anyplataforma'],
            json['nom'],
            json['any'],
            json['companyia'],
            json['descripcio'],
            json['genere']);
  */

  toString() =>
      '$nom, $any, $genere, $companyia, $descripcio ($nomPlataforma, $companyiaplataforma, $anyPlataforma)';
}

Future<List> loadMovies() async {
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
  return json['results'];
}
