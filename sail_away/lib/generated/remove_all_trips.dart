part of sail_away_api;

class RemoveAllTripsVariablesBuilder {
  
  
  FirebaseDataConnect _dataConnect;
  
  RemoveAllTripsVariablesBuilder(this._dataConnect, );
  Deserializer<RemoveAllTripsData> dataDeserializer = (dynamic json)  => RemoveAllTripsData.fromJson(jsonDecode(json));
  
  Future<OperationResult<RemoveAllTripsData, void>> execute() {
    return this.ref().execute();
  }
  MutationRef<RemoveAllTripsData, void> ref() {
    
    return _dataConnect.mutation("RemoveAllTrips", dataDeserializer, emptySerializer, null);
  }
}


  class RemoveAllTripsData {
  
   int trip_deleteMany;

  
  
    
    
    
    RemoveAllTripsData.fromJson(dynamic json):
        trip_deleteMany = 
 
    nativeFromJson<int>(json['trip_deleteMany'])
  

        
        
       {
      
        
      
    }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    
      
      json['trip_deleteMany'] = 
  
    nativeToJson<int>(trip_deleteMany)
    
;
      
    
    return json;
  }

  RemoveAllTripsData({
    
      required this.trip_deleteMany,
    
  });
}







