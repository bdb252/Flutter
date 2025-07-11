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
  
  // 체크박스와 스위치에서 체크여부 확인을 위한 변수
  bool _chk1 = false;     //Non-nullable 즉 null을 허용하지 않는 변수로 선언
  bool? _chk2 = false;    //Nullable로 선언. 즉 null을 허용하는 변수
  bool _chk3 = false;

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
            // 체크박스1 : 필수사항만 설정한 기본상태로 표현
            Checkbox(
              // 체크박스에서 사용할 값 설정
              value: _chk1, 
              // 체크박스에서 check/uncheck했을 때 이벤트 처리
              onChanged: (bool? value){
                /* 매개변수를 통해 null값이 들어올 수 있으므로 Nullable로 선언하고,
                변수에 할당 시 null check operation를 추가하여 null인 경우 런타임 에러를
                발생시킨다.  */ 
                setState(() {
                  _chk1 = value!;
                });
                print('Checkbox1 : $_chk1');
              }
            ),
            // 체크박스2 : 컬러 지정
            Checkbox(
              value: _chk2, 
              // 체크되었을때 색깔
              checkColor: Colors.pink,
              // 체크되었을때 배경색
              activeColor: Colors.green,
              /** _chk2는 Nullable로 선언되었으므로, null값이 들어와도 허용되므로
                별도의 처리가 필요없음. */
              onChanged: (value){
                setState(() {
                  _chk2 = value;
                });
                print('Checkbox2 : $_chk2');
              }
            ),
            Switch(
              value: _chk3,
              // 스위치가 켜졌을때 색깔
              activeColor: Colors.red,
              activeTrackColor: Colors.cyan,
              // 스위치가 꺼졌을때 색깔
              inactiveThumbColor: Colors.lightGreen,
              inactiveTrackColor: Colors.lightGreen,
              onChanged: (value){
                setState(() {
                  _chk3 = value;
                });
                print('Switch : $_chk3');
              }
            ),
          ],
        ),
      ),
    );
  }
}
