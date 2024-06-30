import 'dart:convert';
import 'package:http/http.dart' as http;
import '../datasource/coffee_remote_data_source.dart';
import '../model/coffee_model.dart';

//Class implementasi untuk mengambil data dari API dengan decode data dari JSON
class CoffeeRemoteDataSourceImpl implements CoffeeRemoteDataSource {
  static const String apiUrl = 'https://api.sampleapis.com/coffee/hot';

  @override
  Future<List<CoffeeModel>> fetchCoffees() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => CoffeeModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load coffees');
    }
  }
}
