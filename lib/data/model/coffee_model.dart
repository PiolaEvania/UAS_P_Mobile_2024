import '../../domain/entity/coffee.dart';

//Memperluas kelas CoffeeModel sehingga mewarisi semua properti dan metode dari Coffee.
class CoffeeModel extends Coffee {
  CoffeeModel({
    required String title,
    required String description,
    required List<String> ingredients,
    required String image,
    required int id,
  }) : super(
    title: title,
    description: description,
    ingredients: ingredients,
    image: image,
    id: id,
  );

  //Deserialisasi object JSON agar bisa digunakan
  factory CoffeeModel.fromJson(Map<String, dynamic> json) {
    return CoffeeModel(
      title: json['title'],
      description: json['description'],
      ingredients: List<String>.from(json['ingredients']),
      image: json['image'],
      id: json['id'],
    );
  }

  //Serialisasi object JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'ingredients': ingredients,
      'image': image,
      'id': id,
    };
  }
}