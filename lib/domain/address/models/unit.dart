import 'package:equatable/equatable.dart';

class Unit extends Equatable {
  final String? name;

  const Unit(this.name);

  bool get isValid => name != null && name!.isNotEmpty;

  @override
  List<Object?> get props => [name];
}
