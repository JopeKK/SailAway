part of sail_away_api;

class BasicAllergyPackVariablesBuilder {
  
  
  FirebaseDataConnect _dataConnect;
  
  BasicAllergyPackVariablesBuilder(this._dataConnect, );
  Deserializer<BasicAllergyPackData> dataDeserializer = (dynamic json)  => BasicAllergyPackData.fromJson(jsonDecode(json));
  
  Future<OperationResult<BasicAllergyPackData, void>> execute() {
    return this.ref().execute();
  }
  MutationRef<BasicAllergyPackData, void> ref() {
    
    return _dataConnect.mutation("BasicAllergyPack", dataDeserializer, emptySerializer, null);
  }
}


  class BasicAllergyPackAllergyInsertMany {
  
   String id;

  
  
    
    
    
    BasicAllergyPackAllergyInsertMany.fromJson(dynamic json):
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

  BasicAllergyPackAllergyInsertMany({
    
      required this.id,
    
  });
}



  class BasicAllergyPackData {
  
   List<BasicAllergyPackAllergyInsertMany> allergy_insertMany;

  
  
    
    
    
    BasicAllergyPackData.fromJson(dynamic json):
        allergy_insertMany = 
 
    
      (json['allergy_insertMany'] as List<dynamic>)
        .map((e) => BasicAllergyPackAllergyInsertMany.fromJson(e))
        .toList()
    
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['allergy_insertMany'] = 
  
    
      allergy_insertMany.map((e) => e.toJson()).toList()
    
  
;
      
    
    return json;
  }

  BasicAllergyPackData({
    
      required this.allergy_insertMany,
    
  });
}







