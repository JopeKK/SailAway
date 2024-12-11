part of sail_away_api;

class BasicTipsPackVariablesBuilder {
  
  
  FirebaseDataConnect _dataConnect;
  
  BasicTipsPackVariablesBuilder(this._dataConnect, );
  Deserializer<BasicTipsPackData> dataDeserializer = (dynamic json)  => BasicTipsPackData.fromJson(jsonDecode(json));
  
  Future<OperationResult<BasicTipsPackData, void>> execute() {
    return this.ref().execute();
  }
  MutationRef<BasicTipsPackData, void> ref() {
    
    return _dataConnect.mutation("BasicTipsPack", dataDeserializer, emptySerializer, null);
  }
}


  class BasicTipsPackTipInsertMany {
  
   String id;

  
  
    
    
    
    BasicTipsPackTipInsertMany.fromJson(dynamic json):
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

  BasicTipsPackTipInsertMany({
    
      required this.id,
    
  });
}



  class BasicTipsPackData {
  
   List<BasicTipsPackTipInsertMany> tip_insertMany;

  
  
    
    
    
    BasicTipsPackData.fromJson(dynamic json):
        tip_insertMany = 
 
    
      (json['tip_insertMany'] as List<dynamic>)
        .map((e) => BasicTipsPackTipInsertMany.fromJson(e))
        .toList()
    
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['tip_insertMany'] = 
  
    
      tip_insertMany.map((e) => e.toJson()).toList()
    
  
;
      
    
    return json;
  }

  BasicTipsPackData({
    
      required this.tip_insertMany,
    
  });
}







