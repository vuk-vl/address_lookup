import 'package:equatable/equatable.dart';

class StreetAddress extends Equatable {
  final String? name;

  const StreetAddress(this.name);

  bool get isValid => name != null && name!.isNotEmpty;

  @override
  List<Object?> get props => [name];
}
