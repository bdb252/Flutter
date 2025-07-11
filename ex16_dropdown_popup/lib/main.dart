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
  // 드롭다운 버튼에서 선택한 항목을 출려갛기 위한 변수
  String _chosenValue = 'Flutter';

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
            // HTML의 <select>와 유사한 위젯
            DropdownButton <String>(
              // 텍스트 스타일을 지정
              style: const TextStyle(color: Colors.red),
              // 최초 실행시 선택할 값 지정
              value: _chosenValue,
              // 구성 항목을 list를 통해 지정한 후 map으로 반복해서 설정.
              items: [
                'Android',
                'IOS',
                'Flutter',
                'Node',
                'Java',
                'Python',
                'PHP',
              ].map((value){
                // 콜백된 각 항목을 인스턴스로 만든 후 반환
                return DropdownMenuItem(
                  // 값과 출력텍스트 지정
                  value: value,
                  child: Text(value),
                );
              }).toList(), 
              // 드롭다운의 가로크기를 텍스트의 길이로 지정함.
              hint: const Text('힌트글인데 이걸로 크기 조정을', ),
              /* 매개변수를 nullable로 선언하여 이벤트 처리를 해야 한다.
              제거시 에러 발생. 매개변수로 null이 들어올 수 있음을 명시함. */ 
              onChanged: (String? value){
                // 외부 함수 호출
                popupButtonSelected(value!);
                // 선택한 값으로 변경 후 리렌더링
                setState(() {
                  _chosenValue = value;
                });
              },
            ),
            const SizedBox(height: 50,),
            /* 드롭다운버튼과 기능은 동일하고, UI만 조금 다른 위젯으로
            3점 메뉴로 표현된다. */ 
            PopupMenuButton(
              itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<String>>[
                  const PopupMenuItem(child: Text("child 0"), value: "Value 0",),
                  const PopupMenuItem(child: Text("child 1"), value: "Value 1",),
                  const PopupMenuItem(child: Text("child 2"), value: "Value 2",),
                ],
              onSelected: popupMenuSelected,
            )
          ],
        ),
      ),
    );
  }

  void popupButtonSelected(String value){
    print(value);
  }

  void popupMenuSelected(String value){
    print(value);
  }
}
