part of sail_away_api;

class GetAllAllergiesFromIdsVariablesBuilder {
  List<String> IdList;

  
  FirebaseDataConnect _dataConnect;
  
  GetAllAllergiesFromIdsVariablesBuilder(this._dataConnect, {required List<String> this.IdList,});
  Deserializer<GetAllAllergiesFromIdsData> dataDeserializer = (dynamic json)  => GetAllAllergiesFromIdsData.fromJson(jsonDecode(json));
  Serializer<GetAllAllergiesFromIdsVariables> varsSerializer = (GetAllAllergiesFromIdsVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetAllAllergiesFromIdsData, GetAllAllergiesFromIdsVariables>> execute() {
    return this.ref().execute();
  }
  QueryRef<GetAllAllergiesFromIdsData, GetAllAllergiesFromIdsVariables> ref() {
    GetAllAllergiesFromIdsVariables vars=GetAllAllergiesFromIdsVariables(IdList: IdList,);

    return _dataConnect.query("GetAllAllergiesFromIds", dataDeserializer, varsSerializer, vars);
  }
}


  class GetAllAllergiesFromIdsAllergiesList {
  
   String id;

  
   String name;

  
  
    
    
    
    GetAllAllergiesFromIdsAllergiesList.fromJson(dynamic json):
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

  GetAllAllergiesFromIdsAllergiesList({
    
      required this.id,
    
      required this.name,
    
  });
}



  class GetAllAllergiesFromIdsData {
  
   List<GetAllAllergiesFromIdsAllergiesList> AllergiesList;

  
  
    
    
    
    GetAllAllergiesFromIdsData.fromJson(dynamic json):
        AllergiesList = 
 
    
      (json['AllergiesList'] as List<dynamic>)
        .map((e) => GetAllAllergiesFromIdsAllergiesList.fromJson(e))
        .toList()
    
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['AllergiesList'] = 
  
    
      AllergiesList.map((e) => e.toJson()).toList()
    
  
;
      
    
    return json;
  }

  GetAllAllergiesFromIdsData({
    
      required this.AllergiesList,
    
  });
}



  class GetAllAllergiesFromIdsVariables {
  
   List<String> IdList;

  
  
    
    
     @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
    
    
    GetAllAllergiesFromIdsVariables.fromJson(Map<String, dynamic> json):
        IdList = 
 
    
      (json['IdList'] as List<dynamic>)
        .map((e) => nativeFromJson<String>(e))
        .toList()
    
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['IdList'] = 
  
    
      IdList.map((e) => nativeToJson<String>(e)).toList()
    
  
;
      
    
    return json;
  }

  GetAllAllergiesFromIdsVariables({
    
      required this.IdList,
    
  });
}







