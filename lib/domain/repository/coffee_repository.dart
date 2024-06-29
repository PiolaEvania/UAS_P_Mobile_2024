import '../entity/coffee.dart';

abstract class CoffeeRepository {
  Future<List<Coffee>> getCoffees();
}