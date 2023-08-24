import 'package:flutter/material.dart';
import 'package:ososstestapp/main_screen.dart';
import 'di.dart' as di;

void main() async {
  await di.init();
  runApp(const OsossTestApp());
}

class OsossTestApp extends StatefulWidget {
  const OsossTestApp({Key? key}) : super(key: key);

  @override
  State<OsossTestApp> createState() => _OsossTestAppState();
}

class _OsossTestAppState extends State<OsossTestApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}
