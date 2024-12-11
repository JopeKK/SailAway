part of sail_away_api;

class GetTransportByIdVariablesBuilder {
  String transportId;

  
  FirebaseDataConnect _dataConnect;
  
  GetTransportByIdVariablesBuilder(this._dataConnect, {required String this.transportId,});
  Deserializer<GetTransportByIdData> dataDeserializer = (dynamic json)  => GetTransportByIdData.fromJson(jsonDecode(json));
  Serializer<GetTransportByIdVariables> varsSerializer = (GetTransportByIdVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetTransportByIdData, GetTransportByIdVariables>> execute() {
    return this.ref().execute();
  }
  QueryRef<GetTransportByIdData, GetTransportByIdVariables> ref() {
    GetTransportByIdVariables vars=GetTransportByIdVariables(transportId: transportId,);

    return _dataConnect.query("getTransportById", dataDeserializer, varsSerializer, vars);
  }
}


  class GetTransportByIdTransportByTripId {
  
   String id;

  
   String tripId;

  
   List<String> members;

  
   String type;

  
  
    
    
    
    GetTransportByIdTransportByTripId.fromJson(dynamic json):
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

  GetTransportByIdTransportByTripId({
    
      required this.id,
    
      required this.tripId,
    
      required this.members,
    
      required this.type,
    
  });
}



  class GetTransportByIdData {
  
   List<GetTransportByIdTransportByTripId> TransportByTripId;

  
  
    
    
    
    GetTransportByIdData.fromJson(dynamic json):
        TransportByTripId = 
 
    
      (json['TransportByTripId'] as List<dynamic>)
        .map((e) => GetTransportByIdTransportByTripId.fromJson(e))
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

  GetTransportByIdData({
    
      required this.TransportByTripId,
    
  });
}



  class GetTransportByIdVariables {
  
   String transportId;

  
  
    
    
     @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
    
    
    GetTransportByIdVariables.fromJson(Map<String, dynamic> json):
        transportId = 
 
    nativeFromJson<String>(json['transportId'])
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['transportId'] = 
  
    nativeToJson<String>(transportId)
    
;
      
    
    return json;
  }

  GetTransportByIdVariables({
    
      required this.transportId,
    
  });
}







