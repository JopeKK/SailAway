part of sail_away_api;

class GetUsersFromMembersListVariablesBuilder {
  List<String> members;

  
  FirebaseDataConnect _dataConnect;
  
  GetUsersFromMembersListVariablesBuilder(this._dataConnect, {required List<String> this.members,});
  Deserializer<GetUsersFromMembersListData> dataDeserializer = (dynamic json)  => GetUsersFromMembersListData.fromJson(jsonDecode(json));
  Serializer<GetUsersFromMembersListVariables> varsSerializer = (GetUsersFromMembersListVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetUsersFromMembersListData, GetUsersFromMembersListVariables>> execute() {
    return this.ref().execute();
  }
  QueryRef<GetUsersFromMembersListData, GetUsersFromMembersListVariables> ref() {
    GetUsersFromMembersListVariables vars=GetUsersFromMembersListVariables(members: members,);

    return _dataConnect.query("GetUsersFromMembersList", dataDeserializer, varsSerializer, vars);
  }
}


  class GetUsersFromMembersListUsersFromMembers {
  
   String authId;

  
   String name;

  
  
    
    
    
    GetUsersFromMembersListUsersFromMembers.fromJson(dynamic json):
        authId = 
 
    nativeFromJson<String>(json['authId'])
  

        
        ,
      
        name = 
 
    nativeFromJson<String>(json['name'])
  

        
        
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
      
    
    return json;
  }

  GetUsersFromMembersListUsersFromMembers({
    
      required this.authId,
    
      required this.name,
    
  });
}



  class GetUsersFromMembersListData {
  
   List<GetUsersFromMembersListUsersFromMembers> UsersFromMembers;

  
  
    
    
    
    GetUsersFromMembersListData.fromJson(dynamic json):
        UsersFromMembers = 
 
    
      (json['UsersFromMembers'] as List<dynamic>)
        .map((e) => GetUsersFromMembersListUsersFromMembers.fromJson(e))
        .toList()
    
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['UsersFromMembers'] = 
  
    
      UsersFromMembers.map((e) => e.toJson()).toList()
    
  
;
      
    
    return json;
  }

  GetUsersFromMembersListData({
    
      required this.UsersFromMembers,
    
  });
}



  class GetUsersFromMembersListVariables {
  
   List<String> members;

  
  
    
    
     @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
    
    
    GetUsersFromMembersListVariables.fromJson(Map<String, dynamic> json):
        members = 
 
    
      (json['members'] as List<dynamic>)
        .map((e) => nativeFromJson<String>(e))
        .toList()
    
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['members'] = 
  
    
      members.map((e) => nativeToJson<String>(e)).toList()
    
  
;
      
    
    return json;
  }

  GetUsersFromMembersListVariables({
    
      required this.members,
    
  });
}







