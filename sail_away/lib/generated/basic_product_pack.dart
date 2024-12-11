part of sail_away_api;

class BasicProductPackVariablesBuilder {
  
  
  FirebaseDataConnect _dataConnect;
  
  BasicProductPackVariablesBuilder(this._dataConnect, );
  Deserializer<BasicProductPackData> dataDeserializer = (dynamic json)  => BasicProductPackData.fromJson(jsonDecode(json));
  
  Future<OperationResult<BasicProductPackData, void>> execute() {
    return this.ref().execute();
  }
  MutationRef<BasicProductPackData, void> ref() {
    
    return _dataConnect.mutation("BasicProductPack", dataDeserializer, emptySerializer, null);
  }
}


  class BasicProductPackProductInsertMany {
  
   String id;

  
  
    
    
    
    BasicProductPackProductInsertMany.fromJson(dynamic json):
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

  BasicProductPackProductInsertMany({
    
      required this.id,
    
  });
}



  class BasicProductPackData {
  
   List<BasicProductPackProductInsertMany> product_insertMany;

  
  
    
    
    
    BasicProductPackData.fromJson(dynamic json):
        product_insertMany = 
 
    
      (json['product_insertMany'] as List<dynamic>)
        .map((e) => BasicProductPackProductInsertMany.fromJson(e))
        .toList()
    
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['product_insertMany'] = 
  
    
      product_insertMany.map((e) => e.toJson()).toList()
    
  
;
      
    
    return json;
  }

  BasicProductPackData({
    
      required this.product_insertMany,
    
  });
}







