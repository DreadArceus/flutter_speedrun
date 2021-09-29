import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Speedrun',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(sz: 25.5),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.sz}) : super(key: key);

  final double sz;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _message = "Type something and submit";
  final myController = TextEditingController();

  void handleSubmit() {
    if (myController.text == "") {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text("Dont leave it empty bruh"),
            );
          });
    } else {
      setState(() {
        _message = myController.text;
        myController.text = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YEPPERS'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: myController,
              maxLength: 20,
              decoration: const InputDecoration(
                  constraints: BoxConstraints(maxWidth: 300)),
            ),
            Container(
              padding: const EdgeInsets.only(right: 10, top: 30),
              child: Text(
                _message,
                style: TextStyle(fontSize: widget.sz),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: handleSubmit,
        child: const Icon(Icons.send),
      ),
    );
  }
}
