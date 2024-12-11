part of sail_away_api;

class ChangeTransportMemberVariablesBuilder {
  List<String> members;
String transportId;

  
  FirebaseDataConnect _dataConnect;
  
  ChangeTransportMemberVariablesBuilder(this._dataConnect, {required List<String> this.members,required String this.transportId,});
  Deserializer<ChangeTransportMemberData> dataDeserializer = (dynamic json)  => ChangeTransportMemberData.fromJson(jsonDecode(json));
  Serializer<ChangeTransportMemberVariables> varsSerializer = (ChangeTransportMemberVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<ChangeTransportMemberData, ChangeTransportMemberVariables>> execute() {
    return this.ref().execute();
  }
  MutationRef<ChangeTransportMemberData, ChangeTransportMemberVariables> ref() {
    ChangeTransportMemberVariables vars=ChangeTransportMemberVariables(members: members,transportId: transportId,);

    return _dataConnect.mutation("changeTransportMember", dataDeserializer, varsSerializer, vars);
  }
}


  class ChangeTransportMemberTransportUpdate {
  
   String id;

  
  
    
    
    
    ChangeTransportMemberTransportUpdate.fromJson(dynamic json):
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

  ChangeTransportMemberTransportUpdate({
    
      required this.id,
    
  });
}



  class ChangeTransportMemberData {
  
   ChangeTransportMemberTransportUpdate? transport_update;

  
  
    
    
    
    ChangeTransportMemberData.fromJson(dynamic json):
        transport_update = json['transport_update'] == null ? null : 
 
    ChangeTransportMemberTransportUpdate.fromJson(json['transport_update'])
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
        if (transport_update != null) {
          json['transport_update'] = 
  
      transport_update!.toJson()
  
;
        }
      
    
    return json;
  }

  ChangeTransportMemberData({
    
       this.transport_update,
    
  });
}



  class ChangeTransportMemberVariables {
  
   List<String> members;

  
   String transportId;

  
  
    
    
     @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
    
    
    ChangeTransportMemberVariables.fromJson(Map<String, dynamic> json):
        members = 
 
    
      (json['members'] as List<dynamic>)
        .map((e) => nativeFromJson<String>(e))
        .toList()
    
  

        
        ,
      
        transportId = 
 
    nativeFromJson<String>(json['transportId'])
  

        
        
       {
      
        
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['members'] = 
  
    
      members.map((e) => nativeToJson<String>(e)).toList()
    
  
;
      
    
      
      json['transportId'] = 
  
    nativeToJson<String>(transportId)
    
;
      
    
    return json;
  }

  ChangeTransportMemberVariables({
    
      required this.members,
    
      required this.transportId,
    
  });
}







