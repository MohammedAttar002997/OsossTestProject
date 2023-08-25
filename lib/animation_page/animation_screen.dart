import 'package:flutter/material.dart';

class AnimationsPage extends StatefulWidget {
  final String name;

  const AnimationsPage({
    super.key,
    required this.name,
  });

  @override
  AnimationsPageState createState() => AnimationsPageState();
}

class AnimationsPageState extends State<AnimationsPage> {
  double _width = 300;
  double _height = 300;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Animations Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.name == ""
                  ? "Hello, sorry no text available for now"
                  : widget.name,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            const Spacer(),
            Center(
              child: AnimatedContainer(
                width: _width,
                height: _height,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: _borderRadius,
                ),
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
              ),
            ),
            const SizedBox(height: 20),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(
                      () {
                        _width = 250;
                        _height = 250;
                        _color = Colors.redAccent;
                        _borderRadius = BorderRadius.circular(150);
                        // _boxShape = BoxShape.circle;
                      },
                    );
                  },
                  child:
                      // ShapeButtonWidget(
                      //   height: 90,
                      //   width: 90,
                      //   shapeColor: Colors.redAccent,
                      //   boxShape: BoxShape.circle,
                      // ),

                      Container(
                    height: 90,
                    width: 90,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _width = 300;
                      _height = 300;
                      _borderRadius = const BorderRadius.all(
                        Radius.circular(40.0),
                      );
                      _color = Colors.blueAccent;
                      // _boxShape = BoxShape.rectangle;
                    });
                  },
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _width = 250;
                      _height = 250;
                      _borderRadius = const BorderRadius.all(
                        Radius.circular(1.0),
                      );
                      _color = Colors.indigo;
                      // _boxShape = BoxShape.rectangle;
                    });
                  },
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.indigo,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
