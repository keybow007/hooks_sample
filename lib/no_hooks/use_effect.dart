import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UseEffectNoHooksScreen extends StatefulWidget {
  const UseEffectNoHooksScreen({Key? key}) : super(key: key);

  @override
  State<UseEffectNoHooksScreen> createState() => _UseEffectNoHooksScreenState();
}

class _UseEffectNoHooksScreenState extends State<UseEffectNoHooksScreen> {

  final _textController = TextEditingController();

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  void dispose() {
    _setData(_textController.text);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("useEffect Sample"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: TextField(
            decoration: InputDecoration(border: OutlineInputBorder()),
            textAlign: TextAlign.center,
            controller: _textController,
          ),
        ),
      ),
    );
  }

  Future<void> _getData() async {
    final prefs = await SharedPreferences.getInstance();
    _textController.text = await prefs.getString("data") ?? "データなし";
    setState(() {});
  }

  void _setData(String data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("data", data);
  }
}