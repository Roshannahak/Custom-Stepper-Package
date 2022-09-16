import 'package:flutter/material.dart';
import 'package:stepper_package/step_tracker.dart';

void main() => runApp(MaterialApp(
      title: "stepper package",
      debugShowCheckedModeBanner: false,
      home: StepperPage(),
    ));

class StepperPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: Text("Stepper Page"),
      ),
      body: StepTracker(
          stepTrackerType: StepTrackerType.indexedHorizontal,
          steps: [
            Steps(
                title: Text("Order Placed"),
                description:
                    "your order is placed and confirmed by seller, your order is placed and confirmed by seller",
                state: TrackerState.complete),
            Steps(
                title: Text("Shipped"),
                description:
                    "your order is placed and confirmed by seller, your order is placed and confirmed by seller",
                state: TrackerState.complete),
            Steps(title: Text("Out of delivery"), state: TrackerState.none),
            Steps(title: Text("Deliverd"), state: TrackerState.none),
          ]),
    );
  }
}
