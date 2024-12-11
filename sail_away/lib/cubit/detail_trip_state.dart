part of 'detail_trip_cubit.dart';

abstract class DetailTripState {
  const DetailTripState();
}

final class DetailInit extends DetailTripState {}

final class BackToMainScreen extends DetailTripState {}

final class loadingScreen extends DetailTripState {}

final class Error extends DetailTripState {
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

final class DetailTripStateMain extends DetailTripState {
  final String name;
  final bool tips;
  final bool transport;

  const DetailTripStateMain(
    this.name,
    this.tips,
    this.transport,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DetailTripStateMain &&
        other.tips == tips &&
        other.transport == transport &&
        other.name == name;
  }

  @override
  int get hashCode => Object.hash(tips, transport, name);
}

final class TipsScreen extends DetailTripState {
  final List<TipModel> tips;

  const TipsScreen(
    this.tips,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TipsScreen && other.tips == tips;
  }

  @override
  int get hashCode => tips.hashCode;
}

final class CrewScreen extends DetailTripState {
  final String uid;
  final List<UserModel> members;
  final String authorId;

  const CrewScreen(
    this.uid,
    this.members,
    this.authorId,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CrewScreen &&
        other.uid == uid &&
        other.members == members &&
        other.authorId == authorId;
  }

  @override
  int get hashCode => Object.hash(uid, members, authorId);
}

final class TransportScreen extends DetailTripState {
  final List<TransportModel> transports;
  final String uid;

  const TransportScreen(
    this.transports,
    this.uid,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransportScreen &&
        other.transports == transports &&
        other.uid == uid;
  }

  @override
  int get hashCode => Object.hash(uid, transports);
}
