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
  // 스낵바에서 사용할 메시지
  String msg = "Hello World";

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
              child: const Text('Snackbar 기본',
                style: TextStyle(fontSize: 24)),
                // 버튼 클릭 시 실행할 함수를 직접 정의
                onPressed: (){
                  // 이 클래스를 통해 직접 스낵바를 띄운다. 
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      // 스낵바에 표시할 메시지 
                      content: Text(msg),
                      // 유지시간을 밀리세컨즈 단위로 설정
                      duration: const Duration(milliseconds: 1000),
                    ),
                  );
                }, 
              ),
            const SizedBox(height: 10,),
            ElevatedButton(
              child: const Text('Snackbar 옵션',
              // 버튼 클릭시 람다 형식으로 외부 함수 호출
              style: TextStyle(fontSize: 24)),
              onPressed: () => callSnackBar("안녕하세요 홍길동님!"),
            )
          ],
        ),
      ),
    );
  }

  // 스낵바의 옵션 설정
  callSnackBar(msg){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // 메시지 내용. 텍스트의 스타일을 지정
        content: Text(msg, style: const TextStyle(color: Colors.black)),
        // 스낵바의 배경색
        backgroundColor: Colors.yellow[800],
        // 유지시간
        duration: const Duration(milliseconds: 2000),
        // 스낵바에 별도의 텍스트버튼 추가
        action: SnackBarAction(
          label: 'Undo' ,
          textColor: Colors.black,
          onPressed: () {
            print('스낵바닫힘');
          },
        ),
        /* 플로팅 여부 설정: 아래 부분에서 살짝 띄워준다. 이부분이 없으면 기본설정처럼 
        아래쪽에서 스낵바를 밀어 올린다. */
        behavior: SnackBarBehavior.floating,
        // 스낵바의 모서리 부분을 둥글게 커스텀한다.
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20),
          side: BorderSide(
            color: Colors.red,
            width: 2,
          )
        ),
      ),
    );
  }
}
