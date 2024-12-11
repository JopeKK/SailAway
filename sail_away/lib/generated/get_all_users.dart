part of sail_away_api;

class GetAllUsersVariablesBuilder {
  
  
  FirebaseDataConnect _dataConnect;
  
  GetAllUsersVariablesBuilder(this._dataConnect, );
  Deserializer<GetAllUsersData> dataDeserializer = (dynamic json)  => GetAllUsersData.fromJson(jsonDecode(json));
  
  Future<QueryResult<GetAllUsersData, void>> execute() {
    return this.ref().execute();
  }
  QueryRef<GetAllUsersData, void> ref() {
    
    return _dataConnect.query("GetAllUsers", dataDeserializer, emptySerializer, null);
  }
}


  class GetAllUsersUsers {
  
   String id;

  
   String authId;

  
   String name;

  
   String email;

  
  
    
    
    
    GetAllUsersUsers.fromJson(dynamic json):
        id = 
 
    nativeFromJson<String>(json['id'])
  

        
        ,
      
        authId = 
 
    nativeFromJson<String>(json['authId'])
  

        
        ,
      
        name = 
 
    nativeFromJson<String>(json['name'])
  

        
        ,
      
        email = 
 
    nativeFromJson<String>(json['email'])
  

        
        
       {
      
        
      
        
      
        
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['id'] = 
  
    nativeToJson<String>(id)
    
;
      
    
      
      json['authId'] = 
  
    nativeToJson<String>(authId)
    
;
      
    
      
      json['name'] = 
  
    nativeToJson<String>(name)
    
;
      
    
      
      json['email'] = 
  
    nativeToJson<String>(email)
    
;
      
    
    return json;
  }

  GetAllUsersUsers({
    
      required this.id,
    
      required this.authId,
    
      required this.name,
    
      required this.email,
    
  });
}



  class GetAllUsersData {
  
   List<GetAllUsersUsers> users;

  
  
    
    
    
    GetAllUsersData.fromJson(dynamic json):
        users = 
 
    
      (json['users'] as List<dynamic>)
        .map((e) => GetAllUsersUsers.fromJson(e))
        .toList()
    
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['users'] = 
  
    
      users.map((e) => e.toJson()).toList()
    
  
;
      
    
    return json;
  }

  GetAllUsersData({
    
      required this.users,
    
  });
}







