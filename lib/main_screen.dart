import 'package:flutter/material.dart';
import 'package:ososstestapp/animation_page/animation_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _name = TextEditingController();
  final double spaceValue = 12.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: spaceValue,
            ),
            TextFormField(
              controller: _name,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 3, //<-- SEE HERE
                    color: Colors.blueAccent,
                  ),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                hintText: "Enter your name",
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 3, //<-- SEE HERE
                    color: Colors.blueAccent,
                  ),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              onFieldSubmitted: (String value) {
                setState(() {
                  _name.text = value;
                });
              },
            ),
            SizedBox(
              height: spaceValue,
            ),
            const Spacer(),
            Column(
              children: [
                Text(
                  _name.text == "" ? "No value yet" : _name.text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: spaceValue,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    // side: BorderSide(color: Colors.yellow, width: 5),
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.normal),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                  onPressed: () {
                    setState(() {
                      _name.text = "";
                    });
                  },
                  child: const Text(
                    "Clear Text",
                  ),
                ),
                ButtonBar(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AnimationsPage(
                                name: _name.text,
                              );
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        // side: BorderSide(color: Colors.yellow, width: 5),
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontStyle: FontStyle.normal),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                      ),
                      child: const Text("Animation Screen"),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        // side: BorderSide(color: Colors.yellow, width: 5),
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontStyle: FontStyle.normal),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                      child: const Text("Pokemon Screen"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
