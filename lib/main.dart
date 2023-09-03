import 'package:flutter/material.dart';
import 'package:aetracker/ae/mapp.dart';
import 'package:aetracker/ae/aeexpenses.dart';
// import 'package:flutter/services.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then(
  //   (ae) {
  runApp(
    const MApp(
      hm: AEExpenses(),
    ),
  );
  //   },
  // );
}
