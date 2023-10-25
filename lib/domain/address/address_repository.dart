import 'package:address_lookup/domain/address/models/address.dart';

abstract class AddressRepository {
  Future<void> saveAddress(Address address);
  Future<Address> fetchAddress();
}
