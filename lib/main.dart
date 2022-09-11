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
      body: Container(
        padding: EdgeInsets.only(left: 24, top: 20),
        child: StepTracker(steps: [
          Steps(title: Text("Order Placed"), state: TrackerState.complete),
          Steps(title: Text("Shipped"), state: TrackerState.complete),
          Steps(title: Text("Out of delivery"), state: TrackerState.complete),
          Steps(title: Text("Deliverd"), state: TrackerState.complete),
        ]),
      ),
    );
  }
}
