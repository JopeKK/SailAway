part of 'log_in_cubit.dart';

abstract class LogInState {
  const LogInState();
}

final class LogIn extends LogInState {}

final class RegisterPart1 extends LogInState {}

final class RegisterPart2 extends LogInState {
  final List<ProductModel> products;
  final List<AllergyModel> allergies;

  const RegisterPart2(
    this.products,
    this.allergies,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterPart2 &&
        other.products == products &&
        other.allergies == allergies;
  }

  @override
  int get hashCode => Object.hash(products, allergies);
}

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

final class MoveToMainScreen extends LogInState {}
