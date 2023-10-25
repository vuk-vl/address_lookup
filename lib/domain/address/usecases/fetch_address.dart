import 'package:address_lookup/domain/address/models/address.dart';
import 'package:address_lookup/domain/address/address_repository.dart';

class FetchAddressUseCase {
  final AddressRepository addressLookupRepository;

  FetchAddressUseCase(this.addressLookupRepository);

  Future<Address> call() => addressLookupRepository.fetchAddress();
}
