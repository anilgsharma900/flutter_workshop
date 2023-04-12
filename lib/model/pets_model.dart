import 'package:flutter_workshopt/model/pets_models.dart';
import 'package:json_annotation/json_annotation.dart';

/// Created by Anil Sharma on 12/02/23.

part 'pets_model.g.dart';

@JsonSerializable()
class PetsModels {
  final List<PetsModel>? pets;

  PetsModels({this.pets});

  factory PetsModels.fromJson(Map<String, dynamic> json) => _$PetsModelsFromJson(json);


}
