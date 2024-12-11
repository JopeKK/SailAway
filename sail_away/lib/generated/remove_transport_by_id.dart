part of sail_away_api;

class RemoveTransportByIdVariablesBuilder {
  String transportId;

  
  FirebaseDataConnect _dataConnect;
  
  RemoveTransportByIdVariablesBuilder(this._dataConnect, {required String this.transportId,});
  Deserializer<RemoveTransportByIdData> dataDeserializer = (dynamic json)  => RemoveTransportByIdData.fromJson(jsonDecode(json));
  Serializer<RemoveTransportByIdVariables> varsSerializer = (RemoveTransportByIdVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<RemoveTransportByIdData, RemoveTransportByIdVariables>> execute() {
    return this.ref().execute();
  }
  MutationRef<RemoveTransportByIdData, RemoveTransportByIdVariables> ref() {
    RemoveTransportByIdVariables vars=RemoveTransportByIdVariables(transportId: transportId,);

    return _dataConnect.mutation("removeTransportById", dataDeserializer, varsSerializer, vars);
  }
}


  class RemoveTransportByIdTransportDelete {
  
   String id;

  
  
    
    
    
    RemoveTransportByIdTransportDelete.fromJson(dynamic json):
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

  RemoveTransportByIdTransportDelete({
    
      required this.id,
    
  });
}



  class RemoveTransportByIdData {
  
   RemoveTransportByIdTransportDelete? transport_delete;

  
  
    
    
    
    RemoveTransportByIdData.fromJson(dynamic json):
        transport_delete = json['transport_delete'] == null ? null : 
 
    RemoveTransportByIdTransportDelete.fromJson(json['transport_delete'])
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
        if (transport_delete != null) {
          json['transport_delete'] = 
  
      transport_delete!.toJson()
  
;
        }
      
    
    return json;
  }

  RemoveTransportByIdData({
    
       this.transport_delete,
    
  });
}



  class RemoveTransportByIdVariables {
  
   String transportId;

  
  
    
    
     @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
    
    
    RemoveTransportByIdVariables.fromJson(Map<String, dynamic> json):
        transportId = 
 
    nativeFromJson<String>(json['transportId'])
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['transportId'] = 
  
    nativeToJson<String>(transportId)
    
;
      
    
    return json;
  }

  RemoveTransportByIdVariables({
    
      required this.transportId,
    
  });
}







