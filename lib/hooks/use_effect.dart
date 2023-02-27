import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UseEffectHooksScreen extends HookWidget {
  const UseEffectHooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();
    //Future・Streamを使う際は必ず先にuseMemorizedをかます必要があるようだ（複数回呼び出し回避のためだそう）
    //https://github.com/rrousselGit/flutter_hooks/issues/132
    //https://pub.dev/documentation/flutter_hooks/latest/flutter_hooks/useMemoized.html
    final future = useMemoized(() => _getData());
    final futureSnapshot = useFuture(future, initialData: "");

    //useEffect = initState + dispose
    //https://pub.dev/documentation/flutter_hooks/latest/flutter_hooks/useEffect.html
    useEffect(
      () {
        //initStateでやることをここに書く
        textController.text = futureSnapshot.data ?? "";
        //disposeでやることをreturn文に書く
        return () => _setData(textController.text);
      },
      //モニタリングしている値に変更があった場合に再描画したい場合はこのList内に記載
      // （なければ変更があっても再描画しない：didWidgetUpdates）
      [futureSnapshot],
    );

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
            controller: textController,
          ),
        ),
      ),
    );
  }

  Future<String> _getData() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getString("data") ?? "データなし";
  }

  void _setData(String data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("data", data);
  }
}
