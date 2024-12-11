part of sail_away_api;

class GetAllUsersPreferencesVariablesBuilder {
  
  
  FirebaseDataConnect _dataConnect;
  
  GetAllUsersPreferencesVariablesBuilder(this._dataConnect, );
  Deserializer<GetAllUsersPreferencesData> dataDeserializer = (dynamic json)  => GetAllUsersPreferencesData.fromJson(jsonDecode(json));
  
  Future<QueryResult<GetAllUsersPreferencesData, void>> execute() {
    return this.ref().execute();
  }
  QueryRef<GetAllUsersPreferencesData, void> ref() {
    
    return _dataConnect.query("GetAllUsersPreferences", dataDeserializer, emptySerializer, null);
  }
}


  class GetAllUsersPreferencesUserPreferences {
  
   String id;

  
   String? userId;

  
   List<String>? hatedProduct;

  
   List<String>? allergies;

  
  
    
    
    
    GetAllUsersPreferencesUserPreferences.fromJson(dynamic json):
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

  GetAllUsersPreferencesUserPreferences({
    
      required this.id,
    
       this.userId,
    
       this.hatedProduct,
    
       this.allergies,
    
  });
}



  class GetAllUsersPreferencesData {
  
   List<GetAllUsersPreferencesUserPreferences> userPreferences;

  
  
    
    
    
    GetAllUsersPreferencesData.fromJson(dynamic json):
        userPreferences = 
 
    
      (json['userPreferences'] as List<dynamic>)
        .map((e) => GetAllUsersPreferencesUserPreferences.fromJson(e))
        .toList()
    
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['userPreferences'] = 
  
    
      userPreferences.map((e) => e.toJson()).toList()
    
  
;
      
    
    return json;
  }

  GetAllUsersPreferencesData({
    
      required this.userPreferences,
    
  });
}







