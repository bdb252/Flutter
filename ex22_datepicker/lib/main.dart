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

  // 별도의 설정 없이도 로컬 시간이 표시된다.
  String _selectedDate = DateTime.now().toString();

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
            // 현재 날짜 혹은 선택한 날짜 출력
            Text('$_selectedDate', style: TextStyle(fontSize: 30)),
            ElevatedButton(
              child: const Text('Show DatePicker',
              style: TextStyle(fontSize: 24)),
              onPressed: () => selectDate(),
            ),
          ],
        ),
      ),
    );
  }

  // 현재 날짜를 표시하기 위해 날짜를 구해서 반환
  DateTime selectNowDate(){
    // 현재 시각을 얻어옴
    DateTime _now = DateTime.now();
    if (_now.weekday == 6){
      // 오늘이 토요일이면 2일을 더함
      _now = _now.add(Duration(days: 2));
    }else if(_now.weekday == 7){
      // 오늘이 일요일이면 1일을 더함
      _now = _now.add(Duration(days: 1));
    }
    /* 즉 오늘이 평일인 경우에는 그대로 반환하고, 주말인 경우에는 
    돌아오는 월요일의 날짜를 계산해서 반환해준다. */ 
    return _now;
  }

  // 특정 날짜, 요일 등을 활성화/ 비활성화시키는 메서드
  bool _predicate(DateTime day){

    /** 
    isAfter()와 isBefore()를 통해 활성화할 날짜의 범위를 설정할 수 있다.
    단 오늘 날짜가 포함된 범위로 지정해야 문제없이 앱을 실행할 수 있다. */
    // if ((day.isAfter(DateTime(2025,7,1)) && 
    //   day.isBefore(DateTime(2025,7,8)))){
    //     return true; //활성화
    //   }

    // 토, 일요일은 비활성화
    if (day.weekday != 6 && day.weekday != 7) {
      //매달 25일 비활성화
      if(day != DateTime(day.year, day.month, 25)){
        return true;
      }
      return true;
    }

    // 매달 1일부터 리스트에 설정된 날짜까지를 비활성화
    // List days = [1,2,3,4,5,6,7];
    // if (!days.contains(day.day.toInt())){
    //   return true;
    // }

    return false;
  }

  Future selectDate() async {
    DateTime _now = DateTime.now();

    DateTime? picked = await showDatePicker(
      context: context, 
      // initialDatePickerMode: DatePickerMode.year,
      // 초기날짜. 메서드를 통해 표시.
      initialDate: selectNowDate(),
      // 선택 가능한 년도의 시작(2년전)
      firstDate: DateTime(_now.year - 2), 
      // 종료 년도(2년 후)
      lastDate: DateTime(_now.year + 2),
      // 달력의 날짜 비활성화 설정(메서드 호출을 통해 설정됨)
      selectableDayPredicate: _predicate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          // ThemeData.light(), ThemeData.dark()
          data: ThemeData(primarySwatch: Colors.pink),
          child: child!,
        );
      },
    );
    // 날짜를 선택 후 OK를 누를때 표시된 날짜를 변경한다. 
    if (picked != null){
      setState(() {
        _selectedDate = picked.toString().substring(0,10);
      });
    }
  }
}
