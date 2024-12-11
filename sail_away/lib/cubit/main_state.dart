part of 'main_cubit.dart';

abstract class MainState {
  const MainState();
}

final class MainInitial extends MainState {}

final class MoveToProfilePage extends MainState {
  final String name;
  final String email;
  final List<ProductModel> products;
  final List<AllergyModel> allergies;

  const MoveToProfilePage(
    this.name,
    this.email,
    this.products,
    this.allergies,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MoveToProfilePage &&
        other.name == name &&
        other.email == email &&
        other.products == products &&
        other.allergies == allergies;
  }

  @override
  int get hashCode => Object.hash(name, email, products, allergies);
}

final class MoveToMainPage extends MainState {
  final List<TripModel> trips;
  const MoveToMainPage(this.trips);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MoveToMainPage && other.trips == trips;
  }

  @override
  int get hashCode => trips.hashCode;
}

final class UserSignedOut extends MainState {}

final class JoinTrip extends MainState {}

final class CreateNewTrip extends MainState {}

final class ShareNewTrip extends MainState {
  final String name;
  final String code;

  const ShareNewTrip(
    this.name,
    this.code,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShareNewTrip && other.name == name && other.code == code;
  }

  @override
  int get hashCode => Object.hash(name, code);
}

final class Error extends MainState {
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
