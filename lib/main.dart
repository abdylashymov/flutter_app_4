import 'package:flutter/material.dart';

void main() {
  runApp(const Welcome());
}

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  Brightness _brightness = Brightness.light;

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            brightness: _brightness,
            seedColor: Colors.yellow,
            primary: Colors.yellow),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark,
            seedColor: Colors.yellow,
            primary: Colors.yellow),
      ),
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                if (_brightness == Brightness.light) {
                  _brightness = Brightness.dark;
                } else {
                  _brightness = Brightness.light;
                }
                setState(() {});
              },
              icon: Icon(_brightness == Brightness.light
                  ? Icons.dark_mode
                  : Icons.light_mode),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 40.0, right: 40),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Атыңызды жазыңыз',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40),
                child: TextField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    hintText: 'Парольду жазыңыз',
                    suffix: IconButton(
                      onPressed: () {
                        _obscureText = !_obscureText;

                        setState(() {});
                      },
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.all(Radius.zero),
                  ),
                ),
                child: const Text(
                  'ENTER',
                  style: TextStyle(),
                ),
              ),
              const SizedBox(
                height: 90,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
