part of sail_away_api;

class CreateUserVariablesBuilder {
  String authId;
String name;
String email;

  
  FirebaseDataConnect _dataConnect;
  
  CreateUserVariablesBuilder(this._dataConnect, {required String this.authId,required String this.name,required String this.email,});
  Deserializer<CreateUserData> dataDeserializer = (dynamic json)  => CreateUserData.fromJson(jsonDecode(json));
  Serializer<CreateUserVariables> varsSerializer = (CreateUserVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreateUserData, CreateUserVariables>> execute() {
    return this.ref().execute();
  }
  MutationRef<CreateUserData, CreateUserVariables> ref() {
    CreateUserVariables vars=CreateUserVariables(authId: authId,name: name,email: email,);

    return _dataConnect.mutation("CreateUser", dataDeserializer, varsSerializer, vars);
  }
}


  class CreateUserUserInsert {
  
   String id;

  
   String authId;

  
  
    
    
    
    CreateUserUserInsert.fromJson(dynamic json):
        id = 
 
    nativeFromJson<String>(json['id'])
  

        
        ,
      
        authId = 
 
    nativeFromJson<String>(json['authId'])
  

        
        
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
      
    
    return json;
  }

  CreateUserUserInsert({
    
      required this.id,
    
      required this.authId,
    
  });
}



  class CreateUserData {
  
   CreateUserUserInsert user_insert;

  
  
    
    
    
    CreateUserData.fromJson(dynamic json):
        user_insert = 
 
    CreateUserUserInsert.fromJson(json['user_insert'])
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['user_insert'] = 
  
      user_insert.toJson()
  
;
      
    
    return json;
  }

  CreateUserData({
    
      required this.user_insert,
    
  });
}



  class CreateUserVariables {
  
   String authId;

  
   String name;

  
   String email;

  
  
    
    
     @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
    
    
    CreateUserVariables.fromJson(Map<String, dynamic> json):
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

  CreateUserVariables({
    
      required this.authId,
    
      required this.name,
    
      required this.email,
    
  });
}







