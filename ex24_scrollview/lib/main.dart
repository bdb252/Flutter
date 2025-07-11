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
        child: Container(
          // 패딩과 마진은 4방향 모두 0으로 설정
          margin: EdgeInsets.all(0.0),
          // 패딩 지정했을때 테두리 생기는거 확인
          padding: EdgeInsets.all(0.0),
          /* 화면 크기보다 자식이 크면 화면의 크기로 맞춰진다. 
          즉 아래의 2개의 속성을 주석처리하면 화면이 꽉 채워진다. */
          width: 300,
          height: 500,
          color: Colors.cyan,
          alignment: Alignment.topLeft,
          // 스크롤 뷰 위젯 : 화면이 길어지면 자동으로 스크롤이 생성됨
          child: SingleChildScrollView(
            // 스크롤 방향 설정(수직이 Default)
            scrollDirection: Axis.vertical,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center, //의미 없음

              // 세로 화면을 벗어날 정도의 컨테이너를 추가한 후 테스트
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  alignment: Alignment.center,
                  color: Colors.amber[900],
                  child: Text('Entry !!', style: TextStyle(fontSize: 30)),
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  alignment: Alignment.center,
                  color: Colors.amber[700],
                  child: Text('Entry A', style: TextStyle(fontSize: 30)),
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  alignment: Alignment.center,
                  color: Colors.amber[500],
                  child: Text('Entry B', style: TextStyle(fontSize: 30)),
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  alignment: Alignment.center,
                  color: Colors.amber[300],
                  child: Text('Entry C', style: TextStyle(fontSize: 30)),
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  alignment: Alignment.center,
                  color: Colors.amber[100],
                  child: Text('Entry D', style: TextStyle(fontSize: 30)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
