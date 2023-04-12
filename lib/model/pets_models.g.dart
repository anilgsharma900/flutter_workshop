// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pets_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetsModel _$PetsModelFromJson(Map<String, dynamic> json) =>
    PetsModel(
      image_url: json['image_url'] as String?,
      title: json['title'] as String?,
      content_url: json['content_url'] as String?,
      date_added: json['date_added'] as String?,
    );

Map<String, dynamic> _$PetsModelToJson(PetsModel instance) =>
    <String, dynamic>{
      'image_url': instance.image_url,
      'title': instance.title,
      'content_url': instance.content_url,
      'date_added': instance.date_added,
    };
