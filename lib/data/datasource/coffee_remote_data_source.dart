import '../model/coffee_model.dart';

//Abstract class untuk mengambil data secara remote dari API dengan method fetchCoffees()
abstract class CoffeeRemoteDataSource {
  Future<List<CoffeeModel>> fetchCoffees();
}