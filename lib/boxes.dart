import 'package:hive/hive.dart';
import 'package:project_app/Models/local_destino.dart';

class Boxes {
  static Box<LocalDestino> getFavoritesBox() => Hive.box<LocalDestino>('Favoritos');
}