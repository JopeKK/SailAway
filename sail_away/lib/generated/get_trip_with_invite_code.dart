part of sail_away_api;

class GetTripWithInviteCodeVariablesBuilder {
  String code;

  
  FirebaseDataConnect _dataConnect;
  
  GetTripWithInviteCodeVariablesBuilder(this._dataConnect, {required String this.code,});
  Deserializer<GetTripWithInviteCodeData> dataDeserializer = (dynamic json)  => GetTripWithInviteCodeData.fromJson(jsonDecode(json));
  Serializer<GetTripWithInviteCodeVariables> varsSerializer = (GetTripWithInviteCodeVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetTripWithInviteCodeData, GetTripWithInviteCodeVariables>> execute() {
    return this.ref().execute();
  }
  QueryRef<GetTripWithInviteCodeData, GetTripWithInviteCodeVariables> ref() {
    GetTripWithInviteCodeVariables vars=GetTripWithInviteCodeVariables(code: code,);

    return _dataConnect.query("GetTripWithInviteCode", dataDeserializer, varsSerializer, vars);
  }
}


  class GetTripWithInviteCodeTripFromCode {
  
   String id;

  
   String name;

  
   String authorId;

  
   bool tips;

  
   bool transport;

  
   DateTime startingData;

  
   String inviteCode;

  
   List<String>? members;

  
  
    
    
    
    GetTripWithInviteCodeTripFromCode.fromJson(dynamic json):
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

  GetTripWithInviteCodeTripFromCode({
    
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



  class GetTripWithInviteCodeData {
  
   List<GetTripWithInviteCodeTripFromCode> TripFromCode;

  
  
    
    
    
    GetTripWithInviteCodeData.fromJson(dynamic json):
        TripFromCode = 
 
    
      (json['TripFromCode'] as List<dynamic>)
        .map((e) => GetTripWithInviteCodeTripFromCode.fromJson(e))
        .toList()
    
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['TripFromCode'] = 
  
    
      TripFromCode.map((e) => e.toJson()).toList()
    
  
;
      
    
    return json;
  }

  GetTripWithInviteCodeData({
    
      required this.TripFromCode,
    
  });
}



  class GetTripWithInviteCodeVariables {
  
   String code;

  
  
    
    
     @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
    
    
    GetTripWithInviteCodeVariables.fromJson(Map<String, dynamic> json):
        code = 
 
    nativeFromJson<String>(json['code'])
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['code'] = 
  
    nativeToJson<String>(code)
    
;
      
    
    return json;
  }

  GetTripWithInviteCodeVariables({
    
      required this.code,
    
  });
}







