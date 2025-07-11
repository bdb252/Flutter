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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // fit 속성 : 이미지를 어떤식으로 채울지 여부를 결정하는 옵션
          Image.asset(
            'assets/images/900.png',
            // 사이즈만 지정하면 자동 설정됨
            fit: BoxFit.fill,
            alignment: Alignment.topLeft,
            // 원래 사이즈가 비율대로 줄어든다.
            width: 150.0,
          ),
          // 사이즈박스를 통해 위젯 사이에 약간의 여백을 지정
          const SizedBox(height: 5),
          Image.asset(
            'assets/images/900.png',
            // 큰 쪽에 맞춤. 작은 쪽 잘림
            fit: BoxFit.cover,
            alignment: Alignment.centerLeft,
            width: 150.0,
            height: 100.0,
          ),
          const SizedBox(height: 5),
          Image.asset(
            'assets/images/900.png',
            // 사이즈에 맞춤. 이미지 형태에 변형 옴.
            fit: BoxFit.fill,
            alignment: Alignment.centerLeft,

            width: 150.0,
            height: 100.0,
          ),
          const SizedBox(height: 5),
          Image.asset(
            'assets/images/900.png',
            // 작은 쪽에 맞춤. 큰 쪽에 여백 남음.
            fit: BoxFit.contain,
            alignment: Alignment.topLeft,
            width: 150.0,
            height: 100.0,
          ),
          const SizedBox(height: 5),
          Image.asset(
            'assets/images/900.png',
            // fit: BoxFit.contain,
            alignment: Alignment.centerLeft, // 큰 쪽인 오른쪽에 여백 남음
            width: 150.0, // 사이즈를 둘 다 주면 fill이 아니고
            height: 100.0, // contain이 된다.
          ),
          const SizedBox(height: 5),
          Image.asset(
            'assets/images/900.png',
            // 원래 크기. 화면 배율 영향 안받음.
            fit: BoxFit.none,
            alignment: Alignment.centerLeft,
            // 이미지의 크기가 900이므로 우측, 하단이 모두 잘린다.
            width: 320.0,
            height: 80.0,
          ),
        ],
      ),
    );
  }
}
