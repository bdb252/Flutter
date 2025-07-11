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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Banner', style: TextStyle(fontSize: 30),),
              /**
              material banner와 snackbar의 차이
              -duration 속성이 없다. 따라서 수동으로 닫아야 한다.
              -스낵바는 화면 위에 플로팅되지만, material banner는 위젯을 밀어낸다. 
               */
              onPressed: () {
                ScaffoldMessenger.of(context).showMaterialBanner(
                  MaterialBanner(
                    // 출력할 메시지
                    content: const Text('Hello I am a Material Banner'), 
                    // 좌측 아이콘
                    leading: const Icon(Icons.info),
                    backgroundColor: Colors.yellow,
                    // 닫기 버튼
                    actions: [
                      TextButton(
                        child: const Text('Dismiss'),
                        // material banner를 숨김처리
                        onPressed: () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
