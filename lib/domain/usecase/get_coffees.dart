import '../entity/coffee.dart';
import '../repository/coffee_repository.dart';

class GetCoffees {
  final CoffeeRepository repository;

  GetCoffees(this.repository);

  Future<List<Coffee>> call() async {
    return await repository.getCoffees();
  }
}
