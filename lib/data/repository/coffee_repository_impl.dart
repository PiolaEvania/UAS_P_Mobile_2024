import '../../domain/entity/coffee.dart';
import '../../domain/repository/coffee_repository.dart';
import '../datasource/coffee_remote_data_source.dart';

//Penghubung lapisan data dan domain untuk implementasi pengambilan data Coffee dari sumber remote melalui CoffeeRemoteDataSource.
class CoffeeRepositoryImpl implements CoffeeRepository {
  final CoffeeRemoteDataSource remoteDataSource;

  CoffeeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Coffee>> getCoffees() async {
    return await remoteDataSource.fetchCoffees();
  }
}
