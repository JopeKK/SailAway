import 'package:bloc/bloc.dart';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sail_away/data/model/allergy.dart';
import 'package:sail_away/data/model/preferences.dart';
import 'package:sail_away/data/model/product.dart';
import 'package:sail_away/data/model/trip.dart';
import 'package:sail_away/data/model/user.dart';
import 'package:sail_away/data/repository.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final random = Random();
  final Repo repo;

  MainCubit(this.repo) : super(MainInitial()) {
    emit(MainInitial());
    moveToMainFirstPage();
  }

  Future<void> moveToMainPage() async {
    List<TripModel> items = await repo.loadTrips();
    emit(MoveToMainPage(items));
  }

  Future<void> moveToProfile() async {
    UserModel user;
    UserPreferencesModel pref;
    List<ProductModel> userProducts = [];
    List<AllergyModel> userAllergies = [];

    String userId = await repo.loadUserId();
    user = await repo.getUserDataWithAuthId(userId);
    pref = await repo.getUserPreferencesWithAuthID(userId);
    userProducts = await repo.getProductsFromIdList(pref.hatedProduct);
    userAllergies = await repo.getAllergiesFromIdList(pref.allergies);

    emit(MoveToProfilePage(user.name, user.email, userProducts, userAllergies));
  }


  //TODO add remove alleriges and remove hproduct also add this and that and better view for them

  //no i jak to teraz zrobic lista zakupow id tripu no i teraz co id produktu czy hate czy alergia i kto jedno kto drugie jako lista
  //i wtedy jak jedno lub drugie to info kto to ma i inny kolor kafelka ilosc jeszcze bo rodzaj przechowywania jest w produkcie teraz jakies
  //fajne zapytanie trzeba dodac moze checkbox co juz kupiono opcja save na dole napewno latwy zapis ale mozna pomyslec o poprostu dodaj i wtedy
  //zapis no i usun krzyzyk na koncu kto moze chyba wszyscy no i edit do ilosci trzeba zrobic wartosc pokazywana to ta co jest ale mozna edit
  //i na submit to dodajemy do bazy wiec ilosc w produkcie

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
    emit(UserSignedOut());
  }

  Future<void> moveToJoinPage() async {
    emit(JoinTrip());
  }

  Future<void> moveToCreatePage() async {
    emit(CreateNewTrip());
  }

  Future<void> moveToMainFirstPage() async {
    String uid = await repo.loadUserId();
    List<TripModel> trips = await repo.getAllTrips();
    List<TripModel> utrips = [];
    for (var e in trips) {
      if (e.authorId == uid || e.members!.contains(uid)) {
        utrips.add(e);
      }
    }
    repo.saveTrips(utrips);
    emit(MoveToMainPage(utrips));
  }

  Future<void> createNewTrip(
    String name,
    String region,
    DateTime startingDate,
    bool useTransport,
    bool useAdvice,
  ) async {
    String inviteCode = (random.nextInt(90000000) + 10000000).toString();
    String authorId = await repo.loadUserId();

    repo.creatTripInDb(inviteCode, authorId, name, region, startingDate,
        useAdvice, useTransport);
    emit(ShareNewTrip(name, inviteCode));
  }

  Future<void> joinExistingTrip(String code) async {
    String userId = await repo.loadUserId();

    TripModel trip = await repo.getTripFromInviteCode(code);
    List<String> members = trip.members!;
    if (userId == trip.authorId || members.contains(userId)) {
      print("no i gdzie sie pchasz jak tam jestes");
      emit(const Error("no juz tam jestes"));
      return;
    }

    members.add(userId);
    await repo.changeTripMembers(trip.id, members);
    moveToMainFirstPage();
  }
}
