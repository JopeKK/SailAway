part of sail_away_api;

class ChangeTripMemberVariablesBuilder {
  List<String> newMembers;
String id;

  
  FirebaseDataConnect _dataConnect;
  
  ChangeTripMemberVariablesBuilder(this._dataConnect, {required List<String> this.newMembers,required String this.id,});
  Deserializer<ChangeTripMemberData> dataDeserializer = (dynamic json)  => ChangeTripMemberData.fromJson(jsonDecode(json));
  Serializer<ChangeTripMemberVariables> varsSerializer = (ChangeTripMemberVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<ChangeTripMemberData, ChangeTripMemberVariables>> execute() {
    return this.ref().execute();
  }
  MutationRef<ChangeTripMemberData, ChangeTripMemberVariables> ref() {
    ChangeTripMemberVariables vars=ChangeTripMemberVariables(newMembers: newMembers,id: id,);

    return _dataConnect.mutation("changeTripMember", dataDeserializer, varsSerializer, vars);
  }
}


  class ChangeTripMemberTripUpdate {
  
   String id;

  
  
    
    
    
    ChangeTripMemberTripUpdate.fromJson(dynamic json):
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

  ChangeTripMemberTripUpdate({
    
      required this.id,
    
  });
}



  class ChangeTripMemberData {
  
   ChangeTripMemberTripUpdate? trip_update;

  
  
    
    
    
    ChangeTripMemberData.fromJson(dynamic json):
        trip_update = json['trip_update'] == null ? null : 
 
    ChangeTripMemberTripUpdate.fromJson(json['trip_update'])
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
        if (trip_update != null) {
          json['trip_update'] = 
  
      trip_update!.toJson()
  
;
        }
      
    
    return json;
  }

  ChangeTripMemberData({
    
       this.trip_update,
    
  });
}



  class ChangeTripMemberVariables {
  
   List<String> newMembers;

  
   String id;

  
  
    
    
     @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
    
    
    ChangeTripMemberVariables.fromJson(Map<String, dynamic> json):
        newMembers = 
 
    
      (json['newMembers'] as List<dynamic>)
        .map((e) => nativeFromJson<String>(e))
        .toList()
    
  

        
        ,
      
        id = 
 
    nativeFromJson<String>(json['id'])
  

        
        
       {
      
        
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['newMembers'] = 
  
    
      newMembers.map((e) => nativeToJson<String>(e)).toList()
    
  
;
      
    
      
      json['id'] = 
  
    nativeToJson<String>(id)
    
;
      
    
    return json;
  }

  ChangeTripMemberVariables({
    
      required this.newMembers,
    
      required this.id,
    
  });
}







