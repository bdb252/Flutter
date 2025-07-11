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
      // 위젯들을 수형방향으로 배치할때 사용하는 레이아웃 위젯
      // 수직 방향일때는 Column 사용
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // 자식 위젯을 2개 이상 배치하는 경우 children 속성 사용
        // <Widget>은 생략 가능함
        children: const [
          Icon(Icons.camera_alt, color: Colors.red, size: 35.0),
          Icon(Icons.cancel, color: Colors.orange, size: 35.0),
          Icon(Icons.celebration, color: Colors.yellow, size: 35.0),
          Icon(Icons.chair, color: Colors.green, size: 35.0),
          Icon(Icons.check_box, color: Colors.purple, size: 35.0),
        ],
      ),
    );
  }
}
