part of sail_away_api;

class GetUsersFromTripWithTripIdVariablesBuilder {
  String id;

  
  FirebaseDataConnect _dataConnect;
  
  GetUsersFromTripWithTripIdVariablesBuilder(this._dataConnect, {required String this.id,});
  Deserializer<GetUsersFromTripWithTripIdData> dataDeserializer = (dynamic json)  => GetUsersFromTripWithTripIdData.fromJson(jsonDecode(json));
  Serializer<GetUsersFromTripWithTripIdVariables> varsSerializer = (GetUsersFromTripWithTripIdVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetUsersFromTripWithTripIdData, GetUsersFromTripWithTripIdVariables>> execute() {
    return this.ref().execute();
  }
  QueryRef<GetUsersFromTripWithTripIdData, GetUsersFromTripWithTripIdVariables> ref() {
    GetUsersFromTripWithTripIdVariables vars=GetUsersFromTripWithTripIdVariables(id: id,);

    return _dataConnect.query("GetUsersFromTripWithTripId", dataDeserializer, varsSerializer, vars);
  }
}


  class GetUsersFromTripWithTripIdUsersFromTrip {
  
   List<String>? members;

  
  
    
    
    
    GetUsersFromTripWithTripIdUsersFromTrip.fromJson(dynamic json):
        members = json['members'] == null ? null : 
 
    
      (json['members'] as List<dynamic>)
        .map((e) => nativeFromJson<String>(e))
        .toList()
    
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
        if (members != null) {
          json['members'] = 
  
    
      members?.map((e) => nativeToJson<String>(e)).toList()
    
  
;
        }
      
    
    return json;
  }

  GetUsersFromTripWithTripIdUsersFromTrip({
    
       this.members,
    
  });
}



  class GetUsersFromTripWithTripIdData {
  
   List<GetUsersFromTripWithTripIdUsersFromTrip> UsersFromTrip;

  
  
    
    
    
    GetUsersFromTripWithTripIdData.fromJson(dynamic json):
        UsersFromTrip = 
 
    
      (json['UsersFromTrip'] as List<dynamic>)
        .map((e) => GetUsersFromTripWithTripIdUsersFromTrip.fromJson(e))
        .toList()
    
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['UsersFromTrip'] = 
  
    
      UsersFromTrip.map((e) => e.toJson()).toList()
    
  
;
      
    
    return json;
  }

  GetUsersFromTripWithTripIdData({
    
      required this.UsersFromTrip,
    
  });
}



  class GetUsersFromTripWithTripIdVariables {
  
   String id;

  
  
    
    
     @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
    
    
    GetUsersFromTripWithTripIdVariables.fromJson(Map<String, dynamic> json):
        id = 
 
    nativeFromJson<String>(json['id'])
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['id'] = 
  
    nativeToJson<String>(id)
    
;
      
    
    return json;
  }

  GetUsersFromTripWithTripIdVariables({
    
      required this.id,
    
  });
}







