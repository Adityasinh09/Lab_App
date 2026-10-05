import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: MainScreen(),
        );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobile App Lab"),
      ),

      body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "Welcome Dear!",
              style: TextStyle(fontSize: 24),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ActionScreen(),
                  ),
                );
              },
              child: Text("Counter"),
            ),

          ],
        ),
      ),
    );
  }
}

class ActionScreen extends StatefulWidget {
  @override
  State<ActionScreen> createState() => _ActionScreenState();
}

class _ActionScreenState extends State<ActionScreen> {

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Start Counting"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "$counter",
              style: TextStyle(fontSize: 40),
            ),

            SizedBox(height: 20),

            ElevatedButton(
                onPressed: (){

                  setState(() {
                    counter++;
                  });
                },
                child: Text("COUNT"),
            ),

          ],
        ),
      ),
    );
  }
}
