library sail_away_api;
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'dart:convert';







class SailAwayApiConnector {
  

  static ConnectorConfig connectorConfig = ConnectorConfig(
    'us-central1',
    'sail_away_api',
    'sail_away',
  );

  SailAwayApiConnector({required this.dataConnect});
  static SailAwayApiConnector get instance {
    return SailAwayApiConnector(
        dataConnect: FirebaseDataConnect.instanceFor(
            connectorConfig: connectorConfig,
            sdkType: CallerSDKType.generated));
  }

  FirebaseDataConnect dataConnect;
}

