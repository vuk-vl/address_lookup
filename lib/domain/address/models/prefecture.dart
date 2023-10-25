import 'package:equatable/equatable.dart';

class Prefecture extends Equatable {
  final String? name;

  const Prefecture(this.name);

  bool get isValid => name != null && name!.isNotEmpty;

  @override
  List<Object?> get props => [name];
}
