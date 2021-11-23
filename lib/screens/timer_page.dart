// ignore_for_file: avoid_print

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:productivity_app/model/interval_model.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({
    Key? key,
    required this.intervals,
  }) : super(key: key);
  final List<IntervalModel> intervals;
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productivity'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircularCountDownTimer(
                duration: widget.intervals[0].durationInMinutes * 60,
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
