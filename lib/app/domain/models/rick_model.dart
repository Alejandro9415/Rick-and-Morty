import 'dart:convert';

RickModel rickModelFromJson(String str) => RickModel.fromJson(json.decode(str));

String rickModelToJson(RickModel data) => json.encode(data.toJson());

class RickModel {
    RickModel({
        required this.id,
        required this.name,
        required this.status,
        required this.species,
        required this.type,
        required this.gender,
        required this.image,
    });

    final int id;
    final String name;
    final String status;
    final String species;
    final String type;
    final String gender;
    final String image;

    factory RickModel.fromJson(Map<String, dynamic> json) => RickModel(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "species": species,
        "type": type,
        "gender": gender,
        "image": image,
    };
}
