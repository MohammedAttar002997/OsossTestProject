import 'package:flutter/material.dart';
import 'package:ososstestapp/main_screen.dart';

void main() {
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
