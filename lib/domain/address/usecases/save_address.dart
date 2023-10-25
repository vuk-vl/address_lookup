import 'package:address_lookup/domain/address/models/address.dart';
import 'package:address_lookup/domain/address/address_repository.dart';

class SaveAddressUseCase {
  final AddressRepository addressLookupRepository;

  SaveAddressUseCase(this.addressLookupRepository);

  Future call(Address address) => addressLookupRepository.saveAddress(address);
}
