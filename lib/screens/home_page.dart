// ignore_for_file: avoid_print

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircularCountDownTimer(
                duration: 3600,
                initialDuration: 0,
                controller: CountDownController(),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                ringColor: Colors.black26,
                ringGradient: null,
                fillColor: Colors.deepOrangeAccent,
                fillGradient: null,
                backgroundColor: Colors.teal[600],
                backgroundGradient: null,
                strokeWidth: 20.0,
                strokeCap: StrokeCap.round,
                textStyle: const TextStyle(
                    fontSize: 33.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textFormat: CountdownTextFormat.MM_SS,
                isReverse: true,
                isReverseAnimation: false,
                isTimerTextShown: true,
                autoStart: true,
                onStart: () {},
                onComplete: () {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton(icon: Icons.restart_alt_outlined),
                  _buildButton(icon: Icons.play_arrow_outlined),
                  _buildButton(icon: Icons.cancel_outlined),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  IconButton _buildButton({required IconData icon}) {
    return IconButton(onPressed: () => print('pressed'), icon: Icon(icon));
  }
}
