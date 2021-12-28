import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Color color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
              width: 120,
              height: 120,
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24)),
                onPressed: () => pickColor(context),
                child: Text(
                  "Pick Color",
                  style: TextStyle(fontSize: 24),
                ))
          ],
        ),
      ),
    );
  }

  Widget buildColorPicker3() => SlidePicker(
      pickerColor: color,
      enableAlpha: true,
      showLabel: true,
      onColorChanged: (color) {
        setState(() {
          this.color = color;
        });
      });

  Widget buildColorPicker2() => BlockPicker(
          availableColors: [
            Colors.green,
            Colors.orange,
            Colors.blue,
            Colors.pink,
            Colors.yellow,
            Colors.cyanAccent,
          ],
          pickerColor: color,
          onColorChanged: (color) {
            setState(() {
              this.color = color;
            });
          });

  Widget buildColorPicker() => ColorPicker(
      pickerColor: color,
      enableAlpha: false,
      showLabel: false,
      onColorChanged: (color) {
        setState(() {
          this.color = color;
        });
      });

  void pickColor(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Pick YOur Color"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildColorPicker3(),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      "SELECT",
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            ),
          ));
}
