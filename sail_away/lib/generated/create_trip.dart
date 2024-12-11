part of sail_away_api;

class CreateTripVariablesBuilder {
  String authorId;
String name;
bool tips;
bool transport;
DateTime startingData;
String inviteCode;
List<String> members;

  
  FirebaseDataConnect _dataConnect;
  
  CreateTripVariablesBuilder(this._dataConnect, {required String this.authorId,required String this.name,required bool this.tips,required bool this.transport,required DateTime this.startingData,required String this.inviteCode,required List<String> this.members,});
  Deserializer<CreateTripData> dataDeserializer = (dynamic json)  => CreateTripData.fromJson(jsonDecode(json));
  Serializer<CreateTripVariables> varsSerializer = (CreateTripVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreateTripData, CreateTripVariables>> execute() {
    return this.ref().execute();
  }
  MutationRef<CreateTripData, CreateTripVariables> ref() {
    CreateTripVariables vars=CreateTripVariables(authorId: authorId,name: name,tips: tips,transport: transport,startingData: startingData,inviteCode: inviteCode,members: members,);

    return _dataConnect.mutation("CreateTrip", dataDeserializer, varsSerializer, vars);
  }
}


  class CreateTripTripInsert {
  
   String id;

  
  
    
    
    
    CreateTripTripInsert.fromJson(dynamic json):
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

  CreateTripTripInsert({
    
      required this.id,
    
  });
}



  class CreateTripData {
  
   CreateTripTripInsert trip_insert;

  
  
    
    
    
    CreateTripData.fromJson(dynamic json):
        trip_insert = 
 
    CreateTripTripInsert.fromJson(json['trip_insert'])
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['trip_insert'] = 
  
      trip_insert.toJson()
  
;
      
    
    return json;
  }

  CreateTripData({
    
      required this.trip_insert,
    
  });
}



  class CreateTripVariables {
  
   String authorId;

  
   String name;

  
   bool tips;

  
   bool transport;

  
   DateTime startingData;

  
   String inviteCode;

  
   List<String> members;

  
  
    
    
     @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
    
    
    CreateTripVariables.fromJson(Map<String, dynamic> json):
        authorId = 
 
    nativeFromJson<String>(json['authorId'])
  

        
        ,
      
        name = 
 
    nativeFromJson<String>(json['name'])
  

        
        ,
      
        tips = 
 
    nativeFromJson<bool>(json['tips'])
  

        
        ,
      
        transport = 
 
    nativeFromJson<bool>(json['transport'])
  

        
        ,
      
        startingData = 
 
    nativeFromJson<DateTime>(json['startingData'])
  

        
        ,
      
        inviteCode = 
 
    nativeFromJson<String>(json['inviteCode'])
  

        
        ,
      
        members = 
 
    
      (json['members'] as List<dynamic>)
        .map((e) => nativeFromJson<String>(e))
        .toList()
    
  

        
        
       {
      
        
      
        
      
        
      
        
      
        
      
        
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['authorId'] = 
  
    nativeToJson<String>(authorId)
    
;
      
    
      
      json['name'] = 
  
    nativeToJson<String>(name)
    
;
      
    
      
      json['tips'] = 
  
    nativeToJson<bool>(tips)
    
;
      
    
      
      json['transport'] = 
  
    nativeToJson<bool>(transport)
    
;
      
    
      
      json['startingData'] = 
  
    nativeToJson<DateTime>(startingData)
    
;
      
    
      
      json['inviteCode'] = 
  
    nativeToJson<String>(inviteCode)
    
;
      
    
      
      json['members'] = 
  
    
      members.map((e) => nativeToJson<String>(e)).toList()
    
  
;
      
    
    return json;
  }

  CreateTripVariables({
    
      required this.authorId,
    
      required this.name,
    
      required this.tips,
    
      required this.transport,
    
      required this.startingData,
    
      required this.inviteCode,
    
      required this.members,
    
  });
}







