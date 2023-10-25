import 'package:address_lookup/presentation/countries_helper.dart';
import 'package:address_lookup/presentation/shared/extensions.dart';
import 'package:equatable/equatable.dart';

class Country extends Equatable {
  final String? name;

  const Country(this.name);

  bool get isValid => (name != null && name!.isNotEmpty && CountriesHelper.countriesMap.containsKey(name));

  @override
  List<Object?> get props => [name];

  static String? get2CodeCountry(String country) {
    if (CountriesHelper.countriesMap[country.capitalize()] == null) {
      return null;
    }

    return CountriesHelper.countriesMap[country.capitalize()]['2code'].toLowerCase();
  }

  static String getSvgAsset(String countryCode) => 'assets/flags/$countryCode.svg';
}
