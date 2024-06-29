import '../model/coffee_model.dart';

abstract class CoffeeRemoteDataSource {
  Future<List<CoffeeModel>> fetchCoffees();
}