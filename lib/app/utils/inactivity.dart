import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: InactiveScreen(),
    );
  }
}

class InactiveScreen extends StatefulWidget {
  @override
  _InactiveScreenState createState() => _InactiveScreenState();
}

class _InactiveScreenState extends State<InactiveScreen> {
  Timer? _timer;

  void _resetTimer() {
    _timer?.cancel();
    _timer = Timer(Duration(minutes: 5), () {
      // handle inactivity here
      print('User inactive for 5 minutes');
    });
  }

  void _onUserInteraction([_]) {
    _resetTimer();
  }

  @override
  void initState() {
    super.initState();
    _resetTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onUserInteraction,
      onPanDown: _onUserInteraction,
      onScaleEnd: _onUserInteraction,
      child: Scaffold(
        appBar: AppBar(
          title: Text('User Inactivity Example'),
        ),
        body: Center(
          child: Text('Tap or interact with the screen to reset the timer.'),
        ),
      ),
    );
  }
}
