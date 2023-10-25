import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  late final String failureMessage;
  late final StackTrace? stackTrace;

  Failure(String? errorMessage, {StackTrace? errorTrace}) {
    failureMessage = errorMessage ?? "Unknown";
    stackTrace = errorTrace;
  }

  @override
  List<Object?> get props => [failureMessage];
}
