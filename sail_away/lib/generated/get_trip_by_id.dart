part of sail_away_api;

class GetTripByIdVariablesBuilder {
  String id;

  
  FirebaseDataConnect _dataConnect;
  
  GetTripByIdVariablesBuilder(this._dataConnect, {required String this.id,});
  Deserializer<GetTripByIdData> dataDeserializer = (dynamic json)  => GetTripByIdData.fromJson(jsonDecode(json));
  Serializer<GetTripByIdVariables> varsSerializer = (GetTripByIdVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetTripByIdData, GetTripByIdVariables>> execute() {
    return this.ref().execute();
  }
  QueryRef<GetTripByIdData, GetTripByIdVariables> ref() {
    GetTripByIdVariables vars=GetTripByIdVariables(id: id,);

    return _dataConnect.query("GetTripById", dataDeserializer, varsSerializer, vars);
  }
}


  class GetTripByIdTripFromId {
  
   String id;

  
   String name;

  
   String authorId;

  
   bool tips;

  
   bool transport;

  
   DateTime startingData;

  
   String inviteCode;

  
   List<String>? members;

  
  
    
    
    
    GetTripByIdTripFromId.fromJson(dynamic json):
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

  GetTripByIdTripFromId({
    
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



  class GetTripByIdData {
  
   List<GetTripByIdTripFromId> TripFromId;

  
  
    
    
    
    GetTripByIdData.fromJson(dynamic json):
        TripFromId = 
 
    
      (json['TripFromId'] as List<dynamic>)
        .map((e) => GetTripByIdTripFromId.fromJson(e))
        .toList()
    
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['TripFromId'] = 
  
    
      TripFromId.map((e) => e.toJson()).toList()
    
  
;
      
    
    return json;
  }

  GetTripByIdData({
    
      required this.TripFromId,
    
  });
}



  class GetTripByIdVariables {
  
   String id;

  
  
    
    
     @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
    
    
    GetTripByIdVariables.fromJson(Map<String, dynamic> json):
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

  GetTripByIdVariables({
    
      required this.id,
    
  });
}







