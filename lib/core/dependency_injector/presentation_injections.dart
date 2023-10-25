import 'package:address_lookup/main.dart';
import 'package:address_lookup/presentation/pages/address_lookup/address_lookup_view_model.dart';

void setupInjections() {
  getIt.registerLazySingleton<AddressLookupViewModel>(() => AddressLookupViewModel(
        getIt(),
        getIt(),
      ));
}
