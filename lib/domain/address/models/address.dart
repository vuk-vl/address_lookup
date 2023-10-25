import 'package:address_lookup/domain/address/models/prefecture.dart';
import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String? country;
  final Prefecture? prefecture;
  final String? municipality;
  final String? streetAddress;
  final String? apartment;

  const Address({
    required this.country,
    required this.prefecture,
    required this.municipality,
    required this.streetAddress,
    required this.apartment,
  });

  @override
  List<Object?> get props => [
        country,
        prefecture,
        municipality,
        streetAddress,
        apartment,
      ];
}
