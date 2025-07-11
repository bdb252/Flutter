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

  String _sPersonName = '';

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
              child: const Text('Show AlertDialog',
              style: TextStyle(fontSize: 24, color: Colors.white)),
              // 버튼을 누르면 람다형식으로 외부 함수 호출
              onPressed: () => _showAlertDialog(context, 'hello~'),
            ),
          ],
        ),
      ),
    );
  }
  
  // void showAlertDialog() async {
  Future _showAlertDialog(BuildContext context, String message) async {
    await showDialog(
      context: context, 
      // 화면의 빈 곳을 눌러도 창이 닫히지 않게 설정, true인 경우 창이 닫힘
      barrierDismissible: false,
      builder: (BuildContext context){
        return Theme(
          data : ThemeData(dialogTheme: DialogThemeData(backgroundColor: Colors.orange)),
          child: AlertDialog(
            // 대화창의 모서리 부분을 라운딩 처리
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(8.0)
            ),
            // 타이틀
            title: Text('AlertDialog Example'),
            // 내용
            content: Container(
              height: 90,
              child: Column(
                children: [
                  Text(message),
                  TextField(
                    /* 대화창이 열릴때 자동으로 포커싱된다. 이 경우 입력을 위해
                    키보드가 자동으로 올라온다. */ 
                    // autofocus: true,
                    // 입력상자의 힌트, HTML의 placeholder와 동일.
                    decoration: InputDecoration(
                      labelText: 'Name', hintText: '홍길동'),
                    // 내용의 변경이 있을때 실행할 핸들러
                    onChanged: (value){
                      // 입력된 내용을 멤버변수에 저장
                      _sPersonName = value;
                    },
                  )
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                child: const Text('Ok'),
                onPressed: () {
                  // 버튼을 누르면 대화창 닫음
                  Navigator.pop(context, 'OK');
                  // 입력된 내용을 콘솔에 출력
                  print('OK - $_sPersonName');
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
