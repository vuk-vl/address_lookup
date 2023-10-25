import 'package:address_lookup/domain/address/models/address.dart';
import 'package:address_lookup/domain/address/models/country.dart';
import 'package:address_lookup/domain/address/models/municipality.dart';
import 'package:address_lookup/domain/address/models/prefecture.dart';
import 'package:address_lookup/domain/address/models/street_address.dart';
import 'package:address_lookup/domain/address/models/unit.dart';
import 'package:address_lookup/domain/address/usecases/fetch_address.dart';
import 'package:address_lookup/domain/address/usecases/save_address.dart';
import 'package:flutter/material.dart';

class AddressLookupViewModel extends ChangeNotifier {
  final FetchAddressUseCase fetchAddressUseCase;
  final SaveAddressUseCase saveAddressUseCase;

  Address? _currentAddress;

  Country? country;
  Prefecture? prefecture;
  Municipality? municipality;
  StreetAddress? streetAddress;
  Unit? unit;

  AddressLookupViewModel(
    this.fetchAddressUseCase,
    this.saveAddressUseCase,
  );

  Address? get address => _currentAddress;

  bool get isCountryValid => country != null && country!.isValid;
  bool get isPrefectureValid => prefecture != null && prefecture!.isValid;
  bool get isStreetAddressValid => streetAddress != null && streetAddress!.isValid;
  bool get isMunicipalityValid => municipality != null && municipality!.isValid;
  bool get isUnitValid => unit != null && unit!.isValid;

  void updateCountry(String newValue) {
    country = Country(newValue);
    notifyListeners();
  }

  void updatePrefecture(String newValue) {
    prefecture = Prefecture(newValue);
    notifyListeners();
  }

  void updateMunicipality(String newValue) {
    municipality = Municipality(newValue);
    notifyListeners();
  }

  void updateStreetAddress(String newValue) {
    streetAddress = StreetAddress(newValue);
    notifyListeners();
  }

  void updateUnit(String newValue) {
    unit = Unit(newValue);
    notifyListeners();
  }

  Future saveAddress(Address newAddress) async {
    final saveAddressResult = await saveAddress(newAddress);
    _currentAddress = saveAddressResult;

    notifyListeners();
  }

  Future fetchAddress() async {
    final fetchAddressResult = await fetchAddressUseCase();

    _currentAddress = fetchAddressResult;
    notifyListeners();
  }
}
