part of sail_away_api;

class GetUserPreferencesVariablesBuilder {
  String userAuthId;

  
  FirebaseDataConnect _dataConnect;
  
  GetUserPreferencesVariablesBuilder(this._dataConnect, {required String this.userAuthId,});
  Deserializer<GetUserPreferencesData> dataDeserializer = (dynamic json)  => GetUserPreferencesData.fromJson(jsonDecode(json));
  Serializer<GetUserPreferencesVariables> varsSerializer = (GetUserPreferencesVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetUserPreferencesData, GetUserPreferencesVariables>> execute() {
    return this.ref().execute();
  }
  QueryRef<GetUserPreferencesData, GetUserPreferencesVariables> ref() {
    GetUserPreferencesVariables vars=GetUserPreferencesVariables(userAuthId: userAuthId,);

    return _dataConnect.query("GetUserPreferences", dataDeserializer, varsSerializer, vars);
  }
}


  class GetUserPreferencesPreferenceFromAuthId {
  
   String id;

  
   String? userId;

  
   List<String>? hatedProduct;

  
   List<String>? allergies;

  
  
    
    
    
    GetUserPreferencesPreferenceFromAuthId.fromJson(dynamic json):
        id = 
 
    nativeFromJson<String>(json['id'])
  

        
        ,
      
        userId = json['userId'] == null ? null : 
 
    nativeFromJson<String>(json['userId'])
  

        
        ,
      
        hatedProduct = json['hatedProduct'] == null ? null : 
 
    
      (json['hatedProduct'] as List<dynamic>)
        .map((e) => nativeFromJson<String>(e))
        .toList()
    
  

        
        ,
      
        allergies = json['allergies'] == null ? null : 
 
    
      (json['allergies'] as List<dynamic>)
        .map((e) => nativeFromJson<String>(e))
        .toList()
    
  

        
        
       {
      
        
      
        
      
        
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['id'] = 
  
    nativeToJson<String>(id)
    
;
      
    
      
        if (userId != null) {
          json['userId'] = 
  
    nativeToJson<String?>(userId)
    
;
        }
      
    
      
        if (hatedProduct != null) {
          json['hatedProduct'] = 
  
    
      hatedProduct?.map((e) => nativeToJson<String>(e)).toList()
    
  
;
        }
      
    
      
        if (allergies != null) {
          json['allergies'] = 
  
    
      allergies?.map((e) => nativeToJson<String>(e)).toList()
    
  
;
        }
      
    
    return json;
  }

  GetUserPreferencesPreferenceFromAuthId({
    
      required this.id,
    
       this.userId,
    
       this.hatedProduct,
    
       this.allergies,
    
  });
}



  class GetUserPreferencesData {
  
   List<GetUserPreferencesPreferenceFromAuthId> PreferenceFromAuthId;

  
  
    
    
    
    GetUserPreferencesData.fromJson(dynamic json):
        PreferenceFromAuthId = 
 
    
      (json['PreferenceFromAuthId'] as List<dynamic>)
        .map((e) => GetUserPreferencesPreferenceFromAuthId.fromJson(e))
        .toList()
    
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['PreferenceFromAuthId'] = 
  
    
      PreferenceFromAuthId.map((e) => e.toJson()).toList()
    
  
;
      
    
    return json;
  }

  GetUserPreferencesData({
    
      required this.PreferenceFromAuthId,
    
  });
}



  class GetUserPreferencesVariables {
  
   String userAuthId;

  
  
    
    
     @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
    
    
    GetUserPreferencesVariables.fromJson(Map<String, dynamic> json):
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

  GetUserPreferencesVariables({
    
      required this.userAuthId,
    
  });
}







