import 'package:athijeevana/screens/StartScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AthiJeevanaMain());
}

class AthiJeevanaMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: StartScreen());
  }
}
