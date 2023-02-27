import 'package:flutter/material.dart';
import 'package:hooks_sample/hooks/use_effect.dart';
import 'package:hooks_sample/hooks/use_state.dart';
import 'package:hooks_sample/hooks/use_stream.dart';
import 'package:hooks_sample/no_hooks/use_effect.dart';
import 'package:hooks_sample/no_hooks/use_state.dart';
import 'package:hooks_sample/no_hooks/use_stream.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isUseHooks = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: (_isUseHooks) ? Icon(Icons.alarm_off) : Icon(Icons.alarm_on),
        onPressed: () {
          setState(() {
            _isUseHooks = !_isUseHooks;
          });
        },
      ),
      appBar: AppBar(
        title: Text(_isUseHooks ? "Hooksがあるとき〜" : "Hooksがないとき〜"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                title: Text("useState"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => (_isUseHooks)
                        ? UseStateHooksScreen()
                        : UseStateNoHooksScreen(),
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("useEffect"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => (_isUseHooks)
                        ? UseEffectHooksScreen()
                        : UseEffectNoHooksScreen(),
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("useStream"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => (_isUseHooks)
                        ? UseStreamHooksScreen()
                        : UseStreamNoHooksScreen(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
