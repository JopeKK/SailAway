part of sail_away_api;

class GetTransportByTripIdVariablesBuilder {
  String tripId;

  
  FirebaseDataConnect _dataConnect;
  
  GetTransportByTripIdVariablesBuilder(this._dataConnect, {required String this.tripId,});
  Deserializer<GetTransportByTripIdData> dataDeserializer = (dynamic json)  => GetTransportByTripIdData.fromJson(jsonDecode(json));
  Serializer<GetTransportByTripIdVariables> varsSerializer = (GetTransportByTripIdVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetTransportByTripIdData, GetTransportByTripIdVariables>> execute() {
    return this.ref().execute();
  }
  QueryRef<GetTransportByTripIdData, GetTransportByTripIdVariables> ref() {
    GetTransportByTripIdVariables vars=GetTransportByTripIdVariables(tripId: tripId,);

    return _dataConnect.query("GetTransportByTripId", dataDeserializer, varsSerializer, vars);
  }
}


  class GetTransportByTripIdTransportByTripId {
  
   String id;

  
   String tripId;

  
   List<String> members;

  
   String type;

  
  
    
    
    
    GetTransportByTripIdTransportByTripId.fromJson(dynamic json):
        id = 
 
    nativeFromJson<String>(json['id'])
  

        
        ,
      
        tripId = 
 
    nativeFromJson<String>(json['tripId'])
  

        
        ,
      
        members = 
 
    
      (json['members'] as List<dynamic>)
        .map((e) => nativeFromJson<String>(e))
        .toList()
    
  

        
        ,
      
        type = 
 
    nativeFromJson<String>(json['type'])
  

        
        
       {
      
        
      
        
      
        
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['id'] = 
  
    nativeToJson<String>(id)
    
;
      
    
      
      json['tripId'] = 
  
    nativeToJson<String>(tripId)
    
;
      
    
      
      json['members'] = 
  
    
      members.map((e) => nativeToJson<String>(e)).toList()
    
  
;
      
    
      
      json['type'] = 
  
    nativeToJson<String>(type)
    
;
      
    
    return json;
  }

  GetTransportByTripIdTransportByTripId({
    
      required this.id,
    
      required this.tripId,
    
      required this.members,
    
      required this.type,
    
  });
}



  class GetTransportByTripIdData {
  
   List<GetTransportByTripIdTransportByTripId> TransportByTripId;

  
  
    
    
    
    GetTransportByTripIdData.fromJson(dynamic json):
        TransportByTripId = 
 
    
      (json['TransportByTripId'] as List<dynamic>)
        .map((e) => GetTransportByTripIdTransportByTripId.fromJson(e))
        .toList()
    
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['TransportByTripId'] = 
  
    
      TransportByTripId.map((e) => e.toJson()).toList()
    
  
;
      
    
    return json;
  }

  GetTransportByTripIdData({
    
      required this.TransportByTripId,
    
  });
}



  class GetTransportByTripIdVariables {
  
   String tripId;

  
  
    
    
     @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
    
    
    GetTransportByTripIdVariables.fromJson(Map<String, dynamic> json):
        tripId = 
 
    nativeFromJson<String>(json['tripId'])
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['tripId'] = 
  
    nativeToJson<String>(tripId)
    
;
      
    
    return json;
  }

  GetTransportByTripIdVariables({
    
      required this.tripId,
    
  });
}







