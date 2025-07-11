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
  // 현재 시간 가져오기
  TimeOfDay _selectedTime = TimeOfDay.now();

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
            // 멤버변수에 설정된 시간객체로 시와 분을 출력
            Text('${_selectedTime.hour}:${_selectedTime.minute}',
            style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              child: const Text('Show DatePicker',
              style: TextStyle(fontSize: 24)),
              onPressed: () => selectTime(), 
            ),
          ],
        ),
      ),
    );
  }

  Future selectTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context, 
      // 시간 초기화
      initialTime: TimeOfDay.now(),
      // ## -------------------------------
      builder: (BuildContext context, Widget? child){
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              // ### change the border color
              primary: Colors.pink,
              // ### change the text color
              onSurface: Colors.blue,
            ),
            // button colors
            buttonTheme: ButtonThemeData(
              colorScheme: ColorScheme.light(
                primary: Colors.green,
              ),
            ),
          ), 
          child: child!
        );
      },
    );
    // 시간을 선택하면 멤버변수를 변경한 후 리렌더링
    if (picked != null){
      setState(() {
        _selectedTime = picked;
      });
    }
  }
}
