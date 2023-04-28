import 'dart:convert';
import 'package:http/http.dart' as http;

String url = 'http://68.178.165.76:8081';

class APICALL {
  static Future<http.Response> login(String username, String password) async {
    return await http.post(
      Uri.parse('http://68.178.165.76:8081/v1/login'),
      body: jsonEncode({"username": username, "password": password}),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }

  static Future<http.Response> addLocation({
    required String locationId,
    required String customerName,
    required String locationName,
    required String simNo,
    required int numberOfLightsConnected,
    required int loadConnected,
    required String latitude,
    required String longitude,
    required int cumConsumption,
    required String stateCode,
    required int locationPort,
    required String locationIp,
  }) async {
    return await http.put(
      Uri.parse('http://68.178.165.76:8081/v1/Location'),
      body: jsonEncode({
        "locationId": locationId,
        "customerName": customerName,
        "locationName": locationName,
        "simNo": simNo,
        "numberOfLightsConnected": numberOfLightsConnected,
        "loadConnected": loadConnected,
        "latitude": latitude,
        "longitude": longitude,
        "cumConsumption": cumConsumption,
        "stateCode": stateCode,
        "locationPort": locationPort,
        "locationIp": locationIp,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }

  static Future<Map<String, dynamic>> getLocations() async {
    http.Response response = await http.get(
      Uri.parse('http://68.178.165.76:8081/v1/Locations'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}
