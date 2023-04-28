import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key, required this.data}) : super(key: key);

  final Map<String, dynamic> data;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff017D89),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_sharp)),
        title: const Text('LOCATIONS'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            for (Map<String, dynamic> value in widget.data["data"])
              location_widget(
                  '${value["locationId"]}:${value["customerName"]} ${value["locationName"]}'),
            Center(
              child: SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    // Perform login action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff5FB65C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Add'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column location_widget(String name) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name),
              const CircleAvatar(
                radius: 15,
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.flash_on,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.black54,
        ),
      ],
    );
  }
}

class DisplayAddress {}
