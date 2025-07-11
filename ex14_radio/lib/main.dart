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

// enum은 열거형 상수로 클래스 외부에 선언할 수 있다.
// enum은 클래스 내부에 선언할 수 없고, 상수는 소문자로...(자바와 다르다.)
enum Fruit {apple, banana}

class _MyHomePageState extends State<MyHomePage> {
  /**
  라디오는 여러 항목 중 하나만 선택할 수 있으므로 그룹으로 묶어주기 위해 이와 같은 변수가 
  필요하다. 즉 그룹 구분에 사용할 변수 생성. */
  Fruit _myGroup1 = Fruit.apple; //첫번째 그룹 구분에 사용할 변수
  Fruit _myGroup2 = Fruit.banana; //두번째 그룹 구분에 사용할 변수
  // 버튼 활성화 여부
  bool _btn = true;

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
            // 라디오를 정확히 터치해야 선택되는 위젯
            ListTile(
              title: const Text('사과'),
              leading: Radio <Fruit>(
                // 라디오를 하나의 그룹으로 묶을때 사용하는 속성
                groupValue: _myGroup1,
                // 설정된 값
                value: Fruit.apple,
                // 항목을 선택했을때 이벤트 핸들러
                onChanged: (Fruit? value){
                  /** 매개변수의 null값을 체크하여 상태를 변경한 후
                  리렌더링한다. */
                  setState(() {
                    _myGroup1 = value!;
                    print(_myGroup1);
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('바나나'),
              leading: Radio <Fruit>(
                groupValue: _myGroup1,
                value: Fruit.banana,
                onChanged: (value){
                  setState(() {
                    _myGroup1 = value!;
                    print(_myGroup1);
                  });
                },
              ),
            ),
            const SizedBox(height: 50,), //간단한 간격 조정
            /**
            라디오의 선택 영역을 넓게 설정할 수 있는 위젯으로, 해당 라인
            전체를 클릭해도 체크할 수 있다. */
            RadioListTile <Fruit>(
              title: const Text('사과'),
              groupValue: _myGroup2,
              value: Fruit.apple, 
              onChanged: (value){
                setState(() {
                  _myGroup2 = value!;
                  print(_myGroup2);
                  /**
                  선택한 라디오의 값을 출력하고, 아래 엘리베이트 버튼을 활성화하는 기능이
                  추가되어있다. */
                  _btn = true;
                });
              },
            ),
            RadioListTile <Fruit>(
              title: const Text('바나나'),
              groupValue: _myGroup2,
              value: Fruit.banana, 
              activeColor: Colors.pink,
              // 노멀 상태의 배경색은 테마로 변경 : unselectedWidgetColor
              onChanged: (value){
                setState(() {
                  _myGroup2 = value!;
                  print(_myGroup2);
                  _btn = true;
                });
              },
            ),
            const SizedBox(height: 50,), //간단한 간격 조정
            ElevatedButton(
              child: const Text('ElevatedButton',
                        style: TextStyle(fontSize: 24,
                                        color: Colors.white)),
              /*
              이 버튼이 활성화상태라면 함수를 호출할 수 있다. 비활성화 
              상태라면 null이 선택되어 누를 수 없는 상태가 된다. */ 
              onPressed: _btn ? _onClick1 : null,
            ),
          ],
        ),
      ),
    );
  }

  void _onClick1(){
    print('Radio2 : $_myGroup2');
  }
}
