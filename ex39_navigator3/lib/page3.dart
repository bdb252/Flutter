import 'package:flutter/material.dart';
import 'page2.dart';

class Page3 extends StatefulWidget {
  String data = '';

  Page3({Key? key, required this.data}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 3')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              // Page3에서 제거하는 코드는 Page2와 동일하게 작성되어 있다. 
              child: const Text('3페이지 제거', style: TextStyle(fontSize: 24)),
              // Page3을 제거하면서 보내는 값은 Page1에서는 출력되지 않는다. 
              onPressed: () {
                Navigator.pop(context, '3페이지에서 보냄(pop)');
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('2페이지로 변경', style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context, 
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => Page2(
                      data: '3페이지에서 보냄(Replacement)',
                    ),
                    transitionDuration:  const Duration(seconds: 0),
                  ),
                );
              },
            ),
            Text(widget.data, style: const TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
