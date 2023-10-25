import 'package:address_lookup/domain/address/usecases/fetch_address.dart';
import 'package:address_lookup/domain/address/usecases/save_address.dart';
import 'package:address_lookup/main.dart';

void setupInjections() {
  getIt.registerFactory<SaveAddressUseCase>(() => SaveAddressUseCase(getIt()));
  getIt.registerFactory<FetchAddressUseCase>(() => FetchAddressUseCase(getIt()));
}
