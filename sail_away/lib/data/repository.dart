import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sail_away/data/model/allergy.dart';
import 'package:sail_away/data/model/preferences.dart';
import 'package:sail_away/data/model/product.dart';
import 'package:sail_away/data/model/tips.dart';
import 'package:sail_away/data/model/transport.dart';
import 'package:sail_away/data/model/trip.dart';
import 'package:sail_away/data/model/user.dart';
import 'package:sail_away/generated/sail_away_api.dart';

const String pokeDBREF = 'FavoritePokeList';

abstract class Repo {
  Future<void> saveUserId(String userId);
  Future<String> loadUserId();
  Future<void> cleanUserId();

  Future<void> saveTrips(List<TripModel> trips);
  Future<List<TripModel>> loadTrips();

  Future<void> changeTripMembers(String tripID, List<String> usersList);
  Future<void> changeTransportMembers(
      String transportId, List<String> usersList);

  Future<void> delteTransport(String transportId);

  Future<void> tripRemoveById(String tripID);
  Future<void> creatTransportInDb(
      String type, String tripId, List<String> members);
  Future<void> creatTripInDb(String inviteCode, String authorId, String name,
      String region, DateTime date, bool useAdvice, bool useTransport);
  Future<void> creatUserInDB(String id, String name, String email);
  Future<void> creatUserPrefernces(
      String userId, List<String> products, List<String> allergies);

  Future<TransportModel> getTransportById(String id);
  Future<List<TransportModel>> getTransportByTripId(String tripId);
  Future<List<UserModel>> getUserFromMembers(List<String>? members);
  Future<List<String>?> getMembersFromTripByTripId(String tripId);
  Future<List<TipModel>> getAllTips();
  Future<TripModel> getTripById(String id);
  Future<List<TripModel>> getAllTrips();
  Future<TripModel> getTripFromInviteCode(String code);
  Future<List<ProductModel>> getProductsFromIdList(List<String>? list);
  Future<List<AllergyModel>> getAllergiesFromIdList(List<String>? list);
  Future<UserPreferencesModel> getUserPreferencesWithAuthID(String authId);
  Future<UserModel> getUserDataWithAuthId(String authId);
  Future<List<ProductModel>> getAllProductFromDB();
  Future<List<AllergyModel>> getAllAllergiesFromDB();
}

class DataRepository implements Repo {
  final dbApi = SailAwayApiConnector.instance;
  final sStorage = const FlutterSecureStorage();

  @override
  Future<void> saveTrips(List<TripModel> trips) async {
    List<String> tripsJson =
        trips.map((trip) => jsonEncode(trip.toJson())).toList();
    await sStorage.write(key: 'Trips', value: jsonEncode(tripsJson));
  }

  @override
  Future<List<TripModel>> loadTrips() async {
    String? tripsJsonString = await sStorage.read(key: 'Trips');
    if (tripsJsonString != null) {
      List<dynamic> tripsJson = jsonDecode(tripsJsonString.toString());
      var test = List.from(tripsJson);
      List<TripModel> items =
          test.map((e) => TripModel.fromJson(jsonDecode(e))).toList();
      return items;
    }
    return [];
  }

  @override
  Future<void> saveUserId(String userId) async {
    await sStorage.write(key: 'UserId', value: userId);
  }

  @override
  Future<String> loadUserId() async {
    String userId = await sStorage.read(key: 'UserId') ?? '';
    return userId;
  }

  @override
  Future<void> cleanUserId() async {
    await sStorage.deleteAll();
  }

  @override
  Future<void> delteTransport(String transportId) async {
    await dbApi.removeTransportById(transportId: transportId).execute();
  }

  @override
  Future<void> tripRemoveById(String tripID) async {
    List<TripModel> items = await loadTrips();
    var index;
    for (var i = 0; i < items.length; i++) {
      if (items[i].id == tripID) {
        index = i;
        break;
      }
    }
    items.removeAt(index);
    await saveTrips(items);
    await dbApi.removeTripById(id: tripID).execute();
  }

  @override
  Future<void> creatUserInDB(var id, String name, String email) async {
    await dbApi.createUser(authId: id, name: name, email: email).execute();
  }

  @override
  Future<void> creatUserPrefernces(
      String userId, List<String> products, List<String> allergies) async {
    await dbApi
        .addUserPreferences(
            userId: userId, hatedProduct: products, allergies: allergies)
        .execute();
  }

  @override
  Future<void> creatTransportInDb(
      String type, String tripId, List<String> members) async {
    await dbApi
        .addTransport(members: members, tripId: tripId, type: type)
        .execute();
  }

  @override
  Future<void> creatTripInDb(String inviteCode, String authorId, String name,
      String region, DateTime date, bool useAdvice, bool useTransport) async {
    await dbApi.createTrip(
        name: name,
        authorId: authorId,
        tips: useAdvice,
        transport: useTransport,
        startingData: date,
        inviteCode: inviteCode,
        members: []).execute();
  }

  @override
  Future<void> changeTripMembers(String tripID, List<String> usersList) async {
    await dbApi.changeTripMember(newMembers: usersList, id: tripID).execute();
  }

  @override
  Future<void> changeTransportMembers(
      String transportId, List<String> usersList) async {
    await dbApi
        .changeTransportMember(members: usersList, transportId: transportId)
        .execute();
  }

  @override
  Future<TransportModel> getTransportById(String id) async {
    final response = await dbApi.getTransportById(transportId: id).execute();
    TransportModel item = TransportModel(
      id: response.data.TransportByTripId.first.id,
      tripId: response.data.TransportByTripId.first.tripId,
      type: response.data.TransportByTripId.first.type,
      members: response.data.TransportByTripId.first.members,
    );

    return item;
  }

