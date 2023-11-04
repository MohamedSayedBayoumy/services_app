
import 'package:hive/hive.dart';



// GENERATED CODE - DO NOT MODIFY BY HAND



// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************
 

@HiveType(typeId: 0)
class DataModel extends HiveObject{
  @HiveField(0)
  final String? item;
  @HiveField(1)
  final int? quantity;

  DataModel({this.item, this.quantity});
}

class DataModelAdapter extends TypeAdapter<DataModel> {
  @override
  final int typeId = 0;

  @override
  DataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataModel(
      item: fields[0] as String?,
      quantity: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, DataModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.item)
      ..writeByte(1)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}