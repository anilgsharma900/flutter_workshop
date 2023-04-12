import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_workshopt/model/pet_model.dart';
import 'package:flutter_workshopt/storage/app_store_sqflite.dart';

/// Created by Anil Sharma on 14/02/23.
class PetView extends StatefulWidget {
  const PetView({Key? key}) : super(key: key);

  @override
  State<PetView> createState() => _PetViewState();
}

class _PetViewState extends State<PetView> {
  PetModels? petModels;

  @override
  void initState() {
    super.initState();
    getAssetJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pets"),
      ),
      body: petModels != null
          ? ListView(
        children: List.generate(petModels!.pets!.length, (index) {
          final pet = petModels!.pets![index];
          return ListTile(
            leading: Image.network(
              "${pet.image_url}",
              width: 100,
              height: 100,
              colorBlendMode: BlendMode.srcATop,
              fit: BoxFit.fill,
              loadingBuilder: (context, child, loading) {
                return loading == null ? child : CircularProgressIndicator();
              },
              errorBuilder: (context, object, stackTrace) {
                return Icon(Icons.error);
              },
            ),
            title: Text("${pet.title}"),
            subtitle: Text("${pet.date_added}"),
          );
        }),
      )
          : SizedBox(),
    );
  }


  getAssetJson() async {
    final jsonString = await rootBundle.loadString("assets/pets_list.json");

    final json = const JsonDecoder().convert(jsonString) as Map<String, dynamic>;
    setState(() {
      petModels = PetModels.fromJson(json);
      // AppStoreSqflite.deleteWeather();
      // AppStoreSqflite.insertWeather("New Delhi");
    });
  }
}
