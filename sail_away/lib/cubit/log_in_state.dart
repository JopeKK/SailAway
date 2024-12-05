part of 'log_in_cubit.dart';

abstract class LogInState {
  const LogInState();
}

final class LogIn extends LogInState {}

final class RegisterPart1 extends LogInState {}

final class RegisterPart2 extends LogInState {}

final class Error extends LogInState {
  final String errorMessage;

  const Error(
    this.errorMessage,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Error && other.errorMessage == errorMessage;
  }

  @override
  int get hashCode => errorMessage.hashCode;
}



