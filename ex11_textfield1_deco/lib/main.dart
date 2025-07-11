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
  // 커스텀 카운터와 입력값 확인용 변수
  int _count = 0;
  String _myText = "TextField 꾸미기 예제입니다.";
  // 컨트롤러 인스턴스 생성
  final ctlMyText1 = TextEditingController();
  final ctlMyText2 = TextEditingController();

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
          children: <Widget>[
            // 텍스트 위젯 : 기본문구 출력
            Text(
              _myText,
              style: const TextStyle(fontSize: 30.0),
            ),
            const SizedBox(
              height: 20,
            ),
            /* 입력값이 없는 텍스트 필드. SizedBox를 통해 크기 지정이
            안되었으므로 가로 전체 영역에 표시됨. */
            TextField(
              controller: ctlMyText1,
            ),
            const SizedBox(
              height: 20,
            ),
            // 입력된 텍스트의 길이를 출력하는 커스텀 카운터 (개발자 정의)
            Text(
              '$_count / 10',
              style: const TextStyle(
                fontSize: 30.0,
                color: Colors.blueAccent,
              ),
            ),
            // 텍스트필드의 너비를 SizedBox를 통해 지정
            SizedBox(
              width: 240,
              child: TextField(
                // 컨트롤러 지정
                controller: ctlMyText2,
                // 커서의 색깔과 두께
                // cursorColor: Colors.red,
                // cursorWidth: 4.0,
                // 입력할 문자의 최대길이 지정
                maxLength: 10,
                // 입력문자 숨김 처리 (type=password속성과 동일)
                obscureText: true,
                // 활성화 여부 설정
                enabled: true,
                /* 키보드의 타입으로 텍스트필드에 포커싱되면 자동으로
                키보드가 올라온다. 일반적인 qwerty나 이메일, 숫자형식 등으로
                변경할 수 있다. */
                // keyboardType: TextInputType.number,
                // keyboardType: TextInputType.emailAddress,
                // 텍스트필드의 테두리나 아이콘에 대한 스타일 설정
                decoration: const InputDecoration(
                  // 입력을 위해 포커싱 되었을때 테두리 색깔
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                          BorderSide(color: Colors.greenAccent, width: 1.0),
                  ),
                  // 활성화 여부에 따른 테두리 색깔
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  prefixIcon: Icon(Icons.perm_identity),
                  // prefixText: 'fix',
                  // 플로딩 되는 입력 힌트
                  labelText: 'Password',
                  // 입력상자 하단에 표시되는 입력 힌트
                  // helperText: '비밀번호를 입력하세요',
                  /* 디폴트로 제공되는 카운터를 숨김처리 한다.
                  주석처리하면 박스 하단에 보여진다. */
                  // counterText: '',
                  counterStyle: TextStyle(
                    fontSize: 30.0,
                    color: Colors.amber,
                  ),
                ),
                // 입력값이 변할때마다 이벤트 발생됨
                onChanged: (text) {
                  /* 입력된 텍스트의 길이를 얻어와서 변수에 할당한 후
                  화면을 리렌더링 한다. */
                  setState(() {
                    _count = text.length;
                  });
                  print('$text - $_count');
                },
                // 포커싱된 상태에서 엔터키를 누르면 이벤트 발생됨
                onSubmitted: (text) {
                  print('onSubmitted : $text');
                },
              ),
            ),
            OutlinedButton(
              child: const Text(
                '텍스트지우기',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              /* 입력값이 없는 텍스트필드의 내용을 얻어와서 변수에 할당한다.
              즉, 빈 텍스트를 할당하는 것이므로, 텍스트를 지우는 역할을 한다. */
              onPressed: () {
                setState(() {
                  _myText = ctlMyText1.text;
                });
              },
            )
          ],
        ),
      ),
      // 플로팅 버튼을 누르면 입력된 값이 텍스트 위젯에 적용된다.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _myText = ctlMyText2.text;
          });
        },
        tooltip: 'TextFiend Submit',
        child: const Icon(Icons.send),
      ),
    );
  }
}
