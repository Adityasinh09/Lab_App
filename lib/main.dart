
import 'package:flutter/material.dart';

void main() {
  runApp(const NavigationLabApp());
}

class NavigationLabApp extends StatelessWidget {
  const NavigationLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const topic = 'Flutter Navigation';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.phone_iphone, size: 76),
              const SizedBox(height: 20),

              const Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'This app have three screens '
                    'and stack-based navigation.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 28),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const SecondScreen(topicName: topic),
                    ),
                  );
                },
                child: const Text('Open Topic Details'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  final String topicName;

  const SecondScreen({
    super.key,
    required this.topicName,
  });

  @override
  State<SecondScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<SecondScreen> {
  String resultMessage = 'There is not any information to show yet.';

  Future<void> openActivityScreen() async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (context) => const ThirdScreen(),
      ),
    );

    if (!mounted) return;

    if (result != null) {
      setState(() {
        resultMessage = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 2'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.menu_book, size: 70),

              const SizedBox(height: 18),

              const Text(
                'Selected topic:',
                style: TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 8),

              Text(
                widget.topicName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 24),

              Text(
                resultMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: openActivityScreen,
                child: const Text('Continue to Activity'),
              ),

              const SizedBox(height: 12),

            ],
          ),
        ),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 3'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.checklist, size: 70),

              const SizedBox(height: 18),

              const Text(
                'Activity',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      'Activity Done!',
                    );
                  },
                  child: const Text('Mark as Completed'),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      'Activity saved',
                    );
                  },
                  child: const Text('Save it'),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'This is are just demo screen.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
