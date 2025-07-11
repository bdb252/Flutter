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
        primarySwatch: Colors.blue,
      ),
      // 개발자가 직접 정의한 Page1 클래스를 이용해서 첫화면 구성
      home: const Page1(),
    );
  }
}

/**
stful 스니펫을 통해 자동생성한 클래스를 통해 새로운 페이지를 구성한다.
Page1과 _Page1State가 함께 생성된다. 
 */
class Page1 extends StatefulWidget {
  const Page1({ Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    // 콘솔에 페이지 정보 출력
    print('Page1');
    return Scaffold(
      appBar: AppBar(
        // 앱바에 페이지명 표시
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('2페이지 추가',
              style: TextStyle(fontSize: 24)),
              onPressed: () {
                /* 1페이지에는 아무것도 없는 상태이므로 2페이지를 Stack에 추가하는 기능만 있다.
                버튼을 누르면 두번째 페이지를 팝업과 같이 스택에 추가하게 된다. */ 
                Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => const Page2()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({ Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    print('Page2');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /* 
            새로운 페이지를 Stack에 추가한다. push()를 통해 추가된 페이지는
            좌상간에 Back(제거)버튼이 자동으로 생성된다. */ 
            ElevatedButton(
              child: const Text('3페이지 추가',
              style: TextStyle(fontSize: 24)),
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const Page3()),
                );
              },
            ),
            /* 페이지를 Stack에서 제거한다. */ 
            ElevatedButton(
              child: const Text('2페이지 제거',
                  style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed: () {
                print('Page2 - pop');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Page3 extends StatefulWidget {
  const Page3({ Key? key}) : super(key: key);

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    print('Page3');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Page 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('3페이지 제거',
                  style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed: () {
                print('Page3 - pop');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}