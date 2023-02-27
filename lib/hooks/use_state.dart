import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/*
* useState = ValueNotifier
* https://pub.dev/documentation/flutter_hooks/latest/flutter_hooks/useState.html
*
* */


/// First, instead of a StatefulWidget, use a HookWidget instead!
class UseStateHooksScreen extends HookWidget {
  const UseStateHooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("[UseStateHooksScreen] buildメソッド走ってるで〜");

    // Next, invoke the `useState` function with a default value to create a
    // `counter` variable that contains a `value`. Whenever the value is
    // changed, this Widget will be rebuilt!
    //  => Hooksはbuildメソッドの中だけでしか使ってはいけない
    //      https://github.com/rrousselGit/flutter_hooks/tree/master/packages/flutter_hooks#rules
    final counter = useState(0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('useState example'),
      ),
      body: Center(
        // Read the current value from the counter
        child: Text('Button tapped ${counter.value} times'),
      ),
      floatingActionButton: FloatingActionButton(
        // When the button is pressed, update the value of the counter! This
        // will trigger a rebuild, displaying the latest value in the Text
        // Widget above!
        onPressed: () => counter.value++,
        child: const Icon(Icons.add),
      ),
    );
  }
}

