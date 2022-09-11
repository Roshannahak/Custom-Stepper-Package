import 'package:flutter/material.dart';

enum TrackerState {
  none,
  complete,
  disabled,
}

class StepTracker extends StatelessWidget {
  const StepTracker(
      {Key? key,
      required this.steps,
      this.dotSize = 9,
      this.stepHeight = 25.0});

  final List<Steps> steps;
  final double dotSize;
  final double stepHeight;

  Color dotColor(int index) {
    TrackerState state = steps[index].state;
    switch (state) {
      case TrackerState.complete:
        return Colors.green;
      case TrackerState.disabled:
        return Colors.red;
      case TrackerState.none:
        return Colors.grey;
    }
  }

  Widget _buildDot(int index) {
    return ClipOval(
      child: ClipOval(
          child: Container(
        height: dotSize,
        width: dotSize,
        decoration: BoxDecoration(color: dotColor(index)),
      )),
    );
  }

  Widget _buildVerticalHeader(int index) => Row(
        children: [_buildDot(index), SizedBox(width: 10), steps[index].title],
      );

  Widget _buildVertical() => ListView.separated(
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => SizedBox(
            child: _buildVerticalHeader(index),
          ),
      separatorBuilder: (context, index) => Align(
          alignment: Alignment.centerLeft,
          child: Container(
              height: stepHeight,
              margin: EdgeInsets.only(left: dotSize / 2.2),
              child: VerticalDivider(
                  thickness: 1.5, width: 1, color: dotColor(index)))),
      itemCount: steps.length);

  @override
  Widget build(BuildContext context) {
    return _buildVertical();
  }
}

class Steps {
  const Steps({Key? key, required this.title, this.state = TrackerState.none});

  final Text title;
  final TrackerState state;
}
