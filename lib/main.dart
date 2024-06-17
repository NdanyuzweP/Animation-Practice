import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnimationWidget(),
    );
  }
}

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({super.key});
  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget> {
  bool _shouldAnimate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              width: _shouldAnimate ? 200 : 100,
              height: _shouldAnimate ? 200 : 100,
              color: _shouldAnimate ? Colors.blue : Colors.red,
              transform: Matrix4.rotationZ(_shouldAnimate ? 0.5 : 0),
              child: const Center(
                child: Text(
                  'Tap Me',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _shouldAnimate = !_shouldAnimate;
                });
              },
              child: const Text('Animate!'),
            ),
          ],
        ),
      ),
    );
  }
}
