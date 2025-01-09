library sail_away_api;
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'dart:convert';

part 'create_user.dart';

part 'change_trip_member.dart';

part 'add_transport.dart';

part 'change_transport_member.dart';

part 'remove_transport_by_id.dart';

part 'remove_trip_by_id.dart';

part 'remove_all_trips.dart';

part 'create_trip.dart';

part 'add_user_preferences.dart';

part 'change_user_preferences.dart';

part 'basic_tips_pack.dart';

part 'basic_product_pack.dart';

part 'basic_allergy_pack.dart';

part 'get_all_users.dart';

part 'get_all_trips.dart';

part 'get_all_tips.dart';

part 'get_all_transports.dart';

part 'get_users_from_trip_with_trip_id.dart';

part 'get_users_from_members_list.dart';

part 'get_transport_by_trip_id.dart';

part 'get_transport_by_id.dart';

part 'get_trip_by_id.dart';

part 'get_trip_with_invite_code.dart';

part 'get_user_from_auth_id.dart';

part 'get_all_products.dart';

part 'get_all_allergies.dart';

part 'get_all_users_preferences.dart';

part 'get_user_preferences.dart';

part 'get_all_allergies_from_ids.dart';

part 'get_all_products_from_ids.dart';







class SailAwayApiConnector {
  
  
  CreateUserVariablesBuilder createUser ({required String authId,required String name,required String email,}) {
    return CreateUserVariablesBuilder(dataConnect, authId: authId,name: name,email: email,);
  }
  
  
  ChangeTripMemberVariablesBuilder changeTripMember ({required List<String> newMembers,required String id,}) {
    return ChangeTripMemberVariablesBuilder(dataConnect, newMembers: newMembers,id: id,);
  }
  
  
  AddTransportVariablesBuilder addTransport ({required List<String> members,required String tripId,required String type,}) {
    return AddTransportVariablesBuilder(dataConnect, members: members,tripId: tripId,type: type,);
  }
  
  
  ChangeTransportMemberVariablesBuilder changeTransportMember ({required List<String> members,required String transportId,}) {
    return ChangeTransportMemberVariablesBuilder(dataConnect, members: members,transportId: transportId,);
  }
  
  
  RemoveTransportByIdVariablesBuilder removeTransportById ({required String transportId,}) {
    return RemoveTransportByIdVariablesBuilder(dataConnect, transportId: transportId,);
  }
  
  
  RemoveTripByIdVariablesBuilder removeTripById ({required String id,}) {
    return RemoveTripByIdVariablesBuilder(dataConnect, id: id,);
  }
  
  
  RemoveAllTripsVariablesBuilder removeAllTrips () {
    return RemoveAllTripsVariablesBuilder(dataConnect, );
  }
  
  
  CreateTripVariablesBuilder createTrip ({required String authorId,required String name,required bool tips,required bool transport,required DateTime startingData,required String inviteCode,required List<String> members,}) {
    return CreateTripVariablesBuilder(dataConnect, authorId: authorId,name: name,tips: tips,transport: transport,startingData: startingData,inviteCode: inviteCode,members: members,);
  }
  
  
  AddUserPreferencesVariablesBuilder addUserPreferences ({required String userId,required List<String> hatedProduct,required List<String> allergies,}) {
    return AddUserPreferencesVariablesBuilder(dataConnect, userId: userId,hatedProduct: hatedProduct,allergies: allergies,);
  }
  
  
  ChangeUserPreferencesVariablesBuilder changeUserPreferences ({required String userId,required List<String> hatedProduct,required List<String> allergies,}) {
    return ChangeUserPreferencesVariablesBuilder(dataConnect, userId: userId,hatedProduct: hatedProduct,allergies: allergies,);
  }
  
  
  BasicTipsPackVariablesBuilder basicTipsPack () {
    return BasicTipsPackVariablesBuilder(dataConnect, );
  }
  
  
  BasicProductPackVariablesBuilder basicProductPack () {
    return BasicProductPackVariablesBuilder(dataConnect, );
  }
  
  
  BasicAllergyPackVariablesBuilder basicAllergyPack () {
    return BasicAllergyPackVariablesBuilder(dataConnect, );
  }
  
  
  GetAllUsersVariablesBuilder getAllUsers () {
    return GetAllUsersVariablesBuilder(dataConnect, );
  }
  
  
  GetAllTripsVariablesBuilder getAllTrips () {
    return GetAllTripsVariablesBuilder(dataConnect, );
  }
  
  
  GetAllTipsVariablesBuilder getAllTips () {
    return GetAllTipsVariablesBuilder(dataConnect, );
  }
  
  
  GetAllTransportsVariablesBuilder getAllTransports () {
    return GetAllTransportsVariablesBuilder(dataConnect, );
  }
  
  
  GetUsersFromTripWithTripIdVariablesBuilder getUsersFromTripWithTripId ({required String id,}) {
    return GetUsersFromTripWithTripIdVariablesBuilder(dataConnect, id: id,);
  }
  
  
  GetUsersFromMembersListVariablesBuilder getUsersFromMembersList ({required List<String> members,}) {
    return GetUsersFromMembersListVariablesBuilder(dataConnect, members: members,);
  }
  
  
  GetTransportByTripIdVariablesBuilder getTransportByTripId ({required String tripId,}) {
    return GetTransportByTripIdVariablesBuilder(dataConnect, tripId: tripId,);
  }
  
  
  GetTransportByIdVariablesBuilder getTransportById ({required String transportId,}) {
    return GetTransportByIdVariablesBuilder(dataConnect, transportId: transportId,);
  }
  
  
  GetTripByIdVariablesBuilder getTripById ({required String id,}) {
    return GetTripByIdVariablesBuilder(dataConnect, id: id,);
  }
  
  
  GetTripWithInviteCodeVariablesBuilder getTripWithInviteCode ({required String code,}) {
    return GetTripWithInviteCodeVariablesBuilder(dataConnect, code: code,);
  }
  
  
  GetUserFromAuthIdVariablesBuilder getUserFromAuthId ({required String userAuthId,}) {
    return GetUserFromAuthIdVariablesBuilder(dataConnect, userAuthId: userAuthId,);
  }
  
  
  GetAllProductsVariablesBuilder getAllProducts () {
    return GetAllProductsVariablesBuilder(dataConnect, );
  }
  
  
  GetAllAllergiesVariablesBuilder getAllAllergies () {
    return GetAllAllergiesVariablesBuilder(dataConnect, );
  }
  
  
  GetAllUsersPreferencesVariablesBuilder getAllUsersPreferences () {
    return GetAllUsersPreferencesVariablesBuilder(dataConnect, );
  }
  
  
  GetUserPreferencesVariablesBuilder getUserPreferences ({required String userAuthId,}) {
    return GetUserPreferencesVariablesBuilder(dataConnect, userAuthId: userAuthId,);
  }
  
  
  GetAllAllergiesFromIdsVariablesBuilder getAllAllergiesFromIds ({required List<String> IdList,}) {
    return GetAllAllergiesFromIdsVariablesBuilder(dataConnect, IdList: IdList,);
  }
  
  
  GetAllProductsFromIdsVariablesBuilder getAllProductsFromIds ({required List<String> IdList,}) {
    return GetAllProductsFromIdsVariablesBuilder(dataConnect, IdList: IdList,);
  }
  

  static ConnectorConfig connectorConfig = ConnectorConfig(
    'us-central1',
    'sail_away_api',
    'sail_away',
  );

  SailAwayApiConnector({required this.dataConnect});
  static SailAwayApiConnector get instance {
    return SailAwayApiConnector(
        dataConnect: FirebaseDataConnect.instanceFor(
            connectorConfig: connectorConfig,
            sdkType: CallerSDKType.generated));
  }

  FirebaseDataConnect dataConnect;
}

