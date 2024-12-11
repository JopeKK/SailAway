part of sail_away_api;

class RemoveTripByIdVariablesBuilder {
  String id;

  
  FirebaseDataConnect _dataConnect;
  
  RemoveTripByIdVariablesBuilder(this._dataConnect, {required String this.id,});
  Deserializer<RemoveTripByIdData> dataDeserializer = (dynamic json)  => RemoveTripByIdData.fromJson(jsonDecode(json));
  Serializer<RemoveTripByIdVariables> varsSerializer = (RemoveTripByIdVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<RemoveTripByIdData, RemoveTripByIdVariables>> execute() {
    return this.ref().execute();
  }
  MutationRef<RemoveTripByIdData, RemoveTripByIdVariables> ref() {
    RemoveTripByIdVariables vars=RemoveTripByIdVariables(id: id,);

    return _dataConnect.mutation("removeTripById", dataDeserializer, varsSerializer, vars);
  }
}


  class RemoveTripByIdTripDelete {
  
   String id;

  
  
    
    
    
    RemoveTripByIdTripDelete.fromJson(dynamic json):
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

  RemoveTripByIdTripDelete({
    
      required this.id,
    
  });
}



  class RemoveTripByIdData {
  
   RemoveTripByIdTripDelete? trip_delete;

  
  
    
    
    
    RemoveTripByIdData.fromJson(dynamic json):
        trip_delete = json['trip_delete'] == null ? null : 
 
    RemoveTripByIdTripDelete.fromJson(json['trip_delete'])
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
        if (trip_delete != null) {
          json['trip_delete'] = 
  
      trip_delete!.toJson()
  
;
        }
      
    
    return json;
  }

  RemoveTripByIdData({
    
       this.trip_delete,
    
  });
}



  class RemoveTripByIdVariables {
  
   String id;

  
  
    
    
     @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
    
    
    RemoveTripByIdVariables.fromJson(Map<String, dynamic> json):
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

  RemoveTripByIdVariables({
    
      required this.id,
    
  });
}







