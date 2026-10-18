import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String message = "Please Select!";
  Color cardColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gesture-Enabled App"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),

              SizedBox(height: 25),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    message = "You Clicked the button!";
                  });
                },
                child: Text("Click here"),
              ),

              SizedBox(height: 25),


              GestureDetector(
                onLongPress: () {
                  setState(() {
                    cardColor = cardColor == Colors.blue
                        ? Colors.orange
                        : Colors.blue;

                    message = "Great!";
                  });
                },
                child: Container(
                  width: 220,
                  height: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "Hold this Button",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

