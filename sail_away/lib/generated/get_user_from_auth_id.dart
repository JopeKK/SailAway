part of sail_away_api;

class GetUserFromAuthIdVariablesBuilder {
  String userAuthId;

  
  FirebaseDataConnect _dataConnect;
  
  GetUserFromAuthIdVariablesBuilder(this._dataConnect, {required String this.userAuthId,});
  Deserializer<GetUserFromAuthIdData> dataDeserializer = (dynamic json)  => GetUserFromAuthIdData.fromJson(jsonDecode(json));
  Serializer<GetUserFromAuthIdVariables> varsSerializer = (GetUserFromAuthIdVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetUserFromAuthIdData, GetUserFromAuthIdVariables>> execute() {
    return this.ref().execute();
  }
  QueryRef<GetUserFromAuthIdData, GetUserFromAuthIdVariables> ref() {
    GetUserFromAuthIdVariables vars=GetUserFromAuthIdVariables(userAuthId: userAuthId,);

    return _dataConnect.query("GetUserFromAuthId", dataDeserializer, varsSerializer, vars);
  }
}


  class GetUserFromAuthIdUserFromAuthId {
  
   String id;

  
   String authId;

  
   String name;

  
   String email;

  
  
    
    
    
    GetUserFromAuthIdUserFromAuthId.fromJson(dynamic json):
        id = 
 
    nativeFromJson<String>(json['id'])
  

        
        ,
      
        authId = 
 
    nativeFromJson<String>(json['authId'])
  

        
        ,
      
        name = 
 
    nativeFromJson<String>(json['name'])
  

        
        ,
      
        email = 
 
    nativeFromJson<String>(json['email'])
  

        
        
       {
      
        
      
        
      
        
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['id'] = 
  
    nativeToJson<String>(id)
    
;
      
    
      
      json['authId'] = 
  
    nativeToJson<String>(authId)
    
;
      
    
      
      json['name'] = 
  
    nativeToJson<String>(name)
    
;
      
    
      
      json['email'] = 
  
    nativeToJson<String>(email)
    
;
      
    
    return json;
  }

  GetUserFromAuthIdUserFromAuthId({
    
      required this.id,
    
      required this.authId,
    
      required this.name,
    
      required this.email,
    
  });
}



  class GetUserFromAuthIdData {
  
   List<GetUserFromAuthIdUserFromAuthId> UserFromAuthId;

  
  
    
    
    
    GetUserFromAuthIdData.fromJson(dynamic json):
        UserFromAuthId = 
 
    
      (json['UserFromAuthId'] as List<dynamic>)
        .map((e) => GetUserFromAuthIdUserFromAuthId.fromJson(e))
        .toList()
    
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['UserFromAuthId'] = 
  
    
      UserFromAuthId.map((e) => e.toJson()).toList()
    
  
;
      
    
    return json;
  }

  GetUserFromAuthIdData({
    
      required this.UserFromAuthId,
    
  });
}



  class GetUserFromAuthIdVariables {
  
   String userAuthId;

  
  
    
    
     @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
    
    
    GetUserFromAuthIdVariables.fromJson(Map<String, dynamic> json):
        userAuthId = 
 
    nativeFromJson<String>(json['userAuthId'])
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['userAuthId'] = 
  
    nativeToJson<String>(userAuthId)
    
;
      
    
    return json;
  }

  GetUserFromAuthIdVariables({
    
      required this.userAuthId,
    
  });
}







