import 'package:flutter/material.dart';

class UseStreamNoHooksScreen extends StatefulWidget {
  const UseStreamNoHooksScreen({Key? key}) : super(key: key);

  @override
  State<UseStreamNoHooksScreen> createState() => _UseStreamNoHooksScreenState();
}

class _UseStreamNoHooksScreenState extends State<UseStreamNoHooksScreen> {

  Stream<int>? _counterStream;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _counterStream = Stream.periodic(Duration(seconds: 1), (i) {
      return _counter++;
    });
  }

  @override
  void dispose() {
    _counterStream = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('useStream No Hooks'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _counterStream,
          builder: (context, snapshot) {
            return Text(
              '${snapshot.data ?? 0}',
              style: const TextStyle(fontSize: 36),
            );
          },
        ),
      ),
    );
  }
}
