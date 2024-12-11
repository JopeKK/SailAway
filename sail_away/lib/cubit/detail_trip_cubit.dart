import 'package:bloc/bloc.dart';
import 'package:sail_away/cubit/main_cubit.dart';
import 'package:sail_away/data/model/tips.dart';
import 'package:sail_away/data/model/transport.dart';
import 'package:sail_away/data/model/trip.dart';
import 'package:sail_away/data/model/user.dart';
import 'package:sail_away/data/repository.dart';

part 'detail_trip_state.dart';

class DetailTripCubit extends Cubit<DetailTripState> {
  final Repo repo;
  final String tripId;
  late TripModel trip;
  final MainCubit mainCubit;

  DetailTripCubit(this.repo, this.tripId, this.mainCubit)
      : super(DetailInit()) {
    getMainScreen();
  }

  Future<void> getMainScreen() async {
    TripModel item = await repo.getTripById(tripId);

    trip = TripModel(
      id: item.id,
      authorId: item.authorId,
      tips: item.tips,
      name: item.name,
      transport: item.transport,
      inviteCode: item.inviteCode,
    );

    emit(DetailTripStateMain(item.name, item.tips, item.transport));
  }

  Future<bool> removeUser() async {
    String uid = await repo.loadUserId();

    TripModel trip = await repo.getTripById(tripId);
    if (trip.authorId == uid && trip.members!.isNotEmpty) {
      emit(const Error('Jestes tworca i jeszcze ktos jest w wyjezdie'));
      return false;
    }

    if (trip.authorId == uid && trip.members!.isEmpty) {
      await repo.tripRemoveById(tripId);
      mainCubit.moveToMainPage();
      return true;
    }

    trip.members!.removeWhere((e) => e == uid);
    await repo.changeTripMembers(tripId, trip.members!);
    mainCubit.moveToMainPage();
    return true;
  }

  Future<void> moveToTips() async {
    List<TipModel> items = await repo.getAllTips();
    emit(TipsScreen(items));
  }

  Future<void> moveToCrew() async {
    String uid = await repo.loadUserId();
    final members = await repo.getMembersFromTripByTripId(tripId);
    TripModel trip = await repo.getTripById(tripId);

    UserModel authorUser = await repo.getUserDataWithAuthId(trip.authorId);
    List<UserModel> items = await repo.getUserFromMembers(members);
    items.add(authorUser);
    items.removeWhere((e) => e.authId == uid);

    emit(CrewScreen(uid, items, trip.authorId));
  }

  Future<void> removeUserWithId(String id) async {
    String uid = await repo.loadUserId();
    TripModel trip = await repo.getTripById(tripId);
    if (uid != trip.authorId) {
      emit(const Error('Nie jestes tworca zeby usuwac innych'));
      return;
    }

    trip.members!.removeWhere((e) => e == id);
    await repo.changeTripMembers(tripId, trip.members!);
    List<UserModel> items = await repo.getUserFromMembers(trip.members!);

    emit(CrewScreen(uid, items, trip.authorId));
  }

  Future<void> removeTransport(String id) async {
    await repo.delteTransport(id);
    moveToTransport();
  }

  Future<void> moveToTransport() async {
    String uid = await repo.loadUserId();
    List<TransportModel> transports = await repo.getTransportByTripId(tripId);

    emit(TransportScreen(transports, uid));
  }

  Future<void> joinToTransport(String transportId) async {
    String uid = await repo.loadUserId();
    TransportModel item = await repo.getTransportById(transportId);

    List<String> usersList = item.members;
    if (!usersList.contains(uid)) {
      usersList.add(uid);
    }

    repo.changeTransportMembers(transportId, usersList);
    moveToTransport();
  }

  Future<void> createTransport(String name) async {
    String uid = await repo.loadUserId();
    List<String> members = [uid];
    await repo.creatTransportInDb(name, tripId, members);

    moveToTransport();
  }

  Future<void> moveToShoppingList() async {}
}
