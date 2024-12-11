part of sail_away_api;

class GetAllTransportsVariablesBuilder {
  
  
  FirebaseDataConnect _dataConnect;
  
  GetAllTransportsVariablesBuilder(this._dataConnect, );
  Deserializer<GetAllTransportsData> dataDeserializer = (dynamic json)  => GetAllTransportsData.fromJson(jsonDecode(json));
  
  Future<QueryResult<GetAllTransportsData, void>> execute() {
    return this.ref().execute();
  }
  QueryRef<GetAllTransportsData, void> ref() {
    
    return _dataConnect.query("GetAllTransports", dataDeserializer, emptySerializer, null);
  }
}


  class GetAllTransportsTransports {
  
   String id;

  
   String tripId;

  
   List<String> members;

  
   String type;

  
  
    
    
    
    GetAllTransportsTransports.fromJson(dynamic json):
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

  GetAllTransportsTransports({
    
      required this.id,
    
      required this.tripId,
    
      required this.members,
    
      required this.type,
    
  });
}



  class GetAllTransportsData {
  
   List<GetAllTransportsTransports> transports;

  
  
    
    
    
    GetAllTransportsData.fromJson(dynamic json):
        transports = 
 
    
      (json['transports'] as List<dynamic>)
        .map((e) => GetAllTransportsTransports.fromJson(e))
        .toList()
    
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['transports'] = 
  
    
      transports.map((e) => e.toJson()).toList()
    
  
;
      
    
    return json;
  }

  GetAllTransportsData({
    
      required this.transports,
    
  });
}







