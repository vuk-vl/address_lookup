import 'package:address_lookup/presentation/pages/address_lookup/address_lookup_page.dart';
import 'package:address_lookup/presentation/pages/address_lookup/address_lookup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'core/dependency_injector/data_injections.dart' as data_di;
import 'core/dependency_injector/domain_injections.dart' as domain_di;
import 'core/dependency_injector/presentation_injections.dart' as presentation_di;

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  data_di.setupInjections();
  domain_di.setupInjections();
  presentation_di.setupInjections();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      title: 'Registered Address',
      home: ChangeNotifierProvider<AddressLookupViewModel>(
        create: (_) => getIt<AddressLookupViewModel>(),
        child: const AddressLookupPage(),
      ),
    );
  }
}
