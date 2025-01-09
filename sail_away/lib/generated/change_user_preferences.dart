part of sail_away_api;

class ChangeUserPreferencesVariablesBuilder {
  String userId;
List<String> hatedProduct;
List<String> allergies;

  
  FirebaseDataConnect _dataConnect;
  
  ChangeUserPreferencesVariablesBuilder(this._dataConnect, {required String this.userId,required List<String> this.hatedProduct,required List<String> this.allergies,});
  Deserializer<ChangeUserPreferencesData> dataDeserializer = (dynamic json)  => ChangeUserPreferencesData.fromJson(jsonDecode(json));
  Serializer<ChangeUserPreferencesVariables> varsSerializer = (ChangeUserPreferencesVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<ChangeUserPreferencesData, ChangeUserPreferencesVariables>> execute() {
    return this.ref().execute();
  }
  MutationRef<ChangeUserPreferencesData, ChangeUserPreferencesVariables> ref() {
    ChangeUserPreferencesVariables vars=ChangeUserPreferencesVariables(userId: userId,hatedProduct: hatedProduct,allergies: allergies,);

    return _dataConnect.mutation("changeUserPreferences", dataDeserializer, varsSerializer, vars);
  }
}


  class ChangeUserPreferencesUserPreferenceUpdate {
  
   String id;

  
  
    
    
    
    ChangeUserPreferencesUserPreferenceUpdate.fromJson(dynamic json):
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

  ChangeUserPreferencesUserPreferenceUpdate({
    
      required this.id,
    
  });
}



  class ChangeUserPreferencesData {
  
   ChangeUserPreferencesUserPreferenceUpdate? userPreference_update;

  
  
    
    
    
    ChangeUserPreferencesData.fromJson(dynamic json):
        userPreference_update = json['userPreference_update'] == null ? null : 
 
    ChangeUserPreferencesUserPreferenceUpdate.fromJson(json['userPreference_update'])
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
        if (userPreference_update != null) {
          json['userPreference_update'] = 
  
      userPreference_update!.toJson()
  
;
        }
      
    
    return json;
  }

  ChangeUserPreferencesData({
    
       this.userPreference_update,
    
  });
}



  class ChangeUserPreferencesVariables {
  
   String userId;

  
   List<String> hatedProduct;

  
   List<String> allergies;

  
  
    
    
     @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
    
    
    ChangeUserPreferencesVariables.fromJson(Map<String, dynamic> json):
        userId = 
 
    nativeFromJson<String>(json['userId'])
  

        
        ,
      
        hatedProduct = 
 
    
      (json['hatedProduct'] as List<dynamic>)
        .map((e) => nativeFromJson<String>(e))
        .toList()
    
  

        
        ,
      
        allergies = 
 
    
      (json['allergies'] as List<dynamic>)
        .map((e) => nativeFromJson<String>(e))
        .toList()
    
  

        
        
       {
      
        
      
        
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['userId'] = 
  
    nativeToJson<String>(userId)
    
;
      
    
      
      json['hatedProduct'] = 
  
    
      hatedProduct.map((e) => nativeToJson<String>(e)).toList()
    
  
;
      
    
      
      json['allergies'] = 
  
    
      allergies.map((e) => nativeToJson<String>(e)).toList()
    
  
;
      
    
    return json;
  }

  ChangeUserPreferencesVariables({
    
      required this.userId,
    
      required this.hatedProduct,
    
      required this.allergies,
    
  });
}







