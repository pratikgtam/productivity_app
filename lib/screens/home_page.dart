import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:productivity_app/model/interval_model.dart';
import 'package:productivity_app/screens/timer_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<IntervalModel> intervals = [
    IntervalModel(intervalType: 'Work', durationInMinutes: 30),
    IntervalModel(intervalType: 'Rest', durationInMinutes: 5)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Duration'),
      ),
      body: Column(
          children: List.generate(intervals.length,
              (index) => _buildIntervalText(interval: intervals[index]))),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        child: ElevatedButton(
          onPressed: _handlePress,
          child: const Text('Next'),
        ),
      ),
    );
  }

  Widget _buildIntervalText({required IntervalModel interval}) {
    return Builder(
      builder: (context) => InkWell(
        onTap: () async {
          var resultingDuration = await showDurationPicker(
            context: context,
            initialTime: Duration(minutes: interval.durationInMinutes),
          );
          setState(() {
            interval.durationInMinutes = resultingDuration!.inMinutes;
          });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  'Selected ${interval.intervalType} duration: ${interval.durationInMinutes} minutes')));
        },
        child: Container(
          margin: const EdgeInsets.all(12),
          color: Colors.black12,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${interval.intervalType} Interval (minutes)',
              ),
              Text(interval.durationInMinutes.toString())
            ],
          ),
        ),
      ),
    );
  }

  void _handlePress() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TimerPage(intervals: intervals),
        ));
  }
}
