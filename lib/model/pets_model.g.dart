// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pets_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetsModels _$PetsModelsFromJson(Map<String, dynamic> json) =>
    PetsModels(
      pets: (json['pets'] as List<dynamic>?)
          ?.map((e) => PetsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PetsModelsToJson(PetsModels instance) =>
    <String, dynamic>{
      'pets': instance.pets,
    };
