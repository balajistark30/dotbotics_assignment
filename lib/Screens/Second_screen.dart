import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff017D89),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_sharp)),
        title: Text('LOCATIONS'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.account_circle))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('0105:SUSTECH 3PHASE1'),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.flash_on,color: Colors.white,),
                  ),
                ],
              ),

            ),
            Divider(color: Colors.black54,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('0105:SUSTECH 3PHASE2'),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.flash_on,color: Colors.white,),
                  ),
                ],
              ),

            ),
            Divider(color: Colors.black54,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('0105:SUSTECH MLC1'),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.flash_on,color: Colors.white,),
                  ),
                ],
              ),

            ),
            Divider(color: Colors.black54,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('0105:SUSTECH MLC2'),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.flash_on,color: Colors.white,),
                  ),
                ],
              ),

            ),
            Divider(color: Colors.black54,),
            
            Center(
              child: SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    // Perform login action
                  },
                  child: Text('Add'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff5FB65C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DisplayAddress {}
