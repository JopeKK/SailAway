part of sail_away_api;

class GetAllProductsFromIdsVariablesBuilder {
  List<String> IdList;

  
  FirebaseDataConnect _dataConnect;
  
  GetAllProductsFromIdsVariablesBuilder(this._dataConnect, {required List<String> this.IdList,});
  Deserializer<GetAllProductsFromIdsData> dataDeserializer = (dynamic json)  => GetAllProductsFromIdsData.fromJson(jsonDecode(json));
  Serializer<GetAllProductsFromIdsVariables> varsSerializer = (GetAllProductsFromIdsVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetAllProductsFromIdsData, GetAllProductsFromIdsVariables>> execute() {
    return this.ref().execute();
  }
  QueryRef<GetAllProductsFromIdsData, GetAllProductsFromIdsVariables> ref() {
    GetAllProductsFromIdsVariables vars=GetAllProductsFromIdsVariables(IdList: IdList,);

    return _dataConnect.query("GetAllProductsFromIds", dataDeserializer, varsSerializer, vars);
  }
}


  class GetAllProductsFromIdsProductList {
  
   String id;

  
   String name;

  
   String storageType;

  
  
    
    
    
    GetAllProductsFromIdsProductList.fromJson(dynamic json):
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

  GetAllProductsFromIdsProductList({
    
      required this.id,
    
      required this.name,
    
      required this.storageType,
    
  });
}



  class GetAllProductsFromIdsData {
  
   List<GetAllProductsFromIdsProductList> ProductList;

  
  
    
    
    
    GetAllProductsFromIdsData.fromJson(dynamic json):
        ProductList = 
 
    
      (json['ProductList'] as List<dynamic>)
        .map((e) => GetAllProductsFromIdsProductList.fromJson(e))
        .toList()
    
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['ProductList'] = 
  
    
      ProductList.map((e) => e.toJson()).toList()
    
  
;
      
    
    return json;
  }

  GetAllProductsFromIdsData({
    
      required this.ProductList,
    
  });
}



  class GetAllProductsFromIdsVariables {
  
   List<String> IdList;

  
  
    
    
     @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
    
    
    GetAllProductsFromIdsVariables.fromJson(Map<String, dynamic> json):
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

  GetAllProductsFromIdsVariables({
    
      required this.IdList,
    
  });
}







