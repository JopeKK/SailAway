part of sail_away_api;

class AddTransportVariablesBuilder {
  List<String> members;
String tripId;
String type;

  
  FirebaseDataConnect _dataConnect;
  
  AddTransportVariablesBuilder(this._dataConnect, {required List<String> this.members,required String this.tripId,required String this.type,});
  Deserializer<AddTransportData> dataDeserializer = (dynamic json)  => AddTransportData.fromJson(jsonDecode(json));
  Serializer<AddTransportVariables> varsSerializer = (AddTransportVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<AddTransportData, AddTransportVariables>> execute() {
    return this.ref().execute();
  }
  MutationRef<AddTransportData, AddTransportVariables> ref() {
    AddTransportVariables vars=AddTransportVariables(members: members,tripId: tripId,type: type,);

    return _dataConnect.mutation("addTransport", dataDeserializer, varsSerializer, vars);
  }
}


  class AddTransportTransportInsert {
  
   String id;

  
  
    
    
    
    AddTransportTransportInsert.fromJson(dynamic json):
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

  AddTransportTransportInsert({
    
      required this.id,
    
  });
}



  class AddTransportData {
  
   AddTransportTransportInsert transport_insert;

  
  
    
    
    
    AddTransportData.fromJson(dynamic json):
        transport_insert = 
 
    AddTransportTransportInsert.fromJson(json['transport_insert'])
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['transport_insert'] = 
  
      transport_insert.toJson()
  
;
      
    
    return json;
  }

  AddTransportData({
    
      required this.transport_insert,
    
  });
}



  class AddTransportVariables {
  
   List<String> members;

  
   String tripId;

  
   String type;

  
  
    
    
     @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
    
    
    AddTransportVariables.fromJson(Map<String, dynamic> json):
        members = 
 
    
      (json['members'] as List<dynamic>)
        .map((e) => nativeFromJson<String>(e))
        .toList()
    
  

        
        ,
      
        tripId = 
 
    nativeFromJson<String>(json['tripId'])
  

        
        ,
      
        type = 
 
    nativeFromJson<String>(json['type'])
  

        
        
       {
      
        
      
        
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['members'] = 
  
    
      members.map((e) => nativeToJson<String>(e)).toList()
    
  
;
      
    
      
      json['tripId'] = 
  
    nativeToJson<String>(tripId)
    
;
      
    
      
      json['type'] = 
  
    nativeToJson<String>(type)
    
;
      
    
    return json;
  }

  AddTransportVariables({
    
      required this.members,
    
      required this.tripId,
    
      required this.type,
    
  });
}







