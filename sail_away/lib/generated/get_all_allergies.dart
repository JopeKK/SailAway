part of sail_away_api;

class GetAllAllergiesVariablesBuilder {
  
  
  FirebaseDataConnect _dataConnect;
  
  GetAllAllergiesVariablesBuilder(this._dataConnect, );
  Deserializer<GetAllAllergiesData> dataDeserializer = (dynamic json)  => GetAllAllergiesData.fromJson(jsonDecode(json));
  
  Future<QueryResult<GetAllAllergiesData, void>> execute() {
    return this.ref().execute();
  }
  QueryRef<GetAllAllergiesData, void> ref() {
    
    return _dataConnect.query("GetAllAllergies", dataDeserializer, emptySerializer, null);
  }
}


  class GetAllAllergiesAllergies {
  
   String id;

  
   String name;

  
  
    
    
    
    GetAllAllergiesAllergies.fromJson(dynamic json):
        id = 
 
    nativeFromJson<String>(json['id'])
  

        
        ,
      
        name = 
 
    nativeFromJson<String>(json['name'])
  

        
        
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
      
    
    return json;
  }

  GetAllAllergiesAllergies({
    
      required this.id,
    
      required this.name,
    
  });
}



  class GetAllAllergiesData {
  
   List<GetAllAllergiesAllergies> allergies;

  
  
    
    
    
    GetAllAllergiesData.fromJson(dynamic json):
        allergies = 
 
    
      (json['allergies'] as List<dynamic>)
        .map((e) => GetAllAllergiesAllergies.fromJson(e))
        .toList()
    
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['allergies'] = 
  
    
      allergies.map((e) => e.toJson()).toList()
    
  
;
      
    
    return json;
  }

  GetAllAllergiesData({
    
      required this.allergies,
    
  });
}







