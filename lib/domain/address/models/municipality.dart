import 'package:equatable/equatable.dart';

class Municipality extends Equatable {
  final String? name;

  const Municipality(this.name);

  bool get isValid => name != null && name!.isNotEmpty;

  @override
  // TODO: implement props
  List<Object?> get props => [name];
}
