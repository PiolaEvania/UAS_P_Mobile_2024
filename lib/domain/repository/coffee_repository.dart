import '../entity/coffee.dart';

//Abstract class untuk pengambilan data coffee
abstract class CoffeeRepository {
  Future<List<Coffee>> getCoffees();
}