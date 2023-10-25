import 'dart:developer';

import 'package:address_lookup/domain/address/models/country.dart';
import 'package:address_lookup/presentation/countries_helper.dart';
import 'package:address_lookup/presentation/pages/address_lookup/address_lookup_view_model.dart';
import 'package:address_lookup/presentation/shared/base_screen_widget.dart';
import 'package:address_lookup/presentation/shared/extensions.dart';
import 'package:address_lookup/presentation/shared/string_constants.dart';
import 'package:address_lookup/presentation/shared/validated_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

/// Back arrow would be added as part of the appBar
/// Progress bar below would be added as ... based on the total number of steps
class AddressLookupPage extends StatelessWidget {
  const AddressLookupPage({super.key});

  final _textFieldsSpacing = 10.0;

  @override
  Widget build(BuildContext context) {
    return BaseScreenWidget(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 12.0,
      ),
      title: StringValues.LookupScreenTitle,
      screenContent: Consumer<AddressLookupViewModel>(
        builder: (_, model, __) => SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.width * 1.8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: _textFieldsSpacing),
                Text(
                  StringValues.LookupScreenSubtitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 17.0,
                  ),
                ),
                _buildCountryField(context, model),
                SizedBox(height: _textFieldsSpacing),
                ValidatedTextFieldWidget(
                  key: const Key("prefectureLabel"),
                  onValueChanged: model.updatePrefecture,
                  hintText: StringValues.PrefectureLabel,
                  isInputValid: model.isPrefectureValid,
                ),
                SizedBox(height: _textFieldsSpacing),
                ValidatedTextFieldWidget(
                  key: const Key("unicipalityField"),
                  onValueChanged: model.updateMunicipality,
                  hintText: StringValues.MunicipalityLabel,
                  isInputValid: model.isMunicipalityValid,
                ),
                SizedBox(height: _textFieldsSpacing),
                ValidatedTextFieldWidget(
                  key: const Key("streetAddressField"),
                  onValueChanged: model.updateStreetAddress,
                  hintText: StringValues.StreetAddressLabel,
                  isInputValid: model.isStreetAddressValid,
                ),
                SizedBox(height: _textFieldsSpacing),
                ValidatedTextFieldWidget(
                  key: const Key("unitField"),
                  onValueChanged: model.updateUnit,
                  hintText: StringValues.UnitLabel,
                  isInputValid: model.isUnitValid,
                ),
                const Spacer(),
                _buildButton(model),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(AddressLookupViewModel model) {
    final action = model.isMunicipalityValid ? () => log(model.address.toString()) : null;

    return SizedBox(
      width: double.infinity,
      height: 70,
      child: ElevatedButton(
        onPressed: action,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          disabledForegroundColor: Colors.white,
          backgroundColor: Colors.purple.shade900,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          disabledBackgroundColor: Colors.purple.shade900.withOpacity(0.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0), // Rounded corners
          ),
        ),
        child: const Text(StringValues.ButtonLabel),
      ),
    );
  }

  Widget _buildCountryField(BuildContext context, AddressLookupViewModel model) {
    ValueNotifier<String?> flagListenable = ValueNotifier(null);

    return Row(
      children: [
        Flexible(
          flex: 6,
          child: ValidatedTextFieldWidget(
            onValueChanged: (String value) {
              // The filtering logic could be improved by smarter and more complex string comparisons
              if (value.isNotEmpty) {
                final results = CountriesHelper.countriesMap.keys.where(
                  (element) => element.startsWith(value.capitalize()),
                );

                if (results.isEmpty) {
                  flagListenable.value = null;
                } else if (results.length == 1) {
                  // Means that we have only one possible outcome so it's some to autocomplete

                  model.updateCountry(results.first);
                  flagListenable.value = Country.get2CodeCountry(results.first);
                } else {
                  flagListenable.value = Country.get2CodeCountry(results.first);
                }
              } else {
                flagListenable.value = null;
              }
            },
            hintText: StringValues.CountryLabel,
            isInputValid: model.isCountryValid,
          ),
        ),
        ValueListenableBuilder(
          valueListenable: flagListenable,
          builder: (_, value, __) {
            if (value == null) {
              return const SizedBox.shrink();
            }

            final asset = Country.getSvgAsset(value);

            final svgWidget = SizedBox(
              height: 30,
              width: 30,
              child: SvgPicture.asset(asset),
            );
            return Flexible(flex: 1, child: svgWidget);
          },
        )
      ],
    );
  }
}
