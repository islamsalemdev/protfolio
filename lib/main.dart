import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _section1Key = GlobalKey();
  final GlobalKey _section2Key = GlobalKey();
  final GlobalKey _section3Key = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    // final context = key.currentContext;
    if (key.currentContext != null) {
      Scrollable.ensureVisible(key.currentContext!,
          duration: const Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scroll to Section Example'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => _scrollToSection(_section1Key),
                child: const Text('Go to Section 1'),
              ),
              ElevatedButton(
                onPressed: () => _scrollToSection(_section2Key),
                child: const Text('Go to Section 2'),
              ),
              ElevatedButton(
                onPressed: () => _scrollToSection(_section3Key),
                child: const Text('Go to Section 3'),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Container(
                    key: _section1Key,
                    height: 600,
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        'Section 1',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    key: _section2Key,
                    height: 200,
                    color: Colors.green,
                    child: const Center(
                      child: Text(
                        'Section 2',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    key: _section3Key,
                    height: 400,
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        'Section 3',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
