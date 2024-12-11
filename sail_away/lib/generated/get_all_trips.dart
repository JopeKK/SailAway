part of sail_away_api;

class GetAllTripsVariablesBuilder {
  
  
  FirebaseDataConnect _dataConnect;
  
  GetAllTripsVariablesBuilder(this._dataConnect, );
  Deserializer<GetAllTripsData> dataDeserializer = (dynamic json)  => GetAllTripsData.fromJson(jsonDecode(json));
  
  Future<QueryResult<GetAllTripsData, void>> execute() {
    return this.ref().execute();
  }
  QueryRef<GetAllTripsData, void> ref() {
    
    return _dataConnect.query("GetAllTrips", dataDeserializer, emptySerializer, null);
  }
}


  class GetAllTripsTrips {
  
   String id;

  
   String name;

  
   String authorId;

  
   bool tips;

  
   bool transport;

  
   DateTime startingData;

  
   String inviteCode;

  
   List<String>? members;

  
  
    
    
    
    GetAllTripsTrips.fromJson(dynamic json):
        id = 
 
    nativeFromJson<String>(json['id'])
  

        
        ,
      
        name = 
 
    nativeFromJson<String>(json['name'])
  

        
        ,
      
        authorId = 
 
    nativeFromJson<String>(json['authorId'])
  

        
        ,
      
        tips = 
 
    nativeFromJson<bool>(json['tips'])
  

        
        ,
      
        transport = 
 
    nativeFromJson<bool>(json['transport'])
  

        
        ,
      
        startingData = 
 
    nativeFromJson<DateTime>(json['startingData'])
  

        
        ,
      
        inviteCode = 
 
    nativeFromJson<String>(json['inviteCode'])
  

        
        ,
      
        members = json['members'] == null ? null : 
 
    
      (json['members'] as List<dynamic>)
        .map((e) => nativeFromJson<String>(e))
        .toList()
    
  

        
        
       {
      
        
      
        
      
        
      
        
      
        
      
        
      
        
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['id'] = 
  
    nativeToJson<String>(id)
    
;
      
    
      
      json['name'] = 
  
    nativeToJson<String>(name)
    
;
      
    
      
      json['authorId'] = 
  
    nativeToJson<String>(authorId)
    
;
      
    
      
      json['tips'] = 
  
    nativeToJson<bool>(tips)
    
;
      
    
      
      json['transport'] = 
  
    nativeToJson<bool>(transport)
    
;
      
    
      
      json['startingData'] = 
  
    nativeToJson<DateTime>(startingData)
    
;
      
    
      
      json['inviteCode'] = 
  
    nativeToJson<String>(inviteCode)
    
;
      
    
      
        if (members != null) {
          json['members'] = 
  
    
      members?.map((e) => nativeToJson<String>(e)).toList()
    
  
;
        }
      
    
    return json;
  }

  GetAllTripsTrips({
    
      required this.id,
    
      required this.name,
    
      required this.authorId,
    
      required this.tips,
    
      required this.transport,
    
      required this.startingData,
    
      required this.inviteCode,
    
       this.members,
    
  });
}



  class GetAllTripsData {
  
   List<GetAllTripsTrips> trips;

  
  
    
    
    
    GetAllTripsData.fromJson(dynamic json):
        trips = 
 
    
      (json['trips'] as List<dynamic>)
        .map((e) => GetAllTripsTrips.fromJson(e))
        .toList()
    
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['trips'] = 
  
    
      trips.map((e) => e.toJson()).toList()
    
  
;
      
    
    return json;
  }

  GetAllTripsData({
    
      required this.trips,
    
  });
}







