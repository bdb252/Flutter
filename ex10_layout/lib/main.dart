import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 230, 225, 78),
        ),
      ),
      home: const MyHomePage(title: 'Flutter 기본형'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.yellow,
              width: 300,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('Button1')),
                  // SizedBox(width: 10,),
                  // Spacer(flex: 1,),
                  ElevatedButton(onPressed: () {}, child: Text('Button2')),
                  // SizedBox(width: 10,),
                  // Spacer(flex: 2,),
                  ElevatedButton(onPressed: () {}, child: Text('Button3')),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.cyan,
              width: 300,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('Button1')),
                  // SizedBox(width: 10,),
                  // Spacer(flex: 1,),
                  ElevatedButton(onPressed: () {}, child: Text('Button2')),
                  // SizedBox(width: 10,),
                  // Spacer(flex: 2,),
                  ElevatedButton(onPressed: () {}, child: Text('Button3')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
