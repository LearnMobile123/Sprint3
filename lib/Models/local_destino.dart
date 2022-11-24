import 'package:hive/hive.dart';

part 'local_destino.g.dart';

@HiveType(typeId: 0)
class LocalDestino extends HiveObject{

  @HiveField(0)
  String? name;

  @HiveField(1)
  String? ciudad;

  @HiveField(2)
  String? departamento;

  @HiveField(3)
  String? descripcion;

  @HiveField(4)
  String? temperatura;

  @HiveField(5)
  String? urlimagen;

}