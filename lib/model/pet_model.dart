/// Created by Anil Sharma on 12/02/23.

class PetModels {
  List<PetModel>? pets;

  PetModels({this.pets});

  PetModels.fromJson(Map<String, dynamic> data) {
    pets = [];
    (data["pets"] as List).forEach((json) {
      pets!.add(PetModel.fromJson(json));
    });
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["pets"] = pets!.map((petModel) => petModel.toJson()).toList();
    return data;
  }
}

class PetModel {
  String? image_url;
  String? title;
  String? content_url;
  String? date_added;

  PetModel({this.image_url, this.title, this.content_url, this.date_added});

  PetModel.fromJson(Map<String, dynamic> pets) {
    image_url = pets["image_url"];
    title = pets["title"];
    content_url = pets["content_url"];
    date_added = pets["date_added"];
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data["image_url"] = image_url;
    data["title"] = title;
    data["content_url"] = content_url;
    data["date_added"] = date_added;
    return data;
  }
}
