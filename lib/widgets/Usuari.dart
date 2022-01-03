import 'dart:io';
import 'dart:convert';

import 'package:projecte/widgets/Joc.dart';

class Usuari {
  String email, contrasenya, genere_preferit;
  List<Joc> biblioteca = [];

  Usuari(this.contrasenya, this.email, this.genere_preferit);
}
