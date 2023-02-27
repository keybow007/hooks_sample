import 'package:flutter/material.dart';

class UseStateNoHooksScreen extends StatefulWidget {
  const UseStateNoHooksScreen({Key? key}) : super(key: key);

  @override
  State<UseStateNoHooksScreen> createState() => _UseStateNoHooksScreenState();
}

class _UseStateNoHooksScreenState extends State<UseStateNoHooksScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('useState No Hook'),
      ),
      body: Center(
        // Read the current value from the counter
        child: Text('Button tapped ${_counter} times'),
      ),
      floatingActionButton: FloatingActionButton(
        // When the button is pressed, update the value of the counter! This
        // will trigger a rebuild, displaying the latest value in the Text
        // Widget above!
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
