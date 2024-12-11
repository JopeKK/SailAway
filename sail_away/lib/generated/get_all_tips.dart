part of sail_away_api;

class GetAllTipsVariablesBuilder {
  
  
  FirebaseDataConnect _dataConnect;
  
  GetAllTipsVariablesBuilder(this._dataConnect, );
  Deserializer<GetAllTipsData> dataDeserializer = (dynamic json)  => GetAllTipsData.fromJson(jsonDecode(json));
  
  Future<QueryResult<GetAllTipsData, void>> execute() {
    return this.ref().execute();
  }
  QueryRef<GetAllTipsData, void> ref() {
    
    return _dataConnect.query("GetAllTips", dataDeserializer, emptySerializer, null);
  }
}


  class GetAllTipsTips {
  
   String id;

  
   String title;

  
   String description;

  
  
    
    
    
    GetAllTipsTips.fromJson(dynamic json):
        id = 
 
    nativeFromJson<String>(json['id'])
  

        
        ,
      
        title = 
 
    nativeFromJson<String>(json['title'])
  

        
        ,
      
        description = 
 
    nativeFromJson<String>(json['description'])
  

        
        
       {
      
        
      
        
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['id'] = 
  
    nativeToJson<String>(id)
    
;
      
    
      
      json['title'] = 
  
    nativeToJson<String>(title)
    
;
      
    
      
      json['description'] = 
  
    nativeToJson<String>(description)
    
;
      
    
    return json;
  }

  GetAllTipsTips({
    
      required this.id,
    
      required this.title,
    
      required this.description,
    
  });
}



  class GetAllTipsData {
  
   List<GetAllTipsTips> tips;

  
  
    
    
    
    GetAllTipsData.fromJson(dynamic json):
        tips = 
 
    
      (json['tips'] as List<dynamic>)
        .map((e) => GetAllTipsTips.fromJson(e))
        .toList()
    
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['tips'] = 
  
    
      tips.map((e) => e.toJson()).toList()
    
  
;
      
    
    return json;
  }

  GetAllTipsData({
    
      required this.tips,
    
  });
}







