// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_destino.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalDestinoAdapter extends TypeAdapter<LocalDestino> {
  @override
  final int typeId = 0;

  @override
  LocalDestino read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalDestino()
      ..name = fields[0] as String?
      ..ciudad = fields[1] as String?
      ..departamento = fields[2] as String?
      ..descripcion = fields[3] as String?
      ..temperatura = fields[4] as String?
      ..urlimagen = fields[5] as String?;
  }

  @override
  void write(BinaryWriter writer, LocalDestino obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.ciudad)
      ..writeByte(2)
      ..write(obj.departamento)
      ..writeByte(3)
      ..write(obj.descripcion)
      ..writeByte(4)
      ..write(obj.temperatura)
      ..writeByte(5)
      ..write(obj.urlimagen);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalDestinoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
