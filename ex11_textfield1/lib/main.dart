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
  // Text 위젯에 설정할 기본 문자열
  String _myText = '홍길동';
  /* TextField에 입력된 내용을 읽어오기 위해 필요한 인스턴스로
  controller 속성에 추가한다. */
  final ctlMyText1 = TextEditingController();

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 텍스트 위젯으로 최초 실행시 '홍길동' 출력됨.
            Text(
              _myText,
              style: const TextStyle(
                fontSize: 30.0,
              ),
            ),
            // 텍스트필드의 가로 사이즈는 SizedBox를 통해 설정한다.
            // 아래는 사이즈박스가 텍스트필드를 감싸고 있는 형태이다.
            SizedBox(
              width: 250,
              child: TextField(
                // 컨트롤러 인스턴스를 지정한다.
                controller: ctlMyText1,
              ),
            ),
            ElevatedButton(
              child: const Text('입력내용으로 변경',
                style: TextStyle(fontSize: 24)),
              onPressed: () {
                /* 입력한 텍스트의 상태를 변경하여 리렌더링 한다.
                즉, 사용자가 입력한 내용으로 텍스트 위젯을 변경한다. */
                setState(() {
                  _myText = ctlMyText1.text;
                });
              },
              )
          ],
        ),
      ),
      // 플로팅 액션버튼은 body 속성 외부에 기술한다. 
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 버튼을 누르면 초기상태인 '홍길동'으로 변경된다. 
          setState(() {
            _myText = '홍길동';
          });
        },
        child: const Icon(Icons.reset_tv),
      ),
    );
  }
}
