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

  // 이미지 위젯에 설정할 변수
  String _image1 = 'assets/images/900.png';
  String _image2 = 'assets/images/placeholder.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // 세로형 배치 위젯
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              // HTML의 %와 같이 위젯의 비율(가중치)를 결정
              flex: 5,
              child: Container(
                // 마진, 패딩, 컬러, 정렬 지정
                margin: const EdgeInsets.all(0.0),
                padding: const EdgeInsets.all(0.0),
                color: Colors.cyan,
                alignment: Alignment.topLeft,
                // 컨테이너의 자식으로 이미지 추가
                child: Image.asset(
                  _image1,
                  alignment: Alignment.topLeft,
                  // alignment: Alignment.topCenter,
                  // alignment: Alignment.bottomRight,
                  // 이미지의 원본 크기로 설정
                  fit:BoxFit.none,
                  width: 390.0,
                  height: 250.0,
                ),
              ),
            ),
            Container(
              // 마진을 4방향 각각 설정
              margin: const EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 10),
              // 패딩은 한꺼번에 설정
              padding: const EdgeInsets.all(0.0),
              color: Colors.white,
              // width: 300,
              // height: 100,
              // alignment: Alignment.center,
              // 아이콘 버튼이 가로형으로 배치된다.
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.upload_sharp),
                    tooltip: "이미지 위로 이동",
                    iconSize: 50.0,
                    // 버튼 클릭시 람다형식으로 함수 호출
                    onPressed: () => _onClick1(),
                  ),
                  // 사이즈박스로 중간에 간격을 20 띄움
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(Icons.download_sharp),
                    tooltip: "이미지 아래로 이동",
                    iconSize: 50.0,
                    onPressed: () => _onClick2(),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: const EdgeInsets.all(0.0),
                padding: const EdgeInsets.all(0.0),
                color: Colors.cyan,
                alignment: Alignment.topLeft,
                child: Image.asset(
                  _image2,
                  alignment: Alignment.topLeft,
                  // fit:BoxFit.none,
                  width: 390.0,
                  height: 250.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /* 상태변경을 위해 사용하는 메서드로 특정 변수를 변경시키면 화면이
  리렌더링되면서 변경된 화면을 볼 수 있다. */
  void _onClick1() {
    setState(() {
      _image1 = 'assets/images/900.png';
      _image2 = 'assets/images/placeholder.png';
    });
  }

  void _onClick2() {
    setState(() {
      _image1 = 'assets/images/placeholder.png';
      _image2 = 'assets/images/900.png';
    });
  }

}
