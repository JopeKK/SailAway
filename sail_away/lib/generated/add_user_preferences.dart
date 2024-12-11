part of sail_away_api;

class AddUserPreferencesVariablesBuilder {
  String userId;
List<String> hatedProduct;
List<String> allergies;

  
  FirebaseDataConnect _dataConnect;
  
  AddUserPreferencesVariablesBuilder(this._dataConnect, {required String this.userId,required List<String> this.hatedProduct,required List<String> this.allergies,});
  Deserializer<AddUserPreferencesData> dataDeserializer = (dynamic json)  => AddUserPreferencesData.fromJson(jsonDecode(json));
  Serializer<AddUserPreferencesVariables> varsSerializer = (AddUserPreferencesVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<AddUserPreferencesData, AddUserPreferencesVariables>> execute() {
    return this.ref().execute();
  }
  MutationRef<AddUserPreferencesData, AddUserPreferencesVariables> ref() {
    AddUserPreferencesVariables vars=AddUserPreferencesVariables(userId: userId,hatedProduct: hatedProduct,allergies: allergies,);

    return _dataConnect.mutation("AddUserPreferences", dataDeserializer, varsSerializer, vars);
  }
}


  class AddUserPreferencesUserPreferenceInsert {
  
   String id;

  
  
    
    
    
    AddUserPreferencesUserPreferenceInsert.fromJson(dynamic json):
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

  AddUserPreferencesUserPreferenceInsert({
    
      required this.id,
    
  });
}



  class AddUserPreferencesData {
  
   AddUserPreferencesUserPreferenceInsert userPreference_insert;

  
  
    
    
    
    AddUserPreferencesData.fromJson(dynamic json):
        userPreference_insert = 
 
    AddUserPreferencesUserPreferenceInsert.fromJson(json['userPreference_insert'])
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['userPreference_insert'] = 
  
      userPreference_insert.toJson()
  
;
      
    
    return json;
  }

  AddUserPreferencesData({
    
      required this.userPreference_insert,
    
  });
}



  class AddUserPreferencesVariables {
  
   String userId;

  
   List<String> hatedProduct;

  
   List<String> allergies;

  
  
    
    
     @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
    
    
    AddUserPreferencesVariables.fromJson(Map<String, dynamic> json):
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

  AddUserPreferencesVariables({
    
      required this.userId,
    
      required this.hatedProduct,
    
      required this.allergies,
    
  });
}







