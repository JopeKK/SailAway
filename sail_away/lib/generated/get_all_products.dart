part of sail_away_api;

class GetAllProductsVariablesBuilder {
  
  
  FirebaseDataConnect _dataConnect;
  
  GetAllProductsVariablesBuilder(this._dataConnect, );
  Deserializer<GetAllProductsData> dataDeserializer = (dynamic json)  => GetAllProductsData.fromJson(jsonDecode(json));
  
  Future<QueryResult<GetAllProductsData, void>> execute() {
    return this.ref().execute();
  }
  QueryRef<GetAllProductsData, void> ref() {
    
    return _dataConnect.query("GetAllProducts", dataDeserializer, emptySerializer, null);
  }
}


  class GetAllProductsProducts {
  
   String id;

  
   String name;

  
   String storageType;

  
  
    
    
    
    GetAllProductsProducts.fromJson(dynamic json):
        id = 
 
    nativeFromJson<String>(json['id'])
  

        
        ,
      
        name = 
 
    nativeFromJson<String>(json['name'])
  

        
        ,
      
        storageType = 
 
    nativeFromJson<String>(json['storageType'])
  

        
        
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
      
    
      
      json['storageType'] = 
  
    nativeToJson<String>(storageType)
    
;
      
    
    return json;
  }

  GetAllProductsProducts({
    
      required this.id,
    
      required this.name,
    
      required this.storageType,
    
  });
}



  class GetAllProductsData {
  
   List<GetAllProductsProducts> products;

  
  
    
    
    
    GetAllProductsData.fromJson(dynamic json):
        products = 
 
    
      (json['products'] as List<dynamic>)
        .map((e) => GetAllProductsProducts.fromJson(e))
        .toList()
    
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['products'] = 
  
    
      products.map((e) => e.toJson()).toList()
    
  
;
      
    
    return json;
  }

  GetAllProductsData({
    
      required this.products,
    
  });
}







