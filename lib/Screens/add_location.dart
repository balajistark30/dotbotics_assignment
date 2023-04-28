import 'dart:convert';

import 'package:dot_botics_assignment/Networking/apicall.dart';
import 'package:dot_botics_assignment/loader.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Map<String, TextEditingController> map = {
  "locationId": TextEditingController(),
  "customerName": TextEditingController(),
  "locationName": TextEditingController(),
  "simNo": TextEditingController(),
  "numberOfLightsConnected": TextEditingController(),
  "loadConnected": TextEditingController(),
  "latitude": TextEditingController(),
  "longitude": TextEditingController(),
  "cumConsumption": TextEditingController(),
  "stateCode": TextEditingController(),
  "locationPort": TextEditingController(),
  "locationIp": TextEditingController()
};

class AddLocation extends StatefulWidget {
  const AddLocation({super.key});

  @override
  State<AddLocation> createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff017D89),
        title: const Text('Add Location'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: List.generate(
                map.length,
                (index) => Input(
                  hintText: map.keys.elementAt(index),
                  controller: map.values.elementAt(index),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    showLoader(context);
                    APICALL
                        .addLocation(
                      locationId: map["locationId"]?.text ?? '',
                      customerName: map["customerName"]?.text ?? '',
                      locationName: map["locationName"]?.text ?? '',
                      simNo: map["simNo"]?.text ?? '',
                      numberOfLightsConnected: int.parse(
                          map["numberOfLightsConnected"]?.text ?? '0'),
                      loadConnected:
                          int.parse(map["loadConnected"]?.text ?? '0'),
                      latitude: map["latitude"]?.text ?? '',
                      longitude: map["longitude"]?.text ?? '',
                      cumConsumption:
                          int.parse(map["cumConsumption"]?.text ?? '0'),
                      stateCode: map["stateCode"]?.text ?? '',
                      locationPort: int.parse(map["locationPort"]?.text ?? '0'),
                      locationIp: map["locationIp"]?.text ?? '',
                    )
                        .then(
                      (response) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(jsonDecode(response.body)["message"]),
                          ),
                        );
                        response.statusCode == 200
                            ? Navigator.of(context).pop()
                            : null;
                      },
                    );
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff5FB65C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Submit'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Input extends StatelessWidget {
  const Input({super.key, required this.hintText, required this.controller});

  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        ),
      ),
    );
  }
}
