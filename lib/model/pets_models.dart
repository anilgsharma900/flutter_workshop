import 'package:json_annotation/json_annotation.dart';

/// Created by Anil Sharma on 12/02/23.

part 'pets_models.g.dart';

@JsonSerializable()
class PetsModel {
  String? image_url;
  String? title;
  String? content_url;
  String? date_added;

  PetsModel({this.image_url, this.title, this.content_url, this.date_added});

  factory PetsModel.fromJson(Map<String, dynamic> json) => _$PetsModelFromJson(json);

}