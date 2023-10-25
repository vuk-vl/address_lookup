import 'package:address_lookup/data/address_repository_impl.dart';
import 'package:address_lookup/domain/address/address_repository.dart';
import 'package:address_lookup/main.dart';

void setupInjections() {
  getIt.registerLazySingleton<AddressRepository>(() => AddressRepositoryImpl());
}