  @override
  Future<List<TransportModel>> getTransportByTripId(String tripId) async {
    final response = await dbApi.getTransportByTripId(tripId: tripId).execute();
    List<TransportModel> items = [];
    for (var e in response.data.TransportByTripId) {
      items.add(TransportModel(
          id: e.id, tripId: e.tripId, type: e.type, members: e.members));
    }

    return items;
  }

  @override
  Future<List<String>?> getMembersFromTripByTripId(String tripId) async {
    final response =
        await dbApi.getUsersFromTripWithTripId(id: tripId).execute();
    List<String>? items = [];
    final test = response.data.UsersFromTrip;
    for (var e in test) {
      items = e.members;
      break;
    }

    return items;
  }

  @override
  Future<List<UserModel>> getUserFromMembers(List<String>? members) async {
    final response =
        await dbApi.getUsersFromMembersList(members: members!).execute();
    List<UserModel> items = [];

    for (var e in response.data.UsersFromMembers) {
      items.add(
          UserModel(id: 'brak', authId: e.authId, name: e.name, email: 'brak'));
    }

    return items;
  }

  @override
  Future<List<TipModel>> getAllTips() async {
    final response = await dbApi.getAllTips().execute();
    List<TipModel> items = [];
    for (var e in response.data.tips) {
      items.add(TipModel(id: e.id, title: e.title, description: e.description));
    }
    return items;
  }

  @override
  Future<TripModel> getTripById(String id) async {
    TripModel item;
    final response = await dbApi.getTripById(id: id).execute();
    item = TripModel(
      id: id,
      authorId: response.data.TripFromId.first.authorId,
      tips: response.data.TripFromId.first.tips,
      name: response.data.TripFromId.first.name,
      transport: response.data.TripFromId.first.transport,
      inviteCode: response.data.TripFromId.first.inviteCode,
      startingData: response.data.TripFromId.first.startingData,
      members: response.data.TripFromId.first.members,
    );

    return item;
  }

  @override
  Future<List<TripModel>> getAllTrips() async {
    List<TripModel> items = [];
    final response = await dbApi.getAllTrips().execute();
    for (var e in response.data.trips) {
      items.add(TripModel(
        id: e.id,
        name: e.name,
        authorId: e.authorId,
        tips: e.tips,
        transport: e.transport,
        inviteCode: e.inviteCode,
        members: e.members,
        startingData: e.startingData,
      ));
    }

    return items;
  }

  @override
  Future<TripModel> getTripFromInviteCode(String code) async {
    final response = await dbApi.getTripWithInviteCode(code: code).execute();
    TripModel item = TripModel(
        id: response.data.TripFromCode.first.id,
        name: response.data.TripFromCode.first.name,
        authorId: response.data.TripFromCode.first.authorId,
        tips: response.data.TripFromCode.first.tips,
        transport: response.data.TripFromCode.first.transport,
        startingData: response.data.TripFromCode.first.startingData,
        members: response.data.TripFromCode.first.members,
        inviteCode: response.data.TripFromCode.first.inviteCode);

    return item;
  }

  @override
  Future<List<ProductModel>> getProductsFromIdList(List<String>? list) async {
    List<ProductModel> items = [];
    final response = await dbApi.getAllProductsFromIds(IdList: list!).execute();

    for (var e in response.data.ProductList) {
      items.add(
          ProductModel(id: e.id, name: e.name, storageType: e.storageType));
    }

    return items;
  }

  @override
  Future<List<AllergyModel>> getAllergiesFromIdList(List<String>? list) async {
    List<AllergyModel> items = [];
    final response =
        await dbApi.getAllAllergiesFromIds(IdList: list!).execute();

    for (var e in response.data.AllergiesList) {
      items.add(AllergyModel(id: e.id, name: e.name));
    }

    return items;
  }

  @override
  Future<UserPreferencesModel> getUserPreferencesWithAuthID(
      String authId) async {
    final response =
        await dbApi.getUserPreferences(userAuthId: authId).execute();
    UserPreferencesModel userPref = UserPreferencesModel(
      id: response.data.PreferenceFromAuthId.first.id,
      userId: response.data.PreferenceFromAuthId.first.userId,
      hatedProduct: response.data.PreferenceFromAuthId.first.hatedProduct,
      allergies: response.data.PreferenceFromAuthId.first.allergies,
    );
    return userPref;
  }

  @override
  Future<UserModel> getUserDataWithAuthId(String authId) async {
    final response =
        await dbApi.getUserFromAuthId(userAuthId: authId).execute();

    final UserModel user = UserModel(
        id: response.data.UserFromAuthId.first.id,
        authId: response.data.UserFromAuthId.first.authId,
        name: response.data.UserFromAuthId.first.name,
        email: response.data.UserFromAuthId.first.email);
    return user;
  }

  @override
  Future<List<ProductModel>> getAllProductFromDB() async {
    final response = await dbApi.getAllProducts().execute();
    List<ProductModel> items = [];
    for (var e in response.data.products) {
      items.add(
          ProductModel(id: e.id, name: e.name, storageType: e.storageType));
    }
    return items;
  }

  @override
  Future<List<AllergyModel>> getAllAllergiesFromDB() async {
    final response = await dbApi.getAllAllergies().execute();
    List<AllergyModel> items = [];
    for (var e in response.data.allergies) {
      items.add(AllergyModel(id: e.id, name: e.name));
    }
    return items;
  }
}
